import 'package:flutter/material.dart';
import 'package:gather/business_logic/services/auth_service.dart';

import '../models/user.dart';

class ProfileManager extends ChangeNotifier {
  late User _user;

  // TODO: Create a constructor that will initialize the properties from shared preferences


  /// Returns true if email address is already exist.
  Future<bool> checkEmail(String emailAddress) async {
    errorHandler(error) {
      // TODO: Handle when network error
      Exception(error);
    };

    final isEmailExist = await AuthService.checkEmail(emailAddress, errorHandler);
    if (isEmailExist) {
      changeEmail(emailAddress);
    }

    return isEmailExist;
  }

  void changeEmail(String newEmail) {
    _user.email = newEmail;
    notifyListeners();
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
