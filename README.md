# Flutter Mobile App Template 🚀

A comprehensive Flutter mobile app template with all the essential features you need to quickly start building your app. This template includes onboarding screens, authentication, paywall/subscription management, bottom navigation, theme management, and more.

## ✨ Features

### 🎯 Core Features
- **Onboarding Screens** - Beautiful animated onboarding flow with smooth page indicators
- **Authentication** - Complete login and signup screens with form validation
- **Paywall/Subscription** - Premium subscription screen with multiple pricing tiers
- **Bottom Navigation** - Modern bottom navigation bar with 3 tabs
- **Theme Management** - Light and dark mode support with toggle
- **State Management** - Provider pattern for efficient state management
- **Routing** - Go Router for clean navigation with automatic redirects

### 🎨 UI/UX
- Modern Material Design 3
- Smooth animations with AnimateDo
- Custom color palette and gradients
- Responsive layouts
- Beautiful typography with Google Fonts (Inter)
- Consistent spacing and styling

### 📱 Screens Included
1. **Onboarding** - 3 animated screens introducing your app
2. **Login** - Email/password login with social auth options
3. **Signup** - Registration with form validation
4. **Home** - Dashboard with activity feed and stats
5. **Explore** - Categories and trending content
6. **Profile** - User profile with settings
7. **Paywall** - Subscription plans with feature comparison

## 🏗️ Project Structure

```
lib/
├── main.dart                      # App entry point
├── core/
│   ├── theme/
│   │   ├── app_theme.dart         # Light & dark theme definitions
│   │   └── app_colors.dart        # Color palette
│   ├── providers/
│   │   ├── auth_provider.dart     # Authentication state
│   │   ├── theme_provider.dart    # Theme state
│   │   └── subscription_provider.dart  # Subscription state
│   └── router/
│       └── app_router.dart        # Navigation configuration
└── features/
    ├── onboarding/
    │   └── screens/
    │       └── onboarding_screen.dart
    ├── auth/
    │   └── screens/
    │       ├── login_screen.dart
    │       └── signup_screen.dart
    ├── paywall/
    │   └── screens/
    │       └── paywall_screen.dart
    ├── home/
    │   └── screens/
    │       ├── main_screen.dart   # Bottom nav wrapper
    │       └── home_tab.dart
    ├── explore/
    │   └── screens/
    │       └── explore_tab.dart
    └── profile/
        └── screens/
            └── profile_tab.dart
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- iOS Simulator / Android Emulator / Physical Device

### Installation

1. **Clone or download this template**

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

4. **Create asset directories** (if you want to add images)
```bash
mkdir -p assets/images
mkdir -p assets/icons
```

## 📦 Dependencies

- **provider** - State management
- **go_router** - Declarative routing
- **shared_preferences** - Local data persistence
- **google_fonts** - Beautiful typography
- **animate_do** - Smooth animations
- **smooth_page_indicator** - Onboarding page indicators
- **in_app_purchase** - Subscription management (ready to implement)
- **flutter_svg** - SVG support

## 🎨 Customization

### Colors
Edit `lib/core/theme/app_colors.dart` to customize your color palette:
```dart
static const Color primary = Color(0xFF6366F1);
static const Color secondary = Color(0xFF8B5CF6);
```

### Theme
Modify `lib/core/theme/app_theme.dart` for theme customization:
- Font family
- Button styles
- Input decoration
- Card styles
- And more...

### Onboarding Content
Update the onboarding pages in `lib/features/onboarding/screens/onboarding_screen.dart`:
```dart
final List<OnboardingPage> _pages = [
  OnboardingPage(
    icon: Icons.rocket_launch_rounded,
    title: 'Your Title',
    description: 'Your description',
    gradient: AppColors.primaryGradient,
  ),
  // Add more pages...
];
```

### Subscription Plans
Customize pricing tiers in `lib/features/paywall/screens/paywall_screen.dart`:
```dart
final List<SubscriptionPlan> _plans = [
  SubscriptionPlan(
    name: 'Premium',
    price: '\$9.99',
    period: 'month',
    features: ['Feature 1', 'Feature 2'],
    // ...
  ),
];
```

## 🔧 Configuration

### Authentication
The template includes a basic authentication flow with local storage. To integrate with a real backend:

1. Update `lib/core/providers/auth_provider.dart`
2. Replace the mock login/signup methods with actual API calls
3. Add your authentication service (Firebase, Supabase, custom backend, etc.)

### Subscriptions
To implement real in-app purchases:

1. Set up your products in App Store Connect and Google Play Console
2. Update `lib/core/providers/subscription_provider.dart`
3. Implement the `in_app_purchase` package logic
4. Add your product IDs

## 🎯 Next Steps

This template provides a solid foundation. Here's what you can add:

- [ ] Implement real authentication (Firebase, Supabase, etc.)
- [ ] Add in-app purchase logic
- [ ] Create more feature screens
- [ ] Add notifications
- [ ] Implement analytics
- [ ] Add crash reporting
- [ ] Create a splash screen
- [ ] Add localization (multi-language support)
- [ ] Implement deep linking
- [ ] Add social sharing
- [ ] Create settings screens

## 💡 Tips

1. **Start with your feature screens** - The core navigation and auth flow are ready
2. **Customize the theme first** - Make it match your brand
3. **Update onboarding content** - Tell your app's story
4. **Configure the paywall** - Set your pricing and features
5. **Build your features** - Focus on what makes your app unique

## 📝 State Management

This template uses Provider for state management. The main providers are:

- **AuthProvider** - User authentication state
- **ThemeProvider** - Theme mode (light/dark)
- **SubscriptionProvider** - Subscription status

Add more providers as needed for your features.

## 🔒 Security Notes

- Never commit API keys or secrets to version control
- Use environment variables for sensitive data
- Implement proper authentication on your backend
- Validate all user inputs
- Use HTTPS for all network requests

## 🐛 Troubleshooting

**Problem**: Dependencies not installing
```bash
flutter clean
flutter pub get
```

**Problem**: Build errors
```bash
flutter pub upgrade
flutter clean
flutter run
```

**Problem**: Theme not updating
- Hot restart (not hot reload) may be needed for theme changes

## 📄 License

This template is free to use for any project, commercial or personal.

## 🤝 Contributing

Feel free to customize this template for your needs. Share your improvements!

## 📞 Support

If you need help:
- Check Flutter documentation: https://flutter.dev/docs
- Visit Flutter community: https://flutter.dev/community
- Search Stack Overflow: https://stackoverflow.com/questions/tagged/flutter

---

**Happy Building! 🎉**

Built with ❤️ using Flutter

