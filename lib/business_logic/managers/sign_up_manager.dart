import 'package:flutter/material.dart';

/// Manage sign up screen.<br>
///
/// By default, [isSigningUp] is set to true.
class SignUpManager extends ChangeNotifier {
  bool _isSigningUp = true;
  int _currentIndex = 0;

  bool get isSigningUp => _isSigningUp;
  int get getCurrentIndex => _currentIndex;
  
  void hideSignUp() {
    _isSigningUp = false;
    notifyListeners();
  }

  void nextSignUpScreen() {
    _currentIndex++;
    debugPrint('sign up index: $_currentIndex');
    notifyListeners();
  }
  
  void showSignIn() {
    _isSigningUp = false;
    // Provider.of(context)
    notifyListeners();
  }

}
