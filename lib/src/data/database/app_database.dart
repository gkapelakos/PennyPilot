import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  IntColumn get parentCategoryId => integer().nullable()();
  TextColumn get icon => text()();
  TextColumn get color => text()();
  IntColumn get colorValue => integer().nullable()();
  BoolColumn get isSystem => boolean().withDefault(const Constant(false))();
  IntColumn get displayOrder => integer().withDefault(const Constant(0))();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  IntColumn get transactionCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get merchantName => text()();
  TextColumn get rawMerchantName => text().nullable()();
  RealColumn get amount => real()();
  RealColumn get subtotalAmount => real().nullable()();
  RealColumn get taxAmount => real().nullable()();
  RealColumn get discountAmount => real().nullable()();
  RealColumn get tipAmount => real().nullable()();
  DateTimeColumn get date => dateTime()();
  IntColumn get categoryId =>
      integer().nullable().references(Categories, #id)();
  BoolColumn get isSubscription =>
      boolean().withDefault(const Constant(false))();
  IntColumn get subscriptionId => integer().nullable()();
  IntColumn get kind =>
      integer().withDefault(const Constant(1))(); // 0: income, 1: expense
  IntColumn get origin => integer().withDefault(const Constant(0))();
  BoolColumn get isRecurring => boolean().withDefault(const Constant(false))();
  IntColumn get extractionConfidence =>
      integer().withDefault(const Constant(0))();
  BoolColumn get hasLineItems => boolean().withDefault(const Constant(false))();
  TextColumn get originalEmailId => text().nullable()();
  TextColumn get currency => text().withDefault(const Constant('USD'))();
  TextColumn get notes => text().nullable()();
  BoolColumn get userVerified => boolean().withDefault(const Constant(false))();
  BoolColumn get hasSplits => boolean().withDefault(const Constant(false))();
  BoolColumn get isManuallyEdited =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get manualEditTimestamp => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class Subscriptions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get serviceName => text()();
  RealColumn get amount => real()();
  DateTimeColumn get nextRenewalDate => dateTime()();
  IntColumn get frequency => integer()();
  IntColumn get lifecycleState => integer()();
  IntColumn get categoryId =>
      integer().nullable().references(Categories, #id)();
  DateTimeColumn get firstSeenDate => dateTime()();
  DateTimeColumn get lastChargedDate => dateTime().nullable()();
  TextColumn get priceHistoryJson => text().nullable()();
  TextColumn get cycleHistoryJson => text().nullable()();
  IntColumn get frequencyConsistency =>
      integer().withDefault(const Constant(100))();
  IntColumn get detectionSource => integer()();
  TextColumn get anomalies => text().nullable()(); // JSON encoded list
  BoolColumn get isTrial => boolean().withDefault(const Constant(false))();
  DateTimeColumn get trialEndDate => dateTime().nullable()();
  IntColumn get chargeCount => integer().withDefault(const Constant(0))();
  RealColumn get averageDaysBetweenCharges => real().nullable()();
  TextColumn get currency => text().withDefault(const Constant('USD'))();
  TextColumn get notes => text().nullable()();
  BoolColumn get userConfirmed =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get isZombie => boolean().withDefault(const Constant(false))();
  TextColumn get zombieReason => text().nullable()();
  RealColumn get lastPriceHikePercent => real().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class Mappings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get merchantName => text().withLength(min: 1, max: 200)();
  IntColumn get categoryId => integer().references(Categories, #id)();
  BoolColumn get isAutomatic => boolean().withDefault(const Constant(true))();
  IntColumn get confidence => integer().withDefault(const Constant(100))();
  BoolColumn get userConfirmed =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class Budgets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId =>
      integer().nullable().references(Categories, #id)();
  RealColumn get limitAmount => real()();
  IntColumn get period =>
      integer().withDefault(const Constant(1))(); // 0: weekly, 1: monthly
  BoolColumn get rollover => boolean().withDefault(const Constant(false))();
  RealColumn get carryOverAmount => real().withDefault(const Constant(0.0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}

class Splits extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get transactionId => integer().references(Transactions, #id)();
  IntColumn get categoryId => integer().references(Categories, #id)();
  RealColumn get amount => real()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [
  Transactions,
  Categories,
  Subscriptions,
  Mappings,
  Budgets,
  Splits
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'pennypilot.sqlite'));
    return NativeDatabase(file);
  });
}
