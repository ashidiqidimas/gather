import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gather/business_logic/models/failure.dart';
import 'package:gather/business_logic/services/db_service.dart';
import 'package:gather/business_logic/services/storage_service.dart';
import 'package:gather/business_logic/utils/util_functions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart';

import '../services/auth_service.dart';
import '../../constants/all_constants.dart';

class ProfileManager extends ChangeNotifier {
  late String _email;
  late String _username;
  late String _profilePicturePath;

  String get email => _email;

  String get username => _username;

  String? get userID => AuthService.getUserID();

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

  /// Returns Future String to the path of the image
  Future<String?> changeProfilePicture() async {
    try {
      final originalPath = await _pickImage();

      final croppedPath = await _cropImage(originalPath: originalPath);
      if (croppedPath == null) return null;
      debugPrint('Success cropped image with path: $croppedPath');

      final directory = await getApplicationDocumentsDirectory();
      final directoryPath = directory.path;
      final profileImageFile =
          await changeFileNameOnly(File(croppedPath), 'profile-picture');

      final fileName = basename(profileImageFile.path);
      final File localImage =
          await profileImageFile.copy('$directoryPath/$fileName');

      if (userID == null) throw Failure('User haven\'t log in');
      StorageService.setProfilePicture(
          imagePath: localImage.path, userID: userID!);

      _changeProfilePicture(localImage.path);
      return localImage.path;

    } catch (e) {
      rethrow;
    }
  }

  void _changeProfilePicture(String imagePath) async {
    _profilePicturePath = imagePath;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyProfilePicturePath, imagePath);
    notifyListeners();
  }

  /// Returns a path to the original image.
  /// This function can throw error when it failed to pick an image
  Future<String> _pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) throw Failure('Unknown error while tried to image');

      return image.path;
    } catch (e) {
      rethrow;
    }
  }

  /// Returns a path to the cropped image
  Future<String?> _cropImage({required String originalPath}) async {
    try {
      final croppedPath = await ImageCropper().cropImage(
        sourcePath: originalPath,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        cropStyle: CropStyle.circle,
        maxHeight: 400,
        maxWidth: 400,
        compressFormat: ImageCompressFormat.png,
        compressQuality: 30,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop Profile Picture',
              // toolbarColor: Colors.deepOrange,
              // toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Crop Profile Picture',
            minimumAspectRatio: 1 / 1,
            aspectRatioLockEnabled: true,
            resetButtonHidden: true,
            aspectRatioPickerButtonHidden: true,
          ),
        ],
      );

      if (croppedPath != null) {
        return croppedPath.path;
      } else {
        return null;
      }
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

  void _fetchChangeProfilePicture() async {
    final prefs = await SharedPreferences.getInstance();
    final profilePicturePath = prefs.getString(keyProfilePicturePath);
    if (profilePicturePath != null) {
      _profilePicturePath = profilePicturePath;
    } else {
      // TODO: fetch from Cloud Storage
    }

    notifyListeners();
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
