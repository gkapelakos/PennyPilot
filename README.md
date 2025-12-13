# PennyPilot

PennyPilot is a privacy-first personal finance app that scans receipts from your email, tracks spending, detects subscriptions, and provides clear insights through smart dashboards—fully local, open-source, and effortless.

> Purpose: Help users manage personal spending and subscriptions locally on their device while prioritizing privacy and data ownership.

---

## Table of contents
- Project overview
- Key features
- Installation
- Configuration & feature toggles
- Data privacy & security
- Local storage
- UI & theming
- Limitations & intentionally excluded features
- Contributing
- License
- Notes / verification

---

## Project overview

- Project name: PennyPilot
- Short description: Privacy-first personal finance app that extracts data from receipts and bills, detects recurring subscriptions, and surfaces spending insights locally.
- Tech stack (from repository composition): Flutter (Dart) front-end, with native components in C/C++/Swift and build tooling (CMake). HTML files present (docs or web UI).  
  - Note: This README is a draft based on repository metadata. Exact implementation details (file locations, packages, DB engine, and native modules) require repository access for verification.

---

## Key features

- Receipt, bill, and subscription scanning
  - Ingest receipts and bills, commonly from email or local files (UI for source selection present in app code).
  - Parse document content and extract structured fields.

- Data extraction
  - Extract merchant name, transaction amount, date, and inferred category.
  - Store original receipt/bill metadata (source, raw text/attachment reference).

- Subscription detection & lifecycle tracking
  - Identify recurring payments and group them into subscription records.
  - Track state changes (active / cancelled / trial / unknown) and lifecycle events as detected from incoming invoices/charges.

- Dashboards, charts, and summaries
  - Overview dashboards showing spending summaries, subscription list, and trends over selected periods.
  - Charts and visualizations for categories, monthly spend, and recurring costs.

- Backup and restore
  - Local export/import (backup & restore) for user data to preserve ownership (implementation details TBD in code).
  - Option to delete all local data from the device.

---

## Installation

Minimal steps to run the Flutter app (platform-specific steps may be required):

Prerequisites
- Flutter SDK (stable channel)
- Dart (bundled with Flutter)
- Platform SDKs as needed (Android SDK, Xcode for iOS/macOS)
- C/C++ toolchain if native modules are built from source (CMake present in repo)

Typical development setup
1. Clone the repo
   - git clone https://github.com/Its-Juice/PennyPilot.git
2. From repo root:
   - flutter pub get
3. Run on a device or simulator:
   - flutter run

Platform-specific notes
- Android: ensure Android SDK and emulator or device connected.
- iOS / macOS: open ios/Runner.xcworkspace in Xcode if there are native dependencies; ensure CocoaPods installed.
- Desktop (if supported): follow Flutter desktop setup steps and build with flutter run -d macos / linux / windows.

Build & release
- Use standard Flutter build commands:
  - flutter build apk / appbundle
  - flutter build ios
  - flutter build macos / linux / windows

Note: Exact native build steps and any extra pre-build generation (e.g., protoc, codegen, or native library builds via CMake) must be confirmed in repository build scripts.

---

## Configuration & feature toggles

- App settings (in-app UI)
  - Likely includes toggles for:
    - Automatic email scanning / connectors
    - Backup frequency and export options
    - Privacy / data retention options
    - Dark / light mode and theme preferences

- Runtime / build flags
  - Native code and CMake presence suggests build-time flags for native features.
  - Check platform-specific CMakeLists.txt, build scripts, or .dart defines in the repo for exact toggles.

- Environment
  - No cloud or remote services are required for core functionality (privacy-first design).
  - If any third-party services are integrated (e.g., for OCR or AI), their configuration should appear in config files—verify in code.

(Exact setting keys, storage locations, and default values require verification against the codebase.)

---

## Data privacy & security

- Privacy-first design
  - Primary design principle is local processing and storage; user data is owned and retained on the device by default.
  - No automatic remote upload of personal data unless a user explicitly configures a backup destination.

- Potential security measures (verify in repo)
  - Local encryption at rest (check if DB is encrypted or storage layer uses platform secure storage).
  - Export/backup encryption options when exporting JSON/DB files.
  - Secure handling of OAuth/credentials if email scanning connectors exist (use system secure storage / keychain).

