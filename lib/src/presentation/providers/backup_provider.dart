import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pennypilot/src/services/backup_service.dart';
import 'package:pennypilot/src/presentation/providers/database_provider.dart';

part 'backup_provider.g.dart';

@riverpod
BackupService backupService(BackupServiceRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return BackupService(db);
}
