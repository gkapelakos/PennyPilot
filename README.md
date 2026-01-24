![PennyPilot Banner](assets/pennypilot%20banner.png)

**Your Financial Co-Pilot. Local-First. Privacy-Focused. Intelligent.**

PennyPilot is a modern, open-source personal finance tracker built for the privacy-conscious user. It leverages on-device AI to automate expense tracking without ever sending your sensitive financial data to the cloud.

---

## 🌟 Key Features

*   **🔒 Local-First & Privacy-Centric**
    *   All data is stored locally on your device using [Isar Database](https://isar.dev).
    *   No third-party cloud sync means your financial data stays yours.
    *   **Privacy Audit** logs ensure you know exactly what the app is doing.
    *   **Local-Only Mode** option to completely disable external network traffic.
    *   **Biometric Lock** support for an extra layer of security.

*   **🤖 On-Device Intelligence**
    *   **Receipt Scanning:** Instantly extract merchant, date, and amount from physical receipts using on-device OCR and local LLM processing.
    *   **Smart Categorization:** Transactions are automatically categorized based on your history and merchant patterns.
    *   **Subscription Intelligence:** Automatically detects recurring payments, identifies "zombie" subscriptions, and alerts you to price hikes.

*   **📧 Email Receipt Scanner**
    *   Connect your email to scan for digital receipts via IMAP.
    *   Processing happens locally on your device—your emails are never uploaded to our servers.

*   **💸 Comprehensive Tracking**
    *   **Multi-Currency Support:** Add transactions in any currency; PennyPilot automatically converts them to your primary currency using real-time exchange rates.
    *   **Budgeting:** Set monthly budgets and track your "Safe to Spend" daily allowance.
    *   **Insights:** Visualize spending patterns with clear, vibrant charts and breakdowns.

*   **🎨 Premium User Experience**
    *   **Dynamic Design:** Merchant icons automatically generate unique, consistent pastel backgrounds.
    *   **Modern UI:** Built with Flutter, featuring deep dark mode support, glassmorphism elements, and smooth animations.

---

## 🛠 Technology Stack

*   **Framework:** [Flutter](https://flutter.dev)
*   **State Management:** [Riverpod](https://riverpod.dev)
*   **Local Database:** [Isar](https://isar.dev)
*   **AI & ML:**
    *   [Google ML Kit](https://developers.google.com/ml-kit) for on-device Text Recognition (OCR).
    *   [MediaPipe GenAI](https://developers.google.com/mediapipe/solutions/genai/llm_inference) for local LLM inference.
*   **Authentication:** Local Authentication & OAuth for optional email integration.

---

## 🚀 Getting Started

### Prerequisites

*   Flutter SDK (3.2.0 or higher)
*   Android / iOS / Linux / Windows development environment

### Installation

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

---

## 🤝 Contributing

We welcome contributions! Whether it's fixing bugs, improving documentation, or proposing new features, your help is appreciated.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.

---

<center>
  <img src="assets/pennypilot logo.png" width="100" />
  <p><i>Fly your finances safely.</i></p>
</center>