- Permissions
  - The app requests only the permissions necessary for its functions (email access, file access, storage). Exact Android/iOS permission declarations must be checked in platform manifests.

Note: Please verify the repository for exact encryption libraries, secure storage usage, and permission declarations.

---

## How local storage works

- Local-first storage
  - App stores parsed receipts, transactions, and subscription records locally.

- Database & model details (needs confirmation)
  - Likely a local SQL-based database (SQLite) or Flutter-friendly ORM (e.g., drift) because these are common in Flutter apps handling structured data.
  - Data models to expect:
    - Receipt / Transaction model: merchant, amount, date, category, raw_text, source metadata
    - Subscription model: merchant, recurring_amount, cadence, status, first_seen, last_seen
    - Backup / settings model: user preferences and migration history

- Migrations
  - Look for migration scripts or a migrations folder to confirm versioning strategy and schema evolution.

- Backup/restore format
  - Likely supports file-based export/import (JSON or DB file). Confirm exact format and whether exports are encrypted.

(Repository access required to enumerate exact models, table schemas, and migration code.)

---

## UI & theming

- Flutter UI
  - The app UI is built using Flutter (Dart). Expect a standard lib/ folder with UI screens, widgets, and state management.

- Material 3 / Material You
  - UI likely follows Material 3 guidelines, offering:
    - Modern Material component usage
    - Dynamic color theming (Material You) if platform supports dynamic color
    - Light and dark themes with accessible contrast

- Accessibility
  - The app should expose appropriate semantics for screen readers, scalable font sizes, and high-contrast themes. Verify presence of semantics labels and accessibility testing.

- State management
  - Check code for state management approach (Provider, Riverpod, Bloc, GetX, etc.) to onboard developers quickly.

---

## Limitations & intentionally excluded features

Explicitly NOT included (design non-goals)
- No payment processing or acting as a payments gateway.
- No personalized financial advice or product recommendation engine.
- No mandatory cloud sync for core data (local-first, privacy-first).
- Not a replacement for full-featured accounting software—focused on personal receipts, subscriptions, and insights.

Operational limitations to verify in code
- Offline OCR/AI capabilities — check whether OCR is local (e.g., via bundled native libraries) or uses external services.
- Email access limitations — if email scanning is supported, provider-specific connectors or OAuth flows may be needed.

---

## Contributing

Getting started as a developer
- Fork the repository and open a feature branch.
- Follow the Installation steps to run the app locally.
- Run tests (if present) and add tests for new features.

Recommended workflow
- Use small, focused pull requests with a clear description and linked issue.
- Follow code style and lint rules defined in the repository (check analysis_options.yaml and .editorconfig).
- Include unit/widget tests for Dart code and integration tests for critical flows (parsing, backup/restore).

Developer docs & architecture
- Look for docs/ or docs/*.md and HTML files in the repo for architecture diagrams and onboarding notes.
- Native modules: check README in native folders for build and debugging instructions (C++, CMake, Swift).

Code of Conduct
- Follow community standards listed in CONTRIBUTING.md or CODE_OF_CONDUCT.md if present.

---

## License

- License file not visible from repository metadata provided here. Please check the repository root for a LICENSE or COPYING file and add the license badge and text to this README accordingly.

---

## Notes / verification required

This README is a careful draft based on the repository description and repository language composition metadata you provided. To make this README fully accurate and executable, I need direct access to the repository contents to verify and replace the "needs confirmation" points with exact details (package names, database engine, config keys, file paths, tests, CI instructions, and license text).

How I can finalize this README
- Make the repository accessible (public or invite a read-capable account), or
- Paste the following files here (or upload a zip):
  - pubspec.yaml
  - lib/ (Dart source)
  - any DB / migration files
  - native folders (android/, ios/, macos/) if they contain native modules
  - README or docs already in repo
  - LICENSE (if present)

Once I can inspect code, I will:
- Insert exact installation commands, dependencies, and platform notes
- List concrete configuration keys and where they are stored
- Specify exact local storage engine and schema
- Confirm encryption and privacy implementations
- Add license text and contribution links

---

If you want, I can produce a final README now using only the information already in the repository (if you grant access) or refine this draft where you paste specific files. Which do you prefer?
