import 'package:flutter/material.dart';

import '../../styles/colors/gather_text_color.dart';
import '../../styles/gather_text_style.dart';

class GatherBottomNavigationBar extends StatelessWidget {
  int _currentIndex = 0;

  GatherBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: Colors.white,
      // elevation: 10,
      selectedItemColor: GatherTextColor.secondary,
      unselectedItemColor: GatherTextColor.tertiary,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: GatherTextStyle.bottomBarLabel(context),
      unselectedLabelStyle: GatherTextStyle.bottomBarLabel(context),
      type: BottomNavigationBarType.fixed,
      // TODO: Implement onTap that access state object
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset('assets/shared/icons/home.png'),
          activeIcon: Image.asset('assets/shared/icons/home_active.png'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/shared/icons/explore.png'),
          activeIcon: Image.asset('assets/shared/icons/explore_active.png'),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/shared/icons/bag.png'),
          activeIcon: Image.asset('assets/shared/icons/bag_active.png'),
          label: 'My Order',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/shared/icons/person.png'),
          activeIcon: Image.asset('assets/shared/icons/person_active.png'),
          label: 'Account',
        ),
      ],
    );
  }
}
