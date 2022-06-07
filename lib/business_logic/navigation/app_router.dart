import 'package:flutter/material.dart';
import 'package:gather/ui/screens/home_screen.dart';

import '../managers/all_managers.dart';
import '../../../ui/screens/all_screens.dart';

/// Configure which page to display.
///
/// This class listen to [AppStateManager] and holds list of pages to display,
/// then change which page to display according to app state.
class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;
  final SignUpManager signUpManager;
  final SignInManager signInManager;
  final ProfileManager profileManager;

  AppRouter({
    required this.appStateManager,
    required this.signUpManager,
    required this.signInManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    signUpManager.addListener(notifyListeners);
  }

  /// Configure navigator, list of pages, and pages that is displayed
  @override
  Widget build(BuildContext context) {
    // var appState = Provider.of<AppStateManager>(context, listen: false);
    // var signUpState = Provider.of<SignUpManager>(context, listen: false);
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        // BuildScreen.page(),

        // On boarding
        if (!appStateManager.isOnBoardingComplete && !appStateManager.isLoggedIn) OnBoardingScreen.page(),
        OnBoardingScreen.page(),

        // // Sign up
        if (appStateManager.isOnBoardingComplete &&
            !appStateManager.isLoggedIn &&
            signUpManager.isSigningUp &&
            signUpManager.currentIndex >= 0)
          SignUpScreen.page(),
        if (!appStateManager.isLoggedIn &&
            signUpManager.isSigningUp &&
            signUpManager.currentIndex >= 1)
          SignUpAccountScreen.page(),
        if (!appStateManager.isLoggedIn &&
            signUpManager.isSigningUp &&
            signUpManager.currentIndex >= 2)
          SignUpProfileScreen.page(),
        if (!appStateManager.isLoggedIn &&
            signUpManager.isSigningUp &&
            signUpManager.currentIndex >= 3)
          SignUpAboutScreen.page(),

        if (appStateManager.isLoggedIn && !appStateManager.isEmailVerificationComplete)
          EmailVerificationScreen.page(),

        // Sign in
        // if (appState.isOnBoardingComplete &&
        //     !appState.isLoggedIn &&
        //     signInManager.isSigningIn)
        //   SignInScreen.page(),

        // TODO: Add home screen
        if (appStateManager.isLoggedIn && appStateManager.isEmailVerificationComplete)
          HomeScreen.page(0),
      ],
    );
  }

  /// Handle back button when pressed.
  bool _handlePopPage(Route<dynamic> route, result) {
    if (route.settings.name!.contains('sign-up')) {
      if (signUpManager.currentIndex > 0) {
        signUpManager.backSignUpScreen();
      }
    }

    final didPop = !route.didPop(result);
    if (didPop) {
      return false;
    }

    // TODO: Handle on boarding
    // TODO: Handle sign up

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    signUpManager.dispose();
    super.dispose();
  }
}
