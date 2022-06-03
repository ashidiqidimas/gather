import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gather/business_logic/models/failure.dart';
// TODO: Import google sign in

abstract class AuthService {
  static String? getUserID() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    return userID;
  }

  /// Returns true if email address is already exist.
  /// This function don't handle errors, you must handle it by yourself
  static Future<bool> checkEmail(String emailAddress) async {
    try {
      // Fetch sign-in methods for the email address
      final list =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);

      // In case list is not empty
      if (list.isNotEmpty) {
        // Return true because there is an existing user using the email address
        return true;
      } else {
        // Return false because email adress is not in use
        return false;
      }
    } on SocketException {
      throw Failure(
          'Can\'t connect to internet 😥. Please check your internet and try again');
    } on FirebaseAuthException catch (e) {
      throw Failure(e.message ?? 'Unknown error');
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> createAccountWithEmail(
      String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Failure('Password must at least 8 characters');
      } else if (e.code == 'email-already-in-use') {
        throw Failure('Account for $email already exist');
      }
    } catch (e) {
      rethrow;
    }
  }
}
