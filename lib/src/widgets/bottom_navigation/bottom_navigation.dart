import 'package:flutter/material.dart';
import 'package:goodiez_abalone/src/widgets/bottom_navigation/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.currentTab,
    required this.onSelectTab,
  }) : super(key: key);
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        _buildItem(TabItem.home),
        _buildItem(TabItem.search),
        _buildItem(TabItem.myCollection),
        _buildItem(TabItem.settings),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(
        tabIcons[tabItem],
        size: 32,
      ),
      label: tabName[tabItem],
    );
  }
}
