# MindSpeak Mobile App

MindSpeak is a Flutter mobile application for an EEG-based communication graduation project. The application is designed for patients/end users: it receives the result produced by the EEG and AI pipeline, then presents the predicted word and session information in a simple, accessible interface.

> The mobile app does not train or run the AI model. It will integrate with the AI/backend teammate's API once the final API contract is available.

## Current progress

- Flutter project setup for Android
- MindSpeak splash screen
- Clean medical/AI visual design system
- Animated connection/loading indicator
- Basic widget test for the splash screen

## Planned screens

1. Splash
2. Welcome / Login
3. Home
4. EEG recording session
5. AI processing
6. Predicted-word result
7. Session history and details
8. Profile / Settings

## Design direction

- Light, clean background
- Navy and blue medical/technology accents
- Rounded cards and clear typography
- Visible connection, recording, processing, success, and error states
- EEG waveform motifs used as a recognizable visual element

## Requirements

- Flutter SDK (the project was created with Flutter 3.47.3)
- Dart SDK bundled with Flutter
- Android Studio and Android SDK for Android emulator/device testing
- VS Code with the Flutter and Dart extensions

## Run locally

From the project folder, run:

```powershell
flutter pub get
flutter analyze
flutter run
```

To see available emulators and devices:

```powershell
flutter devices
```

## Project structure

```text
lib/
  main.dart                 # App entry point and current splash screen
test/
  widget_test.dart          # Splash-screen widget test
android/                    # Android platform configuration
```

## AI/API integration plan

The mobile app will later receive data from the AI/backend service. The API details need to be agreed with the AI teammate, including:

- API base URL and authentication approach
- How a new EEG session is started
- Processing status format
- Predicted word field
- Confidence score field
- Error and retry responses
- Whether EEG waveform data is returned

Until then, the UI can use mock data while the user flow is implemented.

## Useful Flutter commands

```powershell
flutter analyze       # Check Dart/Flutter code for issues
flutter test          # Run widget tests
flutter pub get       # Download project packages
flutter clean         # Remove generated build files when needed
```

## Team workflow

1. Create a separate branch for each feature, for example `feature/login-screen`.
2. Commit small, focused changes with clear messages.
3. Pull the latest `main` branch before starting new work.
4. Keep API keys and private URLs out of Git; use local configuration files that are ignored by Git when needed.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
