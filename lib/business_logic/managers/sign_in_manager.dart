import 'package:flutter/material.dart';

/// Manage sign in screen.<br>
///
/// By default, [isSigningIn] is set to false.
class SignInManager extends ChangeNotifier {
  bool _isSigningIn = false;

  bool get isSigningIn => _isSigningIn;

  void hideSignIn() {
    _isSigningIn = false;
    notifyListeners();
  }

  void showSignIn() {
    _isSigningIn = true;
    notifyListeners();
  }
}
