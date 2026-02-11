# Release Notes - v1.0.0-alpha.1.19

## 🚀 Highlights
This release focuses on **robustness, stability, and developer experience**. We've implemented an "Always Work" philosophy across critical user flows to ensure the app handles errors gracefully and provides clear feedback instead of crashing.

### 🛡️ "Always Work" Reliability Improvements
We've hardened the following screens with comprehensive error handling (`try-catch`), loading states, and user-friendly feedback:
- **Add Transaction**: Prevents crashes during save operations and currency conversion.
- **Connect Accounts**: Added loading states and robust error handling for Google/Email sign-in flows.
- **Edit Transaction**: Secured the update process with validation and error reporting.
- **Transaction Details**: "Verify" and "Add Note" actions now fail gracefully without disrupting the user experience.
- **Receipt Scanning**: Added protection against double-submissions and robust error handling for image processing and categorization.
- **Add Subscription**: Standardized error reporting and input validation.
- **Startup**: Protected the initial configuration flow (Language/Currency selection) to prevent startup crashes.
- **Currency Converter**: Added safe type casting and error handling for exchange rate calculations.

### 🛠️ Developer Experience & CI/CD
- **Simplified CI Workflow**: The GitHub Actions workflow (`ci.yml`) has been completely refactored for simplicity and speed.
- **ARM64 Builds**: The CI pipeline now automatically builds and uploads an **ARM64 APK** artifact on every push to `main`, making it easier to test on physical Android devices.

## 🐛 Bug Fixes
- Fixed potential crashes in `CurrencyConverterScreen` due to malformed exchange rate data.
- Resolved race conditions in `ReceiptScanScreen` that could lead to multiple transaction submissions.
- Fixed UI freezing issues during long-running operations in `AddTransactionSheet` and `ConnectEmailScreen`.

## 📦 Technical Details
- **Version**: 1.0.0-alpha.1.19+1
- **Flutter SDK**: >=3.2.0 <4.0.0
- **Build Target**: Android ARM64 (`android-arm64`)
