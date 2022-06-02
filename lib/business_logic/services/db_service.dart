import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gather/business_logic/models/failure.dart';

import 'auth_service.dart';

class DBService {
  /// Set a username in database with a userID.
  /// This method can throw errors
  static setUsername(String username) {
    final userID = AuthService.getUserID();
    final db = FirebaseFirestore.instance;

    final data = {"username": username};
    db
        .collection('users')
        .doc(userID)
        .set(data, SetOptions(merge: true))
        .onError((error, _) => throw Failure('Error writing document: $error'));
  }
}
