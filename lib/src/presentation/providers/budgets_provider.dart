import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pennypilot/src/data/database/app_database.dart';
import 'package:pennypilot/src/presentation/providers/database_provider.dart';

part 'budgets_provider.g.dart';

@riverpod
Stream<List<Budget>> budgets(BudgetsRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return db.select(db.budgets).watch();
}

@riverpod
class BudgetNotifier extends _$BudgetNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> addBudget(BudgetsCompanion budget) async {
    final db = ref.read(appDatabaseProvider);
    await db.into(db.budgets).insert(budget);
  }

  Future<void> updateBudget(Budget budget) async {
    final db = ref.read(appDatabaseProvider);
    await db.update(db.budgets).replace(budget);
  }

  Future<void> deleteBudget(int id) async {
    final db = ref.read(appDatabaseProvider);
    await (db.delete(db.budgets)..where((t) => t.id.equals(id))).go();
  }
}
