import 'package:firebase_auth/firebase_auth.dart';
// TODO: Import google sign in

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Returns true if email address is already exist.
  static Future<bool> checkEmail(String emailAddress, Function(Object error) errorHandler) async {
    try {
      // Fetch sign-in methods for the email address
      final list =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);

      // In case list is not empty
      if (list.isNotEmpty) {
        // Return true because there is an existing
        // user using the email address
        return true;
      } else {
        // Return false because email adress is not in use
        return false;
      }
    } catch (error) {
      errorHandler(error);
      return true;
    }
  }
}
