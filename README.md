# PennyPilot

A local-first personal finance app built with Flutter. Runs on-device AI to scan receipts, detect subscriptions, and track spending — all without sending your data to the cloud.

## What it does

- **Receipt scanning** — Uses Google ML Kit and MediaPipe to extract merchants, dates, and line items from receipts on-device
- **Subscription tracking** — Identifies recurring charges and alerts you to price changes
- **Local-first storage** — All data stays in an Isar database on your device
- **Biometric lock** — Secured with fingerprint/face authentication
- **CRDT sync** — P2P synchronization across devices without a central server

## Tech stack

- Flutter 3.38+
- Riverpod for state management
- Isar + Drift for local storage
- Google ML Kit / MediaPipe for OCR
- TFLite for on-device ML

## Getting started

```bash
# Clone
git clone https://github.com/Its-Juice/PennyPilot.git

# Install dependencies
flutter pub get

# Generate code
dart run build_runner build --delete-conflicting-outputs

# Generate localization strings
flutter gen-l10n

# Run
flutter run
```

**Requirements:** Flutter SDK 3.38+ (stable channel), Android Studio or Xcode

## Contributing

1. Fork the repo
2. Create a feature branch
3. Make sure `flutter analyze` passes
4. Open a PR

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## License

MIT — see [LICENSE](LICENSE)
