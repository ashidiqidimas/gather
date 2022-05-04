import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/all_constants.dart';

class AppStateManager extends ChangeNotifier {
  AppStateManager() {
    fetchSharedPreferences();
    _fetchAuthState();
  }

  late bool _isOnBoardingComplete = false;
  late bool _isLoggedIn = false;
  int _selectedTab = GatherTab.timeline;

  /// Returns the home screen's tab index that is currently in.
  int get selectedTab => _selectedTab;

  /// Returns whether the user has completed on boarding.<br>
  /// In this case, user is for all user in this phone, not a particular user.
  bool get isOnBoardingComplete => _isOnBoardingComplete;

  /// Returns whether user has logged in.
  bool get isLoggedIn => _isLoggedIn;

  void fetchSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(keyIsOnBoardingComplete)) {
      prefs.getBool(keyIsOnBoardingComplete)!
          ? _isOnBoardingComplete = true
          : _isOnBoardingComplete = false;
    } else {
      await prefs.setBool(keyIsOnBoardingComplete, false);
      _isOnBoardingComplete = false;
    }
    debugPrint('is onboarding complete? $_isOnBoardingComplete');
    notifyListeners();
  }

  /// Set app state to complete on boarding for **all user** in this phone.
  void completeOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsOnBoardingComplete, true);
    _isOnBoardingComplete = true;

    notifyListeners();
  }

  void _fetchAuthState() async {
    // TODO: fetch user state from firebase auth, is it better to use callback?
    _isLoggedIn = false;
  }

  /// Log in a user with email and password.<br>
  /// This will interact with Firebase Auth
  void logIn(String email, String password) {
    // TODO: setup login state with firebase auth
    _isLoggedIn = true;

    notifyListeners();
  }

  void goToTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  void logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsOnBoardingComplete, false);
    _isOnBoardingComplete = false;
    _selectedTab = GatherTab.timeline;

    // TODO: Call firebase auth to log out

    notifyListeners();
  }
}
