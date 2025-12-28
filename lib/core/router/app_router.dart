import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../features/onboarding/screens/onboarding_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/signup_screen.dart';
import '../../features/home/screens/main_screen.dart';
import '../../features/paywall/screens/paywall_screen.dart';
import '../providers/auth_provider.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final hasSeenOnboarding = authProvider.hasSeenOnboarding;
      final isAuthenticated = authProvider.isAuthenticated;
      
      final isOnOnboarding = state.matchedLocation == '/onboarding';
      final isOnAuth = state.matchedLocation == '/login' || state.matchedLocation == '/signup';
      final isOnPaywall = state.matchedLocation == '/paywall';
      
      // If hasn't seen onboarding, redirect to onboarding
      if (!hasSeenOnboarding && !isOnOnboarding) {
        return '/onboarding';
      }
      
      // If not authenticated and not on auth screens, redirect to login
      if (hasSeenOnboarding && !isAuthenticated && !isOnAuth && !isOnOnboarding) {
        return '/login';
      }
      
      // If authenticated and on auth screens, redirect to home
      if (isAuthenticated && (isOnAuth || isOnOnboarding)) {
        return '/';
      }
      
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/paywall',
        builder: (context, state) => const PaywallScreen(),
      ),
    ],
  );
}

