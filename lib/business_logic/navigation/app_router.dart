import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../managers/all_managers.dart';
import '../../../ui/screens/all_screens.dart';

/// Configure which page to display.<br>
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
    var appState = Provider.of<AppStateManager>(context, listen: false);
    var signUpState = Provider.of<SignUpManager>(context, listen: false);
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        // On boarding
        if (!appState.isOnBoardingComplete) OnBoardingScreen.page(),

        // Sign up
        if (!appState.isLoggedIn &&
            signUpState.isSigningUp &&
            signUpState.getCurrentIndex >= 0)
          SignUpScreen.page(),
        if (!appState.isLoggedIn &&
            signUpState.isSigningUp &&
            signUpState.getCurrentIndex >= 1)
          SignUpAccountScreen.page(),
        // if (!appStateManager.isLoggedIn &&
        //     signUpManager.isSigningUp &&
        //     signUpManager.getCurrentIndex >= 2)
        //   SignUpProfileScreen.page(),
        SignUpProfileScreen.page(), // TODO: Delete

        // Sign in
        if (appState.isOnBoardingComplete &&
            !appState.isLoggedIn &&
            signInManager.isSigningIn)
          SignInScreen.page(),
        // TODO: Add home screen
      ],
    );
  }

  /// Handle back button when pressed.
  bool _handlePopPage(Route<dynamic> route, result) {
    if (route.settings.name!.contains('sign-up')) {
      signUpManager.backSignUpScreen();
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
