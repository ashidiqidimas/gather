import 'package:flutter/material.dart';
import 'package:gather/business_logic/models/failure.dart';
import 'package:gather/business_logic/services/db_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/auth_service.dart';
import '../../constants/all_constants.dart';

class ProfileManager extends ChangeNotifier {
  late String _email;
  late String _username;

  String get email => _email;

  String get username => _username;

  // TODO: Create a constructor that will initialize the properties from shared preferences

  /// Returns true if email address is already exist.
  /// /// This function don't handle errors, you must handle it in the UI
  Future<bool> checkEmail(String emailAddress) async {
    try {
      final isEmailExist = await AuthService.checkEmail(emailAddress);
      if (isEmailExist) {
        updateEmail(emailAddress);
      }
      return isEmailExist;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> checkUsername(String username) async {
    try {
      final isUnique = await DBService.isUsernameUnique(username);
      if (!isUnique) {
        debugPrint('Username already exist');
        throw Failure('Username already exist');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> changeUsername(String username) async {
    try {
      await DBService.setUsername(username);
      _updateUsername(username);
    } catch (e) {
      rethrow;
    }
  }

  void _updateUsername(String username) async {
    _username = username;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyUsername, username);
    notifyListeners();
  }

  void updateEmail(String newEmail) async {
    _email = newEmail;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyEmail, newEmail);
    notifyListeners();
  }

  /// Fetch username from SharedPreferences then notify its listener
  void _fetchUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString(keyUsername);
    if (username != null) {
      _username = username;
      notifyListeners();
    }
  }

  /// Fetch email from SharedPreferences then notify its listener
  void _fetchEmail() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(keyEmail)) {
      final email = prefs.getString(keyEmail)!;
      _email = email;
      notifyListeners();
    }
  }

// TODO: Create method to change [User] properties:
// final String userID;
// final String firstName;
// final String lastName;
// final String photoURL;
// final DateTime birthdayDate;
// final String bio;
// final int numberOfPosts;
// final bool isPrivateAccount;
}
