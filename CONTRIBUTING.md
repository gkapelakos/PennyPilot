# Contributing to PennyPilot

First off, thank you for considering contributing to PennyPilot! It's people like you that make PennyPilot such a great tool for the privacy-conscious community.

We welcome contributions from everyone. By participating in this project, you agree to abide by our code of conduct.

## 🤝 How Can I Contribute?

### 🐛 Reporting Bugs

This section guides you through submitting a bug report for PennyPilot. Following these guidelines helps maintainers and the community understand your report, reproduce the behavior, and find related reports.

- **Use a clear and descriptive title** for the issue to identify the problem.
- **Describe the exact steps which reproduce the problem** in as much detail as possible.
- **Provide specific examples** to demonstrate the steps. Include links to files or GitHub projects, or copy/pasteable snippets, which you use in those examples.
- **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
- **Explain which behavior you expected to see instead and why.**
- **Include screenshots** which show you demonstrating the problem.

### 💡 Suggesting Enhancements

This section guides you through submitting an enhancement suggestion for PennyPilot, including completely new features and minor improvements to existing functionality.

- **Use a clear and descriptive title** for the issue to identify the suggestion.
- **Provide a step-by-step description of the suggested enhancement** in as much detail as possible.
- **Provide specific examples** to demonstrate the steps.
- **Describe the current behavior** and **explain which behavior you expected to see instead** and why.

### 💻 Pull Requests

The process described here has several goals:

- Maintain PennyPilot's quality
- Fix problems that are important to users
- Engage the community in working toward the best possible PennyPilot
- Enable a sustainable system for PennyPilot's maintainers to review contributions

Please follow these steps to have your contribution considered by the maintainers:

1.  **Fork the Repository** and create your branch from `main`.
2.  If you've added code that should be tested, add tests.
3.  If you've changed APIs, update the documentation.
4.  Ensure the test suite passes.
5.  Make sure your code lints.
6.  Issue that pull request!

## 🎨 Style Guide

### Git Commit Messages

- Use the present tense ("Add feature" not "Added feature")
- Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit the first line to 72 characters or less
- Reference issues and pull requests liberally after the first line

### Dart Style

We follow the official [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).

## 🛠️ Development Setup

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Its-Juice/PennyPilot.git
    cd PennyPilot
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Generate code (Isar, Riverpod, etc.):**
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the app:**
    ```bash
    flutter run
    ```

## 🌍 Translation / Localization

We use `flutter_localizations` and `.arb` files for internationalization.

To add a new language:
1.  Create a new `app_xx.arb` file in `lib/src/localization/l10n/`.
2.  Copy keys from `app_en.arb` and provide translations.
3.  Run `flutter gen-l10n`.

Thank you for your contributions!
