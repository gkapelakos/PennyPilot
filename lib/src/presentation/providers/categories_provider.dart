import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pennypilot/src/data/database/app_database.dart';
import 'package:pennypilot/src/presentation/providers/database_provider.dart';
import 'package:drift/drift.dart';

part 'categories_provider.g.dart';

@riverpod
Stream<List<Category>> categories(CategoriesRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return (db.select(db.categories)
        ..orderBy([(t) => OrderingTerm.asc(t.displayOrder)]))
      .watch();
}

@riverpod
class CategoryNotifier extends _$CategoryNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> addCategory(CategoriesCompanion category) async {
    final db = ref.read(appDatabaseProvider);
    await db.into(db.categories).insert(category);
  }

  Future<void> updateCategory(Category category) async {
    final db = ref.read(appDatabaseProvider);
    await db.update(db.categories).replace(category);
  }

  Future<void> deleteCategory(int id) async {
    final db = ref.read(appDatabaseProvider);
    await (db.delete(db.categories)..where((t) => t.id.equals(id))).go();
  }
}
