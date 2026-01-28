import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage_service.g.dart';

@Riverpod(keepAlive: true)
class SecureStorageService extends _$SecureStorageService {
  late final FlutterSecureStorage _storage;

  @override
  void build() {
    _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ),
    );
  }

  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> writeJson(String key, Map<String, dynamic> data) async {
    await _storage.write(key: key, value: jsonEncode(data));
  }

  Future<Map<String, dynamic>?> readJson(String key) async {
    final value = await _storage.read(key: key);
    if (value == null) return null;
    return jsonDecode(value) as Map<String, dynamic>;
  }
}
