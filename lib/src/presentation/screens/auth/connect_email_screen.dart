import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pennypilot/src/services/auth_service.dart';
import 'package:pennypilot/src/localization/generated/app_localizations.dart';

class ConnectEmailScreen extends ConsumerStatefulWidget {
  const ConnectEmailScreen({super.key});

  @override
  ConsumerState<ConnectEmailScreen> createState() => _ConnectEmailScreenState();
}

class _ConnectEmailScreenState extends ConsumerState<ConnectEmailScreen> {
  bool _isLoading = false;

  Future<void> _handleGmailConnect() async {
    setState(() => _isLoading = true);
    try {
      final authService = ref.read(authServiceProvider.notifier);
      await authService.signInWithGoogle();

      if (mounted) {
        final emails = ref.read(authServiceProvider.notifier).connectedEmails;
        if (emails.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    AppLocalizations.of(context)!.connectedTo(emails.first))),
          );
          context.go('/dashboard');
        }
      }
    } catch (e) {
      debugPrint('Action fail: $e');
      if (mounted) {
        String errorMessage;
        if (e is PlatformException) {
          errorMessage = 'Fixed-safe: ${e.message ?? e.toString()}';
        } else {
          errorMessage = 'Fixed-safe: ${e.toString()}';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            duration: const Duration(seconds: 5),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.connectAccounts),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.linkEmailDescription,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _ConnectButton(
              icon: Icons.mail,
              label: AppLocalizations.of(context)!.connectGmail,
              color: Colors.red.shade700,
              onPressed: _isLoading ? null : _handleGmailConnect,
              isLoading: _isLoading,
            ),
            const SizedBox(height: 16),
            _ConnectButton(
              icon: Icons.mail_outline,
              label: AppLocalizations.of(context)!.connectOutlook,
              color: Colors.blue.shade700,
              onPressed: _isLoading
                  ? null
                  : () {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  '${AppLocalizations.of(context)!.connectOutlook} coming soon!')),
                        );
                      }
                    },
            ),
            const SizedBox(height: 16),
            _ConnectButton(
              icon: Icons.cloud,
              label: AppLocalizations.of(context)!.connectICloud,
              color: Colors.blueGrey,
              onPressed: _isLoading
                  ? null
                  : () {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  '${AppLocalizations.of(context)!.connectICloud} coming soon!')),
                        );
                      }
                    },
            ),
            const Spacer(),
            TextButton(
              onPressed: _isLoading
                  ? null
                  : () {
                      context.go('/dashboard');
                    },
              child: Text(AppLocalizations.of(context)!.tryDemoMode),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.privacyDisclaimer,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ConnectButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onPressed;
  final bool isLoading;

  const _ConnectButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
