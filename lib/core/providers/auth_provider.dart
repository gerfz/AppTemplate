import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  static const String _authKey = 'is_authenticated';
  static const String _userEmailKey = 'user_email';
  static const String _onboardingKey = 'has_seen_onboarding';
  
  final SharedPreferences _prefs;
  bool _isAuthenticated = false;
  String? _userEmail;
  bool _hasSeenOnboarding = false;

  AuthProvider(this._prefs) {
    _loadAuthState();
  }

  bool get isAuthenticated => _isAuthenticated;
  String? get userEmail => _userEmail;
  bool get hasSeenOnboarding => _hasSeenOnboarding;

  Future<void> _loadAuthState() async {
    _isAuthenticated = _prefs.getBool(_authKey) ?? false;
    _userEmail = _prefs.getString(_userEmailKey);
    _hasSeenOnboarding = _prefs.getBool(_onboardingKey) ?? false;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    // TODO: Implement actual authentication logic
    await Future.delayed(const Duration(seconds: 1));
    
    _isAuthenticated = true;
    _userEmail = email;
    
    await _prefs.setBool(_authKey, true);
    await _prefs.setString(_userEmailKey, email);
    
    notifyListeners();
  }

  Future<void> signup(String email, String password) async {
    // TODO: Implement actual signup logic
    await Future.delayed(const Duration(seconds: 1));
    
    _isAuthenticated = true;
    _userEmail = email;
    
    await _prefs.setBool(_authKey, true);
    await _prefs.setString(_userEmailKey, email);
    
    notifyListeners();
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _userEmail = null;
    
    await _prefs.remove(_authKey);
    await _prefs.remove(_userEmailKey);
    
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    _hasSeenOnboarding = true;
    await _prefs.setBool(_onboardingKey, true);
    notifyListeners();
  }

  Future<void> resetOnboarding() async {
    _hasSeenOnboarding = false;
    await _prefs.remove(_onboardingKey);
    notifyListeners();
  }
}

