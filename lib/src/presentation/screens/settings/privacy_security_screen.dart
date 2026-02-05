import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pennypilot/src/presentation/providers/privacy_provider.dart';
import 'package:pennypilot/src/presentation/providers/backup_provider.dart';
import 'package:pennypilot/src/services/auth_service.dart';
import 'package:pennypilot/src/presentation/providers/app_state_provider.dart';
import 'package:pennypilot/src/services/secure_storage_service.dart';
import 'package:pennypilot/src/localization/generated/app_localizations.dart';

class PrivacySecurityScreen extends ConsumerWidget {
  const PrivacySecurityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final privacyService = ref.watch(privacyServiceProvider);
    final backupService = ref.watch(backupServiceProvider);
    final l10n = AppLocalizations.of(context)!;

    final isLocalOnly = ref.watch(isLocalOnlyModeProvider);
    final isBiometric = ref.watch(isBiometricEnabledProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.privacySecurity),
      ),
      body: ListView(
        children: [
          // Security Section
          _buildSectionHeader(context, l10n.securitySection),
          ref.watch(canCheckBiometricsProvider).when(
                data: (canDoBiometrics) => SwitchListTile(
                  title: Text(l10n.biometricLock),
                  subtitle: Text(canDoBiometrics
                      ? l10n.biometricLockAvailableSubtitle
                      : l10n.biometricLockUnavailableSubtitle),
                  value: isBiometric,
                  onChanged: canDoBiometrics
                      ? (value) async {
                          if (value) {
                            final success = await privacyService.authenticate();
                            if (!success) return;
                          }
                          await privacyService.setBiometricEnabled(value);
                          ref.read(isBiometricEnabledProvider.notifier).state =
                              value;
                        }
                      : null,
                  secondary: Icon(Icons.fingerprint,
                      color: theme.colorScheme.primary),
                ),
                loading: () => SwitchListTile(
                  title: Text(l10n.biometricLock),
                  subtitle: Text(l10n.biometricLockUnavailableSubtitle),
                  value: isBiometric,
                  onChanged: null,
                  secondary: Icon(Icons.fingerprint,
                      color: theme.colorScheme.primary),
                ),
                error: (_, __) => SwitchListTile(
                  title: Text(l10n.biometricLock),
                  subtitle: Text(l10n.biometricLockUnavailableSubtitle),
                  value: isBiometric,
                  onChanged: null,
                  secondary: Icon(Icons.fingerprint,
                      color: theme.colorScheme.primary),
                ),
              ),
          SwitchListTile(
            title: Text(l10n.localOnlyMode),
            subtitle: Text(l10n.localOnlyModeSubtitle),
            value: isLocalOnly,
            onChanged: (value) async {
              await privacyService.setLocalOnlyMode(value);
              ref.read(isLocalOnlyModeProvider.notifier).state = value;
            },
            secondary: Icon(Icons.cloud_off, color: theme.colorScheme.primary),
          ),

          const Divider(),

          // Data Export Section
          _buildSectionHeader(context, l10n.dataManagementSection),
          ListTile(
            leading: Icon(Icons.table_chart, color: theme.colorScheme.primary),
            title: Text(l10n.exportCsv),
            subtitle: Text(l10n.exportCsvSubtitle),
            onTap: () async {
              try {
                await backupService.exportToCsv();
              } catch (e) {
                if (context.mounted) _showError(context, e.toString());
              }
            },
          ),

          const Divider(),

          // Danger Zone Section
          _buildSectionHeader(context, l10n.dangerZone, isError: true),
          ListTile(
            leading: Icon(Icons.delete_forever, color: theme.colorScheme.error),
            title: Text(l10n.nuclearWipe,
                style: TextStyle(color: theme.colorScheme.error)),
            subtitle: Text(l10n.nuclearWipeSubtitle),
            onTap: () => _showWipeConfirmation(context, ref),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title,
      {bool isError = false}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: isError
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
      ),
    );
  }

  void _showWipeConfirmation(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.wipeConfirmTitle),
        content: Text(l10n.wipeConfirmBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.wipeCancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error),
            onPressed: () async {
              Navigator.pop(context);
              await ref.read(backupServiceProvider).nuclearWipe();
              await ref.read(authServiceProvider.notifier).signOut();
              await ref.read(privacyServiceProvider).resetPrivacySettings();
              ref.read(isLocalOnlyModeProvider.notifier).state = false;
              ref.read(isBiometricEnabledProvider.notifier).state = false;
              ref.read(isSensitiveDataMaskedProvider.notifier).state = false;
              await ref.read(appStateProvider.notifier).factoryResetAppState();
              await ref
                  .read(secureStorageServiceProvider.notifier)
                  .deleteAll();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.wipeSuccessMessage)),
                );
              }
            },
            child: Text(l10n.wipeConfirmAction),
          ),
        ],
      ),
    );
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).colorScheme.error),
    );
  }
}
