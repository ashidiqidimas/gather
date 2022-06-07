import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/router_path.dart';
import '../widgets/shared/all_shared_widgets.dart';
import 'all_screens.dart';
import '../../business_logic/managers/all_managers.dart';

class HomeScreen extends StatefulWidget {
  final int currentTab;

  const HomeScreen({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: RouterPath.home,
      key: ValueKey(RouterPath.home),
      child: HomeScreen(
        currentTab: currentTab,
      ),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<Widget> pages = <Widget>[
    TimelineScreen(),
    ExploreScreen(),
    MyOrderScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
      builder: (context, appStateManager, child) {
        return Scaffold(
          body: IndexedStack(
            index: Provider.of<AppStateManager>(context).selectedTab,
            children: pages,
          ),
          bottomNavigationBar: const GatherBottomNavigationBar(),
        );
      },
    );
  }
}
