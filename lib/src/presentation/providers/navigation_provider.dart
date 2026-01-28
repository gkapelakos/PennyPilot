import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:pennypilot/src/presentation/screens/dashboard/overview_tab.dart';
import 'package:pennypilot/src/presentation/screens/transactions/transactions_screen.dart';
import 'package:pennypilot/src/presentation/screens/subscriptions/subscriptions_screen.dart';
import 'package:pennypilot/src/presentation/screens/insights/insights_screen.dart';
import 'package:pennypilot/src/presentation/screens/settings/settings_screen.dart';
import 'package:pennypilot/src/presentation/screens/onboarding/startup_screen.dart';
import 'package:pennypilot/src/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:pennypilot/src/presentation/screens/auth/connect_email_screen.dart';
import 'package:pennypilot/src/presentation/screens/transactions/add_transaction_sheet.dart';
import 'package:pennypilot/src/presentation/screens/subscriptions/add_subscription_sheet.dart';
import 'package:pennypilot/src/presentation/screens/transactions/receipt_scan_screen.dart';
import 'package:pennypilot/src/presentation/widgets/status_dialogs.dart';
import 'package:pennypilot/src/presentation/providers/email_provider.dart';
import 'package:pennypilot/src/localization/generated/app_localizations.dart';

part 'navigation_provider.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const StartupScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return DashboardShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const OverviewTab(),
          ),
          GoRoute(
            path: '/connect-email',
            builder: (context, state) => const ConnectEmailScreen(),
          ),
          GoRoute(
            path: '/transactions',
            builder: (context, state) => const TransactionsScreen(),
          ),
          GoRoute(
            path: '/subscriptions',
            builder: (context, state) => const SubscriptionsScreen(),
          ),
          GoRoute(
            path: '/insights',
            builder: (context, state) => const InsightsScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
}

class DashboardShell extends ConsumerWidget {
  final Widget child;
  const DashboardShell({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;
    final l10n = AppLocalizations.of(context)!;
    final selectedIndex = _calculateSelectedIndex(context);

    return Scaffold(
      body: Row(
        children: [
          if (isWideScreen)
            NavigationRail(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) => _onItemTapped(index, context),
              extended: MediaQuery.of(context).size.width > 900,
              destinations: [
                NavigationRailDestination(
                    icon: const Icon(Icons.dashboard_outlined),
                    selectedIcon: const Icon(Icons.dashboard),
                    label: Text(l10n.overview)),
                NavigationRailDestination(
                    icon: const Icon(Icons.receipt_long_outlined),
                    selectedIcon: const Icon(Icons.receipt_long),
                    label: Text(l10n.transactions)),
                NavigationRailDestination(
                    icon: const Icon(Icons.subscriptions_outlined),
                    selectedIcon: const Icon(Icons.subscriptions),
                    label: Text(l10n.subs)),
                NavigationRailDestination(
                    icon: const Icon(Icons.insights_outlined),
                    selectedIcon: const Icon(Icons.insights),
                    label: Text(l10n.insights)),
                NavigationRailDestination(
                    icon: const Icon(Icons.settings_outlined),
                    selectedIcon: const Icon(Icons.settings),
                    label: Text(l10n.settings)),
              ],
            ),
          Expanded(child: child),
        ],
      ),
      bottomNavigationBar: isWideScreen
          ? null
          : NavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) => _onItemTapped(index, context),
              destinations: [
                NavigationDestination(
                    icon: const Icon(Icons.dashboard_outlined),
                    selectedIcon: const Icon(Icons.dashboard),
                    label: l10n.overview),
                NavigationDestination(
                    icon: const Icon(Icons.receipt_long_outlined),
                    selectedIcon: const Icon(Icons.receipt_long),
                    label: l10n.transactions),
                NavigationDestination(
                    icon: const Icon(Icons.subscriptions_outlined),
                    selectedIcon: const Icon(Icons.subscriptions),
                    label: l10n.subs),
                NavigationDestination(
                    icon: const Icon(Icons.insights_outlined),
                    selectedIcon: const Icon(Icons.insights),
                    label: l10n.insights),
                NavigationDestination(
                    icon: const Icon(Icons.settings_outlined),
                    selectedIcon: const Icon(Icons.settings),
                    label: l10n.settings),
              ],
            ),
      floatingActionButton: selectedIndex < 4
          ? FloatingActionButton(
              onPressed: () => _showActionMenu(context, ref),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/transactions')) return 1;
    if (location.startsWith('/subscriptions')) return 2;
    if (location.startsWith('/insights')) return 3;
    if (location.startsWith('/settings')) return 4;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.go('/transactions');
        break;
      case 2:
        context.go('/subscriptions');
        break;
      case 3:
        context.go('/insights');
        break;
      case 4:
        context.go('/settings');
        break;
    }
  }

  void _showActionMenu(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.receipt_long),
                title: Text(l10n.addEntry),
                onTap: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useSafeArea: true,
                    builder: (context) => const AddTransactionSheet(),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.subscriptions),
                title: Text(l10n.addSubscription),
                onTap: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useSafeArea: true,
                    builder: (context) => const AddSubscriptionSheet(),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.document_scanner),
                title: Text(l10n.scanReceipt),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReceiptScanScreen()),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.sync),
                title: Text(l10n.scanEmails),
                onTap: () async {
                  Navigator.pop(context);
                  _performEmailScan(context, ref);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _performEmailScan(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const ScanningDialog(),
      );

      final count = await ref.read(emailServiceProvider).scanEmails();

      if (context.mounted) {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (context) => SuccessDialog(count: count),
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.errorScanning(e.toString())),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }
}
