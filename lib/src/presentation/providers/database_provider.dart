import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pennypilot/src/data/local/database_service.dart';
import 'package:isar/isar.dart';

final databaseServiceProvider = Provider<DatabaseService>((ref) {
  return DatabaseService();
});

/// Should be overridden in main.dart with initialized Isar instance
final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('isarProvider must be overridden with an initialized Isar instance');
});
