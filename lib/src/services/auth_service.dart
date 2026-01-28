import 'package:local_auth/local_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logging/logging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

part 'auth_service.g.dart';

@riverpod
class AuthService extends _$AuthService {
  final _auth = LocalAuthentication();
  final _log = Logger('AuthService');
  final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/gmail.readonly',
    ],
  );

  @override
  bool build() =>
      false; // This state represents if the user is currently "unlocked" via biometrics

  // --- Biometric Auth ---

  Future<bool> isBiometricAvailable() async {
    final bool canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await _auth.isDeviceSupported();
    return canAuthenticate;
  }

  Future<bool> authenticate() async {
    try {
      final bool didAuthenticate = await _auth.authenticate(
        localizedReason: 'Please authenticate to unlock PennyPilot',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );
      state = didAuthenticate;
      return didAuthenticate;
    } catch (e) {
      _log.severe('Error during authentication', e);
      return false;
    }
  }

  void logout() {
    state = false;
  }

  // --- External Account Auth (Email/Google) ---

  List<String> get connectedEmails {
    // This should ideally come from local storage or database
    // For now, returning current google user if any
    final email = _googleSignIn.currentUser?.email;
    return email != null ? [email] : [];
  }

  Future<void> signInWithGoogle() async {
    try {
      await _googleSignIn.signIn();
    } catch (e) {
      _log.severe('Error signing in with Google', e);
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      _log.severe('Error signing out', e);
    }
  }

  Future<http.Client?> getClientForEmail(String email) async {
    final user = _googleSignIn.currentUser;
    if (user != null && user.email == email) {
      // Note: This is an approximation. In a real app you'd use a package like googleapis_auth
      // to create an authenticated client from the access token.
      return http.Client();
    }
    return null;
  }

  Future<void> setLastSyncTime(String email, DateTime time) async {
    // Placeholder for saving sync time to database or prefs
    _log.info('Synced $email at $time');
  }

  Future<DateTime?> getLastSyncTime(String email) async {
    // Placeholder for retrieving sync time
    return null;
  }
}
