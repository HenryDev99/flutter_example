import 'package:flutter/material.dart';
import 'package:goodiez_abalone/src/providers/payoutinfo_data.dart';
import 'package:goodiez_abalone/src/providers/user_data.dart';
import 'package:provider/provider.dart';

import 'src/screens/home/home.dart';
import 'src/screens/my_collection/my_collection.dart';
import 'src/screens/search/search_screen.dart';
import 'src/screens/settings/settings_screen.dart';
import 'src/widgets/bottom_navigation/bottom_navigation.dart';
import 'src/widgets/bottom_navigation/tab_item.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var _currentTab = TabItem.home;
  // var _tabPopStack = false;
  bool _isInit = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<UserData>(context).fetchAndSetUser('629f5d378f99195c352fe46a').then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  final Map<TabItem, GlobalKey> _navigatorKeys = {
    TabItem.home: GlobalKey(),
    TabItem.search: GlobalKey(),
    TabItem.myCollection: GlobalKey(),
    TabItem.settings: GlobalKey(),
  };

  void _selectTab(TabItem tabItem) {
    setState(() {
      // _tabPopStack = _currentTab == tabItem;
      _currentTab = tabItem;
    });
  }

  void _sendToMyCollection() {
    setState(() {
      _currentTab = TabItem.myCollection;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    final _userData = userData.userData;
    final payoutData = Provider.of<PayOutInfoData>(context);
    final processingList = payoutData.processingList;
    final onholdList = payoutData.onholdList;

    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            return !await Navigator.maybePop(
              _navigatorKeys[_currentTab]!.currentContext!,
            );
          },
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : IndexedStack(
            index: _currentTab.index,
            children: <Widget>[
              HomeScreen(
                navigatorKey: _navigatorKeys[TabItem.home],
                user_data: _userData,
              ),
              SearchScreen(
                navigatorKey: _navigatorKeys[TabItem.search],
              ),
              MyCollectionScreen(
                navigatorKey: _navigatorKeys[TabItem.myCollection],
                user_data: _userData,
              ),
              SettingsScreen(
                user_data: _userData,
                processingList: processingList,
                onholdList: onholdList,
                navigatorKey: _navigatorKeys[TabItem.settings],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentTab: _currentTab,
        onSelectTab: _selectTab,
      ),
    );
  }
}
