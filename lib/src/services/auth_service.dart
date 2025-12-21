import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'dart:io';
import 'dart:convert';
import 'package:googleapis_auth/auth_io.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis/gmail/v1.dart';
import '../config/google_oauth_config.dart';

class AuthService extends ChangeNotifier {
  // Only initialize GoogleSignIn on supported platforms
  late final GoogleSignIn _googleSignIn; 
  final bool _isMobile = Platform.isAndroid || Platform.isIOS;
  
  // List of connected email addresses
  final Set<String> _connectedEmails = {};

  final _storage = const FlutterSecureStorage();
  final _logger = Logger('AuthService');

  AuthService() {
    _googleSignIn = _buildGoogleSignIn();
    _initialize();
  }

  GoogleSignIn _buildGoogleSignIn() {
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      return GoogleSignIn(
        clientId: GoogleOAuthConfig.desktopClientId,
        scopes: GoogleOAuthConfig.gmailReadOnlyScopes,
      );
    }

    if (Platform.isAndroid || Platform.isIOS) {
      return GoogleSignIn(
        scopes: GoogleOAuthConfig.gmailReadOnlyScopes,
      );
    }

    throw UnsupportedError('Unsupported platform');
  }
  
  Future<void> _initialize() async {
    await _verifyStorage();
    await _restoreAccounts();
  }

  Future<void> _verifyStorage() async {
    try {
      const key = 'test_storage_perm';
      await _storage.write(key: key, value: 'ok');
      final val = await _storage.read(key: key);
      if (val == 'ok') {
        _logger.info('Secure storage verification passed.');
        await _storage.delete(key: key);
      } else {
        _logger.severe('Secure storage verification failed: Value mismatch.');
      }
    } catch (e) {
      _logger.severe('Secure storage verification failed.', e);
    }
  }

  Set<String> get connectedEmails => _connectedEmails;

  GoogleSignIn get googleSignIn => _googleSignIn;

  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      
      if (account == null) {
        debugPrint('Sign in returned null (user cancelled or failed)');
        return null;
      } else {
        debugPrint('Signed in as ${account.email}');
        _logger.info('User signed in: ${account.email}');
        
        _connectedEmails.add(account.email);
        await _saveAccounts();
        notifyListeners();
        
        return account.email;
      }
    } catch (e, stack) {
      debugPrint('Google sign-in failed: $e');
      debugPrint(stack.toString());
      _logger.severe('Google Sign-In failed', e, stack);
      rethrow;
    }
  }

  Future<void> signOut({String? email}) async {
    if (email != null) {
      _connectedEmails.remove(email);
      // Only sign out from Google Sign In if it matches the current user
      if (_googleSignIn.currentUser?.email == email) {
        await _googleSignIn.signOut();
      }
    } else {
      _connectedEmails.clear();
      await _googleSignIn.signOut();
      await _storage.deleteAll();
    }
    await _saveAccounts();
    notifyListeners();
    _logger.info('User signed out: ${email ?? "All accounts"}');
  }

  Future<void> _saveAccounts() async {
    try {
      final List<String> emails = _connectedEmails.toList();
      await _storage.write(key: 'connected_emails', value: json.encode(emails));
    } catch (e) {
      _logger.severe('Failed to save accounts to storage', e);
    }
  }

  Future<void> _restoreAccounts() async {
    try {
      final emailsJson = await _storage.read(key: 'connected_emails');
      if (emailsJson != null) {
        final List<dynamic> emails = json.decode(emailsJson);
        _connectedEmails.addAll(emails.cast<String>());
      }

      // Attempt silent sign-in to restore session
      try {
        if (await _googleSignIn.isSignedIn()) {
          final account = await _googleSignIn.signInSilently();
          if (account != null) {
            _connectedEmails.add(account.email);
          }
        }
      } catch (e) {
        _logger.warning('Silent sign-in failed during restore', e);
      }
    } catch (e) {
      _logger.severe('Failed to restore accounts', e);
    }
  }

  Future<AuthClient?> getClientForEmail(String email) async {
    // Check if the requested email matches the current GoogleSignIn user
    if (_googleSignIn.currentUser?.email == email) {
      return await _googleSignIn.authenticatedClient();
    }
    
    // If we support multiple logged-in accounts (via switching), we might handle it here.
    // For this fix, we prioritize the active GoogleSignIn user.
    return null;
  }

  Future<String?> getAccessToken() async {
    final account = _googleSignIn.currentUser;
    if (account != null) {
       final auth = await account.authentication;
       return auth.accessToken;
    }
    return null;
  }
}
