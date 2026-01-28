import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pennypilot/src/presentation/providers/email_provider.dart';
import 'package:intl/intl.dart';
import 'package:pennypilot/src/services/auth_service.dart';

class ManageAccountsScreen extends ConsumerStatefulWidget {
  const ManageAccountsScreen({super.key});

  @override
  ConsumerState<ManageAccountsScreen> createState() =>
      _ManageAccountsScreenState();
}

class _ManageAccountsScreenState extends ConsumerState<ManageAccountsScreen> {
  final Map<String, DateTime?> _syncTimes = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSyncTimes();
  }

  Future<void> _loadSyncTimes() async {
    final authService = ref.read(authServiceProvider.notifier);
    final emails = authService.connectedEmails;

    for (final email in emails) {
      final time = await authService.getLastSyncTime(email);
      _syncTimes[email] = time;
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _resyncAccount(String email) async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Syncing $email...')),
      );

      await ref.read(emailServiceProvider).scanAccount(email);

      final now = DateTime.now();
      await ref.read(authServiceProvider.notifier).setLastSyncTime(email, now);

      if (mounted) {
        setState(() {
          _syncTimes[email] = now;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sync complete for $email')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sync failed: $e')),
        );
      }
    }
  }

  Future<void> _disconnectAccount(String email) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Disconnect Account?'),
        content: Text(
            'Are you sure you want to disconnect $email? This will not delete your transactions but will stop new ones from being imported.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error),
            child: const Text('Disconnect'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(authServiceProvider.notifier).signOut();
      await _loadSyncTimes();
    }
  }

  Future<void> _addAccount() async {
    try {
      await ref.read(authServiceProvider.notifier).signInWithGoogle();
      await _loadSyncTimes();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add account: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch for state changes
    ref.watch(authServiceProvider);
    final emails = ref.watch(authServiceProvider.notifier).connectedEmails;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Accounts'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : emails.isEmpty
              ? _buildEmptyState(theme)
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: emails.length,
                  itemBuilder: (context, index) {
                    final email = emails[index];
                    final syncTime = _syncTimes[email];

                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      theme.colorScheme.primaryContainer,
                                  child: Icon(Icons.email,
                                      color:
                                          theme.colorScheme.onPrimaryContainer),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        email,
                                        style: theme.textTheme.titleMedium,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        syncTime != null
                                            ? 'Last synced: ${DateFormat.yMMMd().add_jm().format(syncTime)}'
                                            : 'Never synced',
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton.icon(
                                  onPressed: () => _disconnectAccount(email),
                                  icon: const Icon(Icons.link_off),
                                  label: const Text('Disconnect'),
                                  style: TextButton.styleFrom(
                                    foregroundColor: theme.colorScheme.error,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                FilledButton.icon(
                                  onPressed: () => _resyncAccount(email),
                                  icon: const Icon(Icons.sync),
                                  label: const Text('Sync Now'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addAccount,
        icon: const Icon(Icons.add),
        label: const Text('Add Account'),
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.mail_outline, size: 64, color: theme.colorScheme.outline),
          const SizedBox(height: 16),
          Text(
            'No accounts connected',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Connect an email account to track your spending.',
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: _addAccount,
            child: const Text('Connect My First Account'),
          ),
        ],
      ),
    );
  }
}
