# Parcelwalaa - Quick Delivery App

A modern delivery application built with Flutter using Domain-Driven Design (DDD) and MVVM architecture patterns.

## 🚀 Features

- **Splash Screen**: Netflix-style zoom-out animation with custom branding
- **Bottom Navigation**: Clean, modern navigation with 4 main sections
- **DDD Architecture**: Domain-driven design with proper separation of concerns
- **MVVM Pattern**: Model-View-ViewModel architecture for clean code
- **State Management**: Riverpod with ChangeNotifier for reactive UI
- **Custom Icons**: SVG-based navigation icons
- **Responsive Design**: Works across different screen sizes

## 📱 Navigation Sections

1. **Home** 🏠 - Main dashboard and landing page
2. **Order Again** 📋 - Previous orders and reorder functionality
3. **Offers** 🎁 - Deals, discounts, and promotional content
4. **Profile** 👤 - User account management

## 🏗️ Project Architecture

### DDD (Domain-Driven Design) Structure

```
lib/
├── framework/                    # Core framework layer
│   ├── model/                   # Domain models
│   │   └── navigation/
│   │       ├── bottom_nav_item.dart
│   │       └── bottom_navigation_state.dart
│   ├── controller/              # Business logic controllers
│   │   ├── navigation/
│   │   │   └── bottom_navigation_controller.dart
│   │   └── splash_controller.dart
│   ├── provider/                # State management providers
│   │   └── navigation/
│   │       └── bottom_navigation_provider.dart
│   └── dependency_injection/    # DI configuration
├── ui/                          # Presentation layer
│   ├── screens/                 # Main screens
│   │   └── main_screen.dart
│   ├── widgets/                 # Reusable UI components
│   │   └── navigation/
│   │       └── custom_bottom_navigation_bar.dart
│   ├── splash/                  # Splash screen
│   │   └── splash_screen.dart
│   └── utils/                   # Utilities and helpers
│       ├── helpers/
│       │   └── icon_helper.dart
│       └── theme/
└── main.dart                    # App entry point
```

### MVVM Pattern Implementation

- **Models**: Freezed classes for immutable state management
- **ViewModels**: Controllers with ChangeNotifier for business logic
- **Views**: Flutter widgets with Riverpod for state observation

## 🎨 Design System

### Colors
- **Primary Yellow**: `#ffca26` - Main brand color
- **Zomato Red**: `#E23744` - For special integrations
- **Grey**: `Colors.grey[500]` - For unselected navigation items

### Icons
- **SVG Format**: Scalable vector graphics for crisp display
- **Custom Icons**: Home, Order Again, Offers, Profile
- **Material Icons**: Fallback for unsupported SVG paths

## 🛠️ Setup Instructions

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- iOS Simulator or Android Emulator
- Xcode (for iOS development)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd parcelwalaa
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run --debug
   ```

### Asset Generation

#### App Icons
```bash
dart run flutter_launcher_icons
```

#### Splash Screen
```bash
dart run flutter_native_splash:create
```

## 📦 Dependencies

### Core Dependencies
- `flutter_riverpod`: State management
- `freezed`: Immutable data classes
- `flutter_svg`: SVG icon support
- `flutter_screenutil`: Responsive design
- `hive_flutter`: Local storage
- `dio`: HTTP client

### Development Dependencies
- `build_runner`: Code generation
- `freezed`: Code generation for models
- `json_serializable`: JSON serialization
- `flutter_gen_runner`: Asset generation
- `flutter_launcher_icons`: App icon generation
- `flutter_native_splash`: Splash screen generation

## 🔧 Configuration Files

### App Icons (`flutter_launcher_icons.yaml`)
```yaml
flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/images/parcelwalaa_logo.jpg"
  adaptive_icon_background: "#ffca26"
  adaptive_icon_foreground: "assets/images/parcelwalaa_logo.jpg"
```

### Splash Screen (`flutter_native_splash.yaml`)
```yaml
flutter_native_splash:
  color: "#ffca26"
  image: assets/images/parcelwalaa_logo.jpg
  fullscreen: true
  android: true
  ios: true
```

## 🎯 Key Features Implementation

### Bottom Navigation Controller
- **Singleton Pattern**: Single instance across the app
- **State Management**: ChangeNotifier with Riverpod
- **Navigation Logic**: Clean tab switching with state updates

### Icon Helper
- **SVG Support**: Primary icon format
- **Material Icons**: Fallback for unsupported paths
- **Dynamic Coloring**: Selected/unselected states

### Splash Controller
- **Animation Management**: Netflix-style zoom-out effect
- **State Separation**: UI logic separated from animation logic
- **Navigation Callback**: Clean transition to main screen

## 🚀 Development Workflow

1. **Feature Development**: Follow DDD patterns
2. **State Management**: Use Riverpod providers
3. **UI Components**: Create reusable widgets
4. **Testing**: Unit tests for controllers
5. **Code Generation**: Run build_runner after model changes

## 📝 Code Conventions

### Naming Conventions
- **Files**: snake_case (e.g., `bottom_navigation_controller.dart`)
- **Classes**: PascalCase (e.g., `BottomNavigationController`)
- **Variables**: camelCase (e.g., `selectedIndex`)
- **Constants**: UPPER_SNAKE_CASE (e.g., `PRIMARY_COLOR`)

### Architecture Rules
- **Controllers**: Business logic only, no UI code
- **Models**: Immutable with Freezed
- **Providers**: Single responsibility
- **Widgets**: Stateless when possible, ConsumerWidget for state

## 🔄 State Management Flow

1. **User Action** → Widget
2. **Widget** → Controller method
3. **Controller** → State update
4. **State** → notifyListeners()
5. **Provider** → Widget rebuild

## 📱 Platform Support

- ✅ iOS (iPhone, iPad)
- ✅ Android (Phone, Tablet)
- ✅ Web (Responsive)
- ⏳ macOS (Planned)
- ⏳ Windows (Planned)

## 🐛 Troubleshooting

### Common Issues

1. **Build Errors**: Run `flutter clean` and `flutter pub get`
2. **Code Generation**: Run `dart run build_runner build --delete-conflicting-outputs`
3. **iOS Issues**: Clean Xcode build folder and reinstall pods
4. **State Issues**: Check provider dependencies and ref.watch usage

### Debug Commands
```bash
# Clean and rebuild
flutter clean && flutter pub get

# Regenerate code
dart run build_runner build --delete-conflicting-outputs

# iOS specific
cd ios && pod install && cd ..

# Run with debug
flutter run --debug
```

## 📄 License

This project is proprietary and confidential.

## 👥 Team

- **Developer**: Parcelwalaa Team
- **Architecture**: DDD + MVVM
- **Framework**: Flutter
- **State Management**: Riverpod

---

**Last Updated**: December 2024
**Version**: 1.0.0
