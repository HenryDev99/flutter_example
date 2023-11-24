import 'package:flutter/material.dart';

enum TabItem { home, search, myCollection, settings }

const Map<TabItem, String> tabName = {
  TabItem.home: 'Home',
  TabItem.search: 'Search',
  TabItem.myCollection: 'My Collection',
  TabItem.settings: 'Settings',
};

const Map<TabItem, IconData> tabIcons = {
  TabItem.home: Icons.home,
  TabItem.search: Icons.search,
  TabItem.myCollection: Icons.list,
  TabItem.settings: Icons.settings,
};
