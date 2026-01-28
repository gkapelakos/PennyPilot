import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pennypilot/src/data/database/app_database.dart';
import 'package:pennypilot/src/presentation/providers/database_provider.dart';

part 'splits_provider.g.dart';

@riverpod
Stream<List<Split>> splitsForTransaction(
    SplitsForTransactionRef ref, int transactionId) {
  final db = ref.watch(appDatabaseProvider);
  return (db.select(db.splits)
        ..where((t) => t.transactionId.equals(transactionId)))
      .watch();
}

@riverpod
class SplitNotifier extends _$SplitNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> addSplit(SplitsCompanion split) async {
    final db = ref.read(appDatabaseProvider);
    await db.into(db.splits).insert(split);
  }

  Future<void> deleteSplitsForTransaction(int transactionId) async {
    final db = ref.read(appDatabaseProvider);
    await (db.delete(db.splits)
          ..where((t) => t.transactionId.equals(transactionId)))
        .go();
  }
}
