# Release Notes - v1.0.0-alpha.1.19 (Ultimate Edition)

## 🚀 Highlights
This release implements the "Ultimate PennyPilot Fix+Shrink" initiative, delivering a **robust, optimized, and lightweight** application experience.

### 🛡️ "Always Work" Reliability
Every critical user action now follows a rigorous `try-catch` pattern with loading states and user-friendly error handling:
- **Add Transaction**: Protected against crashes and double-submissions.
- **Connect Accounts**: Robust error handling for authentication flows.
- **Edit/Verify Transactions**: Graceful failure modes with clear feedback.
- **Receipt Scanning**: Prevented race conditions and improved error reporting.
- **Startup**: Crash-proof configuration loading.

### 📉 Size Reduction (Target: ~7MB)
We've aggressively optimized the APK size:
- **ABI Splits**: Generating dedicated ARM64-v8a APKs to remove unused native libraries.
- **Code Shrinking**: Enabled R8 full mode obfuscation and shrinking.
- **Resource Shrinking**: Removing unused resources from the final build.
- **Asset Cleanup**: Removed large source files (PSDs) and unused animations (Rive).
- **Dead Code Removal**: Deleted `SmartDashboard` and unused widgets.

### 🛠️ Developer Experience & CI/CD
- **Ultimate CI Workflow**: Automated build pipeline for optimized, obfuscated ARM64 APKs.
- **Material 3**: Enhanced UI with `FadeUpwardsPageTransitionsBuilder` for smoother navigation on Android.
- **ProGuard Rules**: Tuned keep rules for ML Kit, Isar, and Flutter to ensure safe shrinking.

## 🐛 Bug Fixes
- Fixed `CurrencyConverterScreen` crashes.
- Resolved `ReceiptScanScreen` state issues.
- Fixed potential startup crashes in `StartupScreen`.

## 📦 Technical Details
- **Version**: 1.0.0-alpha.1.19+1
- **Flutter SDK**: 3.24.0 (Target)
- **Architecture**: `arm64-v8a` Only (via Splits)
- **Min SDK**: 24
- **Target SDK**: 35
