import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:gather/business_logic/managers/app_state_manager.dart';
import 'package:gather/constants/all_constants.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Testing fetchOnBoardingSharedPreferences()', () {
    test('Test if key on boarding still not exist', () async {
      var appStateManager = AppStateManager();

      SharedPreferences.setMockInitialValues({});

      await appStateManager.fetchOnBoardingSharedPreferences();
      final prefs = await SharedPreferences.getInstance();
      final result = prefs.getBool(keyIsOnBoardingComplete);

      expect(result, false);
    });

    // test('Test if key on boarding already exist and set to true', () async {
    //   var appStateManager = AppStateManager();
    //
    //   SharedPreferences.setMockInitialValues({keyIsOnBoardingComplete: true});
    //
    //   await appStateManager.fetchOnBoardingSharedPreferences();
    //   final prefs = await SharedPreferences.getInstance();
    //   final result = prefs.getBool(keyIsOnBoardingComplete);
    //
    //   expect(result, false);
    // });
    //
    // test('Test if key on boarding already exist and set to false', () async {
    //   var appStateManager = AppStateManager();
    //
    //   SharedPreferences.setMockInitialValues({keyIsOnBoardingComplete: false});
    //
    //   await appStateManager.fetchOnBoardingSharedPreferences();
    //   final prefs = await SharedPreferences.getInstance();
    //   final result = prefs.getBool(keyIsOnBoardingComplete);
    //
    //   expect(result, false);
    // });
  });
}
