import 'package:drift/drift.dart';
import '../app_database.dart';

part 'receipt_dao.g.dart';

@DriftAccessor(include: {'../tables.drift'})
class ReceiptDao extends DatabaseAccessor<AppDatabase> with _$ReceiptDaoMixin {
  ReceiptDao(super.db);

  Stream<List<Receipt>> watchAllReceipts() {
    return select(receipts).watch();
  }

  Future<int> insertReceipt(ReceiptsCompanion entry) {
    return into(receipts).insert(entry);
  }
}
