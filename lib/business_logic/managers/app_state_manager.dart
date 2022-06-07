import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/all_constants.dart';
import '../services/auth_service.dart';

class AppStateManager extends ChangeNotifier {
  AppStateManager() {
    fetchOnBoardingSharedPreferences();
    _fetchAuthState();
    listenAuthState();
  }

  bool _isOnBoardingComplete = false;
  bool _isLoggedIn = false;
  bool _isEmailVerificationComplete = false;
  int _selectedTab = GatherTab.timeline;

  /// Returns the home screen's tab index that is currently in.
  int get selectedTab => _selectedTab;

  /// Returns whether the user has completed on boarding.<br>
  /// In this case, user is for all user in this phone, not a particular user.
  bool get isOnBoardingComplete => _isOnBoardingComplete;

  /// Returns whether a user has logged in.
  bool get isLoggedIn => _isLoggedIn;

  /// Returns whether a user has verify their email.
  bool get isEmailVerificationComplete => _isEmailVerificationComplete;

  // TODO: Delete
  void testSignOut() {
    AuthService.signOut();
    if (FirebaseAuth.instance.currentUser == null) {
      debugPrint('Sign out success');
    } else {
      debugPrint('Sign out success');
    }
  }

  /// Fetch from the device whether user has complete on boarding
  Future<void> fetchOnBoardingSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(keyIsOnBoardingComplete)) {
      prefs.getBool(keyIsOnBoardingComplete)!
          ? _isOnBoardingComplete = true
          : _isOnBoardingComplete = false;
    } else {
      await prefs.setBool(keyIsOnBoardingComplete, false);
      _isOnBoardingComplete = false;
    }
    log('is onboarding complete? $_isOnBoardingComplete');
    // _isOnBoardingComplete = false; // TODO: Delete
    notifyListeners();
  }

  /// Set app state to complete on boarding for **all user** in this phone.
  void completeOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsOnBoardingComplete, true);
    _isOnBoardingComplete = true;
    await sendVerificationEmail();

    notifyListeners();
  }

  Future<void> sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
      debugPrint("Sent email to ${user?.email}");
    } catch (e) {
      rethrow;
    }
  }

  Future<void> listenAuthState() async {
    await FirebaseAuth.instance.currentUser?.reload();
    AuthService.listenToUserChanges((user) {
      if (user != null) {
        _signedIn();
        if (user.emailVerified) {
          _verifyEmail();
          debugPrint('User with email ${user.email}, ${user.emailVerified}');
        }
      } else {
        signOut();
      }
      debugPrint('User has verify: ${user?.emailVerified}');
    });
  }

  void completeSignUp() {
    _signedIn();
  }

  void _fetchAuthState() async {
    // TODO: fetch user state from firebase auth, is it better to use callback?
    _isLoggedIn = false;
  }

  void _signedIn() {
    _isLoggedIn = true;

    notifyListeners();
  }

  void goToTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  void _verifyEmail() {
    _isEmailVerificationComplete = true;
    notifyListeners();
  }

  void signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsOnBoardingComplete, false);
    _isLoggedIn = false;
    _isOnBoardingComplete = false;
    _selectedTab = GatherTab.timeline;
    AuthService.signOut();

    notifyListeners();
  }
}
