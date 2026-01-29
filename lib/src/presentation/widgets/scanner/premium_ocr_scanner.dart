import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../services/receipt_scanner.dart';
import '../../../data/database/app_database.dart';
import '../../../presentation/providers/database_provider.dart';
import 'package:drift/drift.dart' as drift;

class PremiumOCRScanner extends ConsumerStatefulWidget {
  const PremiumOCRScanner({super.key});

  @override
  ConsumerState<PremiumOCRScanner> createState() => _PremiumOCRScannerState();
}

class _PremiumOCRScannerState extends ConsumerState<PremiumOCRScanner> {
  bool _isProcessing = false;
  String? _status;

  Future<void> _processImage(XFile image) async {
    setState(() {
      _isProcessing = true;
      _status = "Analyzing receipt...";
    });

    try {
      final scanner = ref.read(receiptScannerProvider.notifier);
      final result = await scanner.scanReceipt(image.path);

      if (result != null) {
        setState(() => _status = "Saving to database...");

        final db = ref.read(appDatabaseProvider);

        // Save as a transaction
        await db.into(db.transactions).insert(
              TransactionsCompanion.insert(
                merchantName: result.store?.value ?? "Unknown",
                amount: result.total?.value ?? 0.0,
                date: result.timestamp,
                isSubscription: drift.Value(false),
                extractionConfidence:
                    drift.Value(result.isConfirmed ? 100 : 50),
              ),
            );

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    "Captured ${result.store?.value ?? 'Receipt'} - \$${result.total?.value ?? '0.00'}")),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error processing receipt")),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
          _status = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _isProcessing
          ? Padding(
              key: const ValueKey('processing'),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  const SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(strokeWidth: 3),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _status ?? "Analyzing...",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            )
          : Row(
              key: const ValueKey('actions'),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: Icons.camera_alt_outlined,
                  label: "Scan Receipt",
                  onTap: () async {
                    final picker = ImagePicker();
                    final image = await picker.pickImage(
                      source: ImageSource.camera,
                    );
                    if (image != null) _processImage(image);
                  },
                ),
                _buildActionButton(
                  icon: Icons.photo_library_outlined,
                  label: "From Gallery",
                  onTap: () async {
                    final picker = ImagePicker();
                    final image = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (image != null) _processImage(image);
                  },
                ),
              ],
            ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 120,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isDark ? const Color(0xFF27272A) : const Color(0xFFE4E4E7),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 28),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
