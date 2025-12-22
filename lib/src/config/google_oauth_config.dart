import 'secrets.dart';

class GoogleOAuthConfig {
  // Desktop OAuth client ID (Linux / macOS / Windows)
  static const String desktopClientId = Secrets.googleDesktopClientId;

  // Secret is required for "installed" client type even on desktop loopback
  static const String desktopClientSecret = Secrets.googleDesktopClientSecret;

  // Mobile OAuth client ID (Android / iOS)
  static const String mobileClientId = Secrets.googleMobileClientId;

  static const List<String> gmailReadOnlyScopes = [
    'https://www.googleapis.com/auth/gmail.readonly',
  ];
}
