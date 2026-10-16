# islami

Islami is a premium, minimalist Islamic companion app built with Flutter. It provides Quran browsing, Hadith collections, audio recitation radio, Sebha (tasbeeh) counter, and prayer times — all with a clean, professional design.

## Features

| Tab | Description |
|-----|-------------|
| Quran | Browse suras, search by name, and track most recently read suras |
| Hadith | Read 70 structured hadiths with category filtering (general, morning, evening) |
| Radio | Stream Quran recitation from multiple reciters via mp3quran API |
| Sebha | Tasbeeh counter with haptic rotation animation |
| Time | Prayer times (Fajr, Sunrise, Dhuhr, Asr, Maghrib, Isha, Qibla) based on your location |

## Tech Stack

- **Flutter** 3.47.6 / **Dart** 3.13.5
- **State management:** flutter_bloc / bloc / equatable (Cubit pattern)
- **Audio:** just_audio
- **Prayer times:** adhan_dart
- **Location:** geolocator
- **HTTP:** http
- **Persistence:** shared_preferences
- **SVG:** flutter_svg
- **Images:** carousel_slider, auto_size_text, smooth_page_indicator

## Project Structure

```
lib/
  features/
    hadith/          # Hadith feature: cubit, data, models
    prayer_times/    # Prayer times feature: cubit, data, models
    quran/           # Quran feature: cubit, data, models
    radio/           # Radio feature: cubit, data, models
    sebha/           # Sebha feature: cubit, data, models
  Screens/
    home/            # Home shell + tabs (Quran, Hadith, Radio, Sebha, Time)
    onboarding/      # Onboarding screens
  appTheme.dart      # App theme (light/dark)
  main.dart          # App entry point
  widgets/           # Shared widgets
```

## Architecture

All features follow a **BlocProvider Cubit pattern**:
- `Cubit` — state management and business logic
- `State` — immutable state (Equatable)
- `Repository` — data access (API, local storage)
- `Model` — data entities (Equatable)

Tabs are registered in `lib/Screens/home/home_screen.dart` and rendered via `BlocProvider`.

## Getting Started

### Prerequisites

- Flutter SDK 3.47.6+
- Dart SDK 3.13.5+

### Installation

```bash
# Clone the repository
git clone https://github.com/OmarAdel10/islami.git
cd islami

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Android Setup

The app requires location permissions for prayer times. These are already declared in `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

### Release Build

```bash
flutter build apk --release
```

## CI/CD

- **CI** (`.github/workflows/islami-ci.yml`): Dart format, Flutter analyze, and Flutter test run on every push and pull request.
- **CD** (`.github/workflows/islami-cd.yml`): Release APK build triggered on version tags (`v*`) pushed to `master`.

## License

This project is private and not intended for publication.
