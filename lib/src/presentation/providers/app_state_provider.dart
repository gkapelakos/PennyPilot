import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pennypilot/src/presentation/providers/theme_provider.dart';

/// Manages application-level state (onboarding, app version, etc.)
/// Separate from auth state and financial data state
class AppStateNotifier extends StateNotifier<AppState> {
  final SharedPreferences prefs;

  AppStateNotifier(this.prefs) : super(_initialState(prefs));

  static AppState _initialState(SharedPreferences prefs) {
    return AppState(
      hasCompletedOnboarding: prefs.getBool('hasCompletedOnboarding') ?? false,
      lastAppVersion: prefs.getString('lastAppVersion'),
      firstLaunchDate: prefs.getString('firstLaunchDate') != null
          ? DateTime.parse(prefs.getString('firstLaunchDate')!)
          : null,
    );
  }

  /// Mark onboarding as completed
  Future<void> completeOnboarding() async {
    await prefs.setBool('hasCompletedOnboarding', true);
    
    // Record first launch date if not already set
    if (state.firstLaunchDate == null) {
      final now = DateTime.now().toIso8601String();
      await prefs.setString('firstLaunchDate', now);
      state = state.copyWith(
        hasCompletedOnboarding: true,
        firstLaunchDate: DateTime.parse(now),
      );
    } else {
      state = state.copyWith(hasCompletedOnboarding: true);
    }
  }

  /// Reset onboarding (for factory reset)
  Future<void> resetOnboarding() async {
    await prefs.setBool('hasCompletedOnboarding', false);
    state = state.copyWith(hasCompletedOnboarding: false);
  }

  /// Update app version (for migration tracking)
  Future<void> updateAppVersion(String version) async {
    await prefs.setString('lastAppVersion', version);
    state = state.copyWith(lastAppVersion: version);
  }

  /// Factory reset - clears all app state
  Future<void> factoryResetAppState() async {
    await prefs.remove('hasCompletedOnboarding');
    await prefs.remove('lastAppVersion');
    await prefs.remove('firstLaunchDate');
    
    state = const AppState(
      hasCompletedOnboarding: false,
      lastAppVersion: null,
      firstLaunchDate: null,
    );
  }
}

/// Immutable state for app-level settings
class AppState {
  final bool hasCompletedOnboarding;
  final String? lastAppVersion;
  final DateTime? firstLaunchDate;

  const AppState({
    required this.hasCompletedOnboarding,
    this.lastAppVersion,
    this.firstLaunchDate,
  });

  AppState copyWith({
    bool? hasCompletedOnboarding,
    String? lastAppVersion,
    DateTime? firstLaunchDate,
  }) {
    return AppState(
      hasCompletedOnboarding: hasCompletedOnboarding ?? this.hasCompletedOnboarding,
      lastAppVersion: lastAppVersion ?? this.lastAppVersion,
      firstLaunchDate: firstLaunchDate ?? this.firstLaunchDate,
    );
  }
}

/// Global provider for app state
final appStateProvider = StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return AppStateNotifier(prefs);
});
