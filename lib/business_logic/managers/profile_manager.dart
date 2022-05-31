import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/auth_service.dart';
import '../../constants/all_constants.dart';


class ProfileManager extends ChangeNotifier {
  late String _email;

  String get email => _email;

  // TODO: Create a constructor that will initialize the properties from shared preferences

  /// Returns true if email address is already exist.  
  /// /// This function don't handle errors, you must handle it in the UI
  Future<bool> checkEmail(String emailAddress) async {
    try {
      final isEmailExist = await AuthService.checkEmail(emailAddress);
      if (isEmailExist) {
        changeEmail(emailAddress);
      }
      return isEmailExist;
    } catch (e) {
      rethrow;
    }
  }


  void changeEmail(String newEmail) async {
    _email = newEmail;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyEmail, newEmail);
    notifyListeners();
  }

  void fetchEmail() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(keyEmail)) {
      final email = prefs.getString(keyEmail)!;
      _email = email;
      notifyListeners();
    }
  }

// TODO: Create method to change [User] properties:
// final String userID;
// final String username;
// final String firstName;
// final String lastName;
// final String photoURL;
// final DateTime birthdayDate;
// final String bio;
// final int numberOfPosts;
// final bool isPrivateAccount;
}
