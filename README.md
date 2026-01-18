# PennyPilot

PennyPilot is an advanced, privacy-centric personal finance management system engineered for automated transaction tracking and subscription monitoring. Built on a local-first architecture, it utilizes on-device machine learning to provide comprehensive financial insights while maintaining absolute data sovereignty for the user.

## Executive Summary

The application addresses the vacuum in the market for automated financial tools that do not require cloud-based data aggregation. PennyPilot interfaces directly with the user's communication channels via secure protocols to extract financial data, processing all information locally through proprietary extraction logic and optimized on-device language models.

## Architectural Design Philosophy

### Local-First Data Sovereignty
At the core of PennyPilot is the principle that financial data should never leave the owner's control. The application functions as a stand-alone intelligent node. There is no central server, no cloud synchronization of sensitive data, and no third-party telemetry.

### Privacy-Preserving Automation
Automation is typically achieved by relinquishing data to third-party aggregators. PennyPilot reverses this model by bringing the aggregation logic to the user's hardware. By utilizing on-device OCR and Natural Language Processing (NLP), the system extracts transaction details from digital receipts and emails without external API calls.

## Core Capabilities

### Automated Transaction Ingestion
The system implements a direct interface for email providers via OAuth 2.0. It proactively identifies financial communications and extracts merchant names, line items, tax components, and total values with high-confidence accuracy.

### Subscription Intelligence and Lifecycle Monitoring
PennyPilot automatically categorizes recurring transactions to build a comprehensive map of the user's subscription ecosystem. It monitors for renewal cycles, price escalations, and dormant services to optimize the user's recurring expenditure.

### Predictive Liquidity Analysis
Through the Safe-to-Spend engine, the application calculates real-time available funds by cross-referencing ledger balances with projected upcoming obligations and historical spending patterns.

### Local Machine Learning Integration
Utilizing high-performance local inference engines, the application performs entity recognition and categorization. This allows for complex data extraction from unstructured sources (like receipt photos) without compromising user privacy.

## Technical Specifications

| Component | Technology |
| :--- | :--- |
| Framework | Flutter / Dart |
| State Management | Riverpod (Asynchronous Data Handling) |
| Persistence Layer | Isar Database (Wait-free, High-Performance NoSQL) |
| Intelligence Engine | MediaPipe / Localized Gemma Inference |
| Authentication | Google OAuth 2.0 (Scoped Access) |
| Security | Biometric Local Auth / AES-256 Export Encryption |

## Development and Implementation Guide

### Prerequisites
* Flutter SDK (Stable Channel)
* Dart SDK (Compatible with Flutter Stable)
* Android Studio / Xcode (Platform-specific build tools)
* Google Cloud Platform Project (Configured for OAuth 2.0)

### Configuration Environment
Before execution, the following environment-specific configurations must be established:

1. **Authentication Secrets**: Configure `lib/src/config/secrets.dart` with valid client credentials.
2. **Android Signature Registration**: Register the development and production SHA-1 fingerprints within the Google Cloud Console for the application identifier `com.example.pennypilot`.

### Build and Deployment
To prepare the environment and initiate a build:

```bash
# Fetch dependencies
flutter pub get

# Generate supporting code (Isar schemas, Riverpod providers)
dart run build_runner build --delete-conflicting-outputs

# Execute debug build
flutter run
```

## Security Infrastructure

PennyPilot implements a zero-trust model regarding external infrastructure:

* **Scoped Permission Model**: The application requests only the minimum necessary permissions required to identify and read financial communications.
* **Sandbox Verification**: All data is stored within the application's protected sandbox, leveraging OS-level encryption where available.
* **Audit-Ready Codebase**: The transparent nature of the implementation allows for third-party verification of data handling practices.

## License

This project is released under the MIT License. Detailed terms can be found in the accompanying LICENSE file.

---
PennyPilot Project and Contributors