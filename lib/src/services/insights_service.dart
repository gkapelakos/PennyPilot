import 'package:isar/isar.dart';
import 'package:pennypilot/src/data/models/transaction_model.dart';
import 'package:pennypilot/src/data/models/category_model.dart';

class InsightsService {
  final Isar _isar;

  InsightsService(this._isar);

  /// Get spending summary for the current month vs previous month
  Future<SpendingComparison> compareWithPreviousMonth() async {
    final now = DateTime.now();
    final startOfCurrent = DateTime(now.year, now.month, 1);
    final startOfPrev = DateTime(now.year, now.month - 1, 1);
    final endOfPrev = startOfCurrent.subtract(const Duration(seconds: 1));

    final currentTransactions = await _isar.transactionModels
        .filter()
        .dateGreaterThan(startOfCurrent.subtract(const Duration(seconds: 1)))
        .kindEqualTo(TransactionKind.expense)
        .findAll();

    final prevTransactions = await _isar.transactionModels
        .filter()
        .dateBetween(startOfPrev, endOfPrev)
        .kindEqualTo(TransactionKind.expense)
        .findAll();

    final currentTotal = currentTransactions.fold<double>(0, (sum, t) => sum + t.amount);
    final prevTotal = prevTransactions.fold<double>(0, (sum, t) => sum + t.amount);

    return SpendingComparison(
      currentTotal: currentTotal,
      previousTotal: prevTotal,
      percentChange: prevTotal > 0 ? ((currentTotal - prevTotal) / prevTotal) * 100 : 0,
    );
  }

  /// Get top spending categories for the current month
  Future<List<CategorySpending>> getTopCategories({int limit = 5}) async {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);

    final transactions = await _isar.transactionModels
        .filter()
        .dateGreaterThan(startOfMonth.subtract(const Duration(seconds: 1)))
        .kindEqualTo(TransactionKind.expense)
        .findAll();

    final categoryMap = <int, double>{};
    for (var t in transactions) {
      if (t.categoryId != null) {
        categoryMap[t.categoryId!] = (categoryMap[t.categoryId!] ?? 0) + t.amount;
      }
    }

    final result = <CategorySpending>[];
    for (var entry in categoryMap.entries) {
      final category = await _isar.categoryModels.get(entry.key);
      if (category != null) {
        result.add(CategorySpending(
          categoryId: entry.key,
          categoryName: category.name,
          categoryIcon: category.icon,
          amount: entry.value,
          colorValue: category.colorValue,
        ));
      }
    }

    result.sort((a, b) => b.amount.compareTo(a.amount));
    return result.take(limit).toList();
  }

  /// Detect anomalies (unusually high spending compared to average)
  Future<List<SpendingAnomaly>> detectAnomalies() async {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    
    // Get current month transactions
    final currentTransactions = await _isar.transactionModels
        .filter()
        .dateGreaterThan(startOfMonth.subtract(const Duration(seconds: 1)))
        .findAll();

    // Group by category to find current spend
    final currentCategorySpend = <int, double>{};
    for (var t in currentTransactions) {
      if (t.categoryId != null) {
        currentCategorySpend[t.categoryId!] = (currentCategorySpend[t.categoryId!] ?? 0) + t.amount;
      }
    }

    // Get historical average spend per category (last 3 months)
    final startOfHistory = DateTime(now.year, now.month - 3, 1);
    final historyTransactions = await _isar.transactionModels
        .filter()
        .dateBetween(startOfHistory, startOfMonth.subtract(const Duration(seconds: 1)))
        .findAll();

    final historyMap = <int, List<double>>{};
    for (var t in historyTransactions) {
      if (t.categoryId != null) {
        historyMap.putIfAbsent(t.categoryId!, () => []).add(t.amount);
      }
    }

    final anomalies = <SpendingAnomaly>[];
    for (var entry in currentCategorySpend.entries) {
      final historyAmounts = historyMap[entry.key];
      if (historyAmounts != null && historyAmounts.length >= 3) {
        final avg = historyAmounts.reduce((a, b) => a + b) / 3; // Simplified avg per month
        if (entry.value > avg * 1.5) { // 50% higher than average
          final category = await _isar.categoryModels.get(entry.key);
          anomalies.add(SpendingAnomaly(
            categoryName: category?.name ?? 'Unknown',
            currentSpend: entry.value,
            averageSpend: avg,
            increasePercent: ((entry.value - avg) / avg) * 100,
          ));
        }
      }
    }

    return anomalies;
  }
}

class SpendingComparison {
  final double currentTotal;
  final double previousTotal;
  final double percentChange;

  SpendingComparison({
    required this.currentTotal,
    required this.previousTotal,
    required this.percentChange,
  });
}

class CategorySpending {
  final int categoryId;
  final String categoryName;
  final String categoryIcon;
  final double amount;
  final int? colorValue;

  CategorySpending({
    required this.categoryId,
    required this.categoryName,
    required this.categoryIcon,
    required this.amount,
    this.colorValue,
  });
}

class SpendingAnomaly {
  final String categoryName;
  final double currentSpend;
  final double averageSpend;
  final double increasePercent;

  SpendingAnomaly({
    required this.categoryName,
    required this.currentSpend,
    required this.averageSpend,
    required this.increasePercent,
  });
}
