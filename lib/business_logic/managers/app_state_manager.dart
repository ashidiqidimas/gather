import 'package:flutter/material.dart';

import '../constants/gather_tab.dart';

class AppStateManager extends ChangeNotifier {
  // TODO: add onboarding and login state

  int _selectedTab = GatherTab.timeline;
  // TODO: add onboarding and login state getter

  int get selectedTab => _selectedTab;

  // TODO: Add login methods

  void goToTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }
}
