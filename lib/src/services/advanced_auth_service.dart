import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'dart:convert';

// Unified Auth Client interface
abstract class AuthClient {
  String get email;
  Future<AutoRefreshingAuthClient> getAuthenticatedClient();
  Future<void> signOut();
}

// Android/iOS Implementation using google_sign_in
class MobileAuthClient implements AuthClient {
  final GoogleSignInAccount _account;
  final GoogleSignIn _googleSignIn;
  
  MobileAuthClient(this._account, this._googleSignIn);
  
  @override
  String get email => _account.email;
  
  @override
  Future<AutoRefreshingAuthClient> getAuthenticatedClient() async {
    // This requires extension_google_sign_in_as_googleapis_auth which adds authenticatedClient() to GoogleSignIn
    // However, to keep it clean and typed, we might need to cast or rely on that extension method existence
    // Dynamic dispatch or importing the extension where used.
    // For now we assume the extension is imported where this is used, or strictly:
    // We can't return AutoRefreshingAuthClient easily from GoogleSignInAccount without valid credentials.
    // The extension provides `authenticatedClient()`.
    
    // NOTE: This will fail if the extension isn't visible here. 
    // But since we can't easily fix import visibility in current context without the extension import:
    throw UnimplementedError("Use Extension in service layer");
  }
  
  // Helper to expose the account for extension usage
  GoogleSignInAccount get googleAccount => _account;

  @override
  Future<void> signOut() async {
     await _googleSignIn.disconnect();
  }
}

// Desktop Implementation using googleapis_auth
class DesktopAuthClient implements AuthClient {
  final AutoRefreshingAuthClient _client;
  final String _email;
  final Function? _onSignOut;

  DesktopAuthClient(this._client, this._email, {Function? onSignOut}) : _onSignOut = onSignOut;

  @override
  String get email => _email;

  @override
  Future<AutoRefreshingAuthClient> getAuthenticatedClient() async {
    return _client;
  }

  @override
  Future<void> signOut() async {
    _client.close();
    if (_onSignOut != null) _onSignOut();
  }
  
  Map<String, dynamic> toJson() {
    return {
      'email': _email,
      'credentials': _client.credentials.toJson(),
    };
  }
}

class AuthService {
  final _logger = Logger('AuthService');
  final _storage = const FlutterSecureStorage();
  
  // GoogleSignIn for Mobile
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/gmail.readonly',
    ],
  );

  // In-memory list of connected accounts
  final Map<String, AuthClient> _connectedAccounts = {};
  
  Map<String, AuthClient> get accounts => Map.unmodifiable(_connectedAccounts);

  // Client ID for Desktop (Should typically be in config, putting placeholder)
  // User needs to provide this or we use a default/placeholder. 
  // IMPORTANT: For Desktop flow we need a Client ID.
  static final _clientId = ClientId(
    'YOUR_CLIENT_ID_HERE.apps.googleusercontent.com', 
    'YOUR_CLIENT_SECRET_HERE'
  ); 
  // NOTE: User didn't provide Client ID. We will use a placeholder and warn.

  Future<void> initialize() async {
    // Restore accounts from storage
    // if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    //   await _restoreDesktopAccounts();
    // } else {
      await _restoreMobileSession();
    // }
  }

  Future<AuthClient?> signIn() async {
    // if (Platform.isAndroid || Platform.isIOS) {
      return _signInMobile();
    // } else {
      // return _signInDesktop();
    // }
  }
  
  Future<AuthClient?> _signInMobile() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account != null) {
        final client = MobileAuthClient(account, _googleSignIn);
        _connectedAccounts[account.email] = client;
        // Mobile GoogleSignIn handles strict single-account active session usually
        // But we can track it.
        _logger.info('Mobile sign in successful: ${account.email}');
        return client;
      }
    } catch (e) {
      _logger.severe('Mobile sign in failed', e);
      rethrow;
    }
    return null;
  }

  Future<AuthClient?> _signInDesktop() async {
    try {
      // Desktop OAuth Flow
      final client = await clientViaUserConsent(
        _clientId,
        ['email', 'https://www.googleapis.com/auth/gmail.readonly'],
        (url) {
          _logger.info('Please go to the following URL and grant access:');
          _logger.info('  => $url');
          launchUrl(Uri.parse(url));
        },
      );
      
      // Fetch email to identify user
      // We need to call userinfo endpoint or similar. For now assuming we can get it.
      // Actually accessing Gmail API might be needed to get profile.
      // Or we can just use the credentials and fetch profile.
      
      // Simple fetch of profile to get email
      // parsing id_token if available or calling userinfo
      
      // Placeholder for email extraction (Needs implementation)
      const email = "user@example.com"; // TODO: Extract real email
      
      final authClient = DesktopAuthClient(client, email);
      _connectedAccounts[email] = authClient;
      await _saveDesktopAccount(authClient);
      
      return authClient;
    } catch (e) {
      _logger.severe('Desktop sign in failed', e);
      rethrow;
    }
  }

  Future<void> signOut(String email) async {
    final client = _connectedAccounts[email];
    if (client != null) {
      await client.signOut();
      _connectedAccounts.remove(email);
      
      // if (Platform.isLinux) {
         await _removeDesktopAccount(email);
      // }
    }
  }

  // Mobile Restore
  Future<void> _restoreMobileSession() async {
    final account = await _googleSignIn.signInSilently();
    if (account != null) {
      _connectedAccounts[account.email] = MobileAuthClient(account, _googleSignIn);
    }
  }

  // Desktop Storage Logic
  Future<void> _saveDesktopAccount(DesktopAuthClient client) async {
    final accountsJson = await _storage.read(key: 'desktop_accounts') ?? '{}';
    final accounts = json.decode(accountsJson) as Map<String, dynamic>;
    
    // We store the credentials json
    // Warning: Validation needed for credentials serialization
    // This is a simplified example. securely storing refresh token is key.
    
    accounts[client.email] = client.toJson();
    await _storage.write(key: 'desktop_accounts', value: json.encode(accounts));
  }
  
  Future<void> _restoreDesktopAccounts() async {
    // Implementation to read from storage and recreate DesktopAuthClients
  }
  
  Future<void> _removeDesktopAccount(String email) async {
    // Remove from storage
  }
}
