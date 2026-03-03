# 🌿 Raqiq — Prayer & Spiritual Tracker

Raqiq is a modern, minimal, and spiritually-inspired Islamic lifestyle app. V1 focuses on prayer tracking with a beautiful UI designed to foster consistency and spiritual refinement.

The name **Raqiq** represents softness of the heart, consistency, and spiritual elegance.

## ✨ Features (V1)

- **Manual Prayer Tracking**: Easily track your 5 daily prayers with a simple, haptic-enabled UI.
- **Yearly Contribution Heatmap**: A GitHub-style view of your prayer consistency throughout the year.
- **Dynamic Streak Counter**: Keep track of your full-day completion streaks (5/5 prayers).
- **Modern UI/UX**: Soft rounded corners, emerald accents, and smooth animations using `flutter_animate`.
- **Light & Dark Mode**: Persistent theme switching with a beautiful sun/moon toggle.
- **Privacy First**: Fully offline; all data is stored locally using Isar Database.

## 🛠 Tech Stack

- **Framework**: Flutter
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubit)
- **Database**: [isar_community](https://pub.dev/packages/isar_community) (Fast & NoSQL)
- **Heatmap**: [contribution_heatmap](https://pub.dev/packages/contribution_heatmap)
- **Animations**: [flutter_animate](https://pub.dev/packages/flutter_animate) & [confetti](https://pub.dev/packages/confetti)
- **Fonts**: Google Fonts (Inter)

## 🏗 Architecture

The project follows **Clean Architecture** principles to ensure scalability and maintainability:

- `core/`: Shared utilities and constants.
- `features/prayer_tracker/`:
  - `data/`: Isar models, data sources, and repository implementations.
  - `domain/`: Entities and repository interfaces.
  - `presentation/`: Cubits (state), screens, and modular widgets.

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Android Studio / VS Code
- Android minSdk 23 (required by Isar)

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/M7mdAbolila/Raqiq.git
   cd raqiq
   ```

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Generate Isar schemas:**

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```

---

_“Verily, in the remembrance of Allah do hearts find rest.” (Ar-Ra'd 13:28)_
