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
  }

  /// Configure navigator, list of pages, and pages that is displayed
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!Provider.of<AppStateManager>(context, listen: false)
            .isOnBoardingComplete)
          OnBoardingScreen.page(),
        if (!Provider.of<AppStateManager>(context, listen: false).isLoggedIn &&
            Provider.of<SignUpManager>(context).isSigningUp)
          SignUpScreen.page(),
        if (!Provider.of<AppStateManager>(context, listen: false).isLoggedIn &&
            Provider.of<SignInManager>(context).isSigningIn)
          SignInScreen.page(),
        // TODO: Add login screen
        // TODO: Add home screen
      ],
    );
  }

  /// Handle back button when pressed.
  bool _handlePopPage(Route<dynamic> route, result) {
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
    super.dispose();
  }
}
