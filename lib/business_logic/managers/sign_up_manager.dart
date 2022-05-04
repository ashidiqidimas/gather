import 'package:flutter/material.dart';

/// Manage sign up screen.<br>
///
/// By default, [isSigningUp] is set to true.
class SignUpManager extends ChangeNotifier {
  bool _isSigningUp = true;
  
  bool get isSigningUp => _isSigningUp;
  
  void hideSignUp() {
    _isSigningUp = false;
    notifyListeners();
  }
  
  void showSignIn() {
    _isSigningUp = false;
    // Provider.of(context)
    notifyListeners();
  }

}

class SignUpIndex {
  static const start = 0;
  static const continueWIthEmail = 1;
}
