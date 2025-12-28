## 📁 Project Structure

```
FlutterTemplate/
│
├── lib/                           # Main source code
│   ├── main.dart                 # App entry point with providers setup
│   │
│   ├── core/                     # Core functionality (shared across features)
│   │   ├── theme/
│   │   │   ├── app_theme.dart   # Light & dark theme definitions
│   │   │   └── app_colors.dart  # Color palette and gradients
│   │   │
│   │   ├── providers/            # State management
│   │   │   ├── auth_provider.dart          # Authentication state
│   │   │   ├── theme_provider.dart         # Theme mode state
│   │   │   └── subscription_provider.dart  # Subscription state
│   │   │
│   │   └── router/
│   │       └── app_router.dart   # Navigation & routing config
│   │
│   └── features/                 # Feature-based organization
│       │
│       ├── onboarding/
│       │   └── screens/
│       │       └── onboarding_screen.dart  # 3-page onboarding flow
│       │
│       ├── auth/
│       │   └── screens/
│       │       ├── login_screen.dart       # Login form
│       │       └── signup_screen.dart      # Registration form
│       │
│       ├── paywall/
│       │   └── screens/
│       │       └── paywall_screen.dart     # Subscription plans
│       │
│       ├── home/
│       │   └── screens/
│       │       ├── main_screen.dart        # Bottom nav wrapper
│       │       └── home_tab.dart           # Home dashboard
│       │
│       ├── explore/
│       │   └── screens/
│       │       └── explore_tab.dart        # Browse content
│       │
│       └── profile/
│           └── screens/
│               └── profile_tab.dart        # User profile & settings
│
├── assets/                       # Static assets
│   ├── images/                   # PNG, JPG images (add yours here)
│   └── icons/                    # SVG icons (add yours here)
│
├── pubspec.yaml                  # Dependencies & assets config
├── analysis_options.yaml         # Linting rules
├── .gitignore                    # Git ignore rules
│
├── README.md                     # Complete documentation
├── QUICKSTART.md                 # Quick start guide
├── CHECKLIST.md                  # Feature customization checklist
└── STRUCTURE.md                  # This file
```

## 🎯 How to Navigate

### Adding a New Feature

Create this structure:
```
lib/features/your_feature/
├── screens/              # UI screens
│   └── feature_screen.dart
├── widgets/              # Reusable widgets (if needed)
│   └── feature_widget.dart
└── models/               # Data models (if needed)
    └── feature_model.dart
```

### Adding State Management

1. Create provider: `lib/core/providers/your_provider.dart`
2. Add to providers in `lib/main.dart`
3. Use with `Provider.of<YourProvider>(context)`

### Adding a New Screen

1. Create screen file in appropriate feature folder
2. Add route in `lib/core/router/app_router.dart`
3. Navigate with `context.go('/your-route')`

## 📦 What Each File Does

### Core Files

**main.dart**
- App initialization
- Provider setup
- Theme configuration
- Router setup

**app_router.dart**
- Route definitions
- Navigation logic
- Auth redirects
- Route guards

**app_theme.dart**
- Light theme
- Dark theme
- Button styles
- Input styles
- Typography

**app_colors.dart**
- Color constants
- Gradients
- Brand colors

### Providers

**auth_provider.dart**
- Login/logout
- Signup
- Auth state
- User data
- Onboarding status

**theme_provider.dart**
- Theme mode (light/dark/system)
- Theme toggle
- Persists preference

**subscription_provider.dart**
- Subscription status
- Purchase flow
- Restore purchases
- Subscription tiers

### Screens

**onboarding_screen.dart**
- First-time user experience
- Page view with indicators
- Animated content
- Completion handler

**login_screen.dart**
- Email/password form
- Form validation
- Social login buttons
- Navigation to signup

**signup_screen.dart**
- Registration form
- Password confirmation
- Terms acceptance
- Form validation

**paywall_screen.dart**
- Subscription plans
- Feature comparison
- Purchase buttons
- Restore purchases

**main_screen.dart**
- Bottom navigation
- Tab management
- Floating action button
- Navigation state

**home_tab.dart**
- Dashboard
- User stats
- Activity feed
- Welcome section

**explore_tab.dart**
- Search
- Categories
- Trending content
- Browse features

**profile_tab.dart**
- User info
- Settings
- Theme toggle
- Logout

## 🔄 Data Flow

```
User Action
    ↓
Screen (UI)
    ↓
Provider (State Management)
    ↓
[Your Backend/Service]
    ↓
Provider Updates State
    ↓
Screen Rebuilds
    ↓
UI Updates
```

## 🎨 Styling

All screens use:
- `Theme.of(context)` for theme colors
- `AppColors` for custom colors
- Google Fonts (Inter) for typography
- Material 3 design system
- Consistent spacing (8px base unit)

## 🧩 Extending the Template

### Add Backend Integration

Create: `lib/core/services/api_service.dart`
```dart
class ApiService {
  Future<User> login(String email, String password) {
    // Your API call
  }
}
```

### Add Data Models

Create: `lib/core/models/user_model.dart`
```dart
class User {
  final String id;
  final String email;
  final String name;
  
  User({required this.id, required this.email, required this.name});
}
```

### Add Custom Widgets

Create: `lib/core/widgets/custom_button.dart`
```dart
class CustomButton extends StatelessWidget {
  // Your reusable widget
}
```

## 📝 Naming Conventions

- **Files**: `snake_case.dart`
- **Classes**: `PascalCase`
- **Variables**: `camelCase`
- **Constants**: `SCREAMING_SNAKE_CASE` or `camelCase`
- **Private**: prefix with `_`

## 🎯 Best Practices

1. **One screen per file**
2. **Extract complex widgets**
3. **Keep providers focused**
4. **Use const constructors**
5. **Follow Flutter style guide**

---

This structure scales well from MVP to full production app! 🚀

