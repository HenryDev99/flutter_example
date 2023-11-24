import 'package:flutter/material.dart';
import 'package:goodiez_abalone/src/providers/providers.dart';
import 'package:goodiez_abalone/src/screens/my_collection/widgets/transition_item.dart';
import 'package:provider/provider.dart';

import '../../../theme/colors.dart';
import '../../models/item.dart';
import '../../models/muser.dart';
import '../../providers/buy_items_data.dart';
import '../../providers/transition_data.dart';
import 'widgets/trading_item.dart';
import 'widgets/watching_item.dart';

class MyCollectionScreen extends StatefulWidget {
  static const routeName = '/my-collection';
  final MUser user_data;
  const MyCollectionScreen({
    Key? key,
    this.navigatorKey,
    required this.user_data,
  }) : super(key: key);

  final GlobalKey? navigatorKey;

  @override
  State<MyCollectionScreen> createState() => _MyCollectionScreenState();
}

const List<Tab> tabs = <Tab>[
  Tab(text: 'Buying'),
  Tab(text: 'Selling'),
  Tab(text: 'In Transition'),
  Tab(text: 'Own'),
  Tab(text: 'Watching'),
];

class _MyCollectionScreenState extends State<MyCollectionScreen> {
  bool _isInit = true;
  bool _isLoading = false;
  bool _isLoading2 = false;
  bool _isLoading3 = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
        _isLoading2 = true;
        _isLoading3 = true;
      });

      Provider.of<BuyItemsData>(context).fetchAndSetBuyItems(widget.user_data.id, 'user').then((_) {
        setState(() {
          _isLoading = false;
        });
      });

      Provider.of<SellItemsData>(context).fetchAndSetSellItems(widget.user_data.id, 'user').then((_) {
        setState(() {
          _isLoading2 = false;
        });
      });
      
      Provider.of<TransitionData>(context).fetchAndSetTransition(widget.user_data.id).then((_) {
        setState(() {
          _isLoading3 = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final buyItemData = Provider.of<BuyItemsData>(context);
    final buyItemList = buyItemData.buyItemList;
    final sellItemData = Provider.of<SellItemsData>(context);
    final sellItemList = sellItemData.sellItemList;
    final transitionData = Provider.of<TransitionData>(context);
    final transitionList = transitionData.transitionList;

    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (BuildContext tabContext) {
          final TabController tabController =
              DefaultTabController.of(tabContext)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              // Your code goes here.
              // To get index of current tab use tabController.index
            }
          });
          return Scaffold(
            appBar: AppBar(
              shape: const Border(
                bottom: BorderSide(
                  color: AppColor.lineGray,
                  width: 1,
                ),
              ),
              title: const Text(
                'My Collection',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.darkGray,
                ),
              ),
              titleSpacing: 0,
              elevation: 0,
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      color: AppColor.lineGray,
                    ),
                    const TabBar(
                      isScrollable: true,
                      tabs: tabs,
                      labelColor: AppColor.primaryColor,
                      unselectedLabelColor: AppColor.defaultGray,
                    ),
                  ],
                ),
                preferredSize: const Size.fromHeight(50.0),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.separated(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return TradingItem(
                        imageUrl: buyItemList[index].cover[0],
                        tradingType: ItemType.bid,
                        gameName: buyItemList[index].title,
                        consoleName: buyItemList[index].console,
                        condition: buyItemList[index].condition,
                        price: buyItemList[index].price,
                        expiredAt: '2020-01-09T00:02:53',
                      );
                    },
                    itemCount: buyItemList.length,
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: _isLoading2
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.separated(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return TradingItem(
                        imageUrl: sellItemList[index].cover[0],
                        tradingType: ItemType.ask,
                        gameName: sellItemList[index].title,
                        consoleName: sellItemList[index].console,
                        condition: sellItemList[index].condition,
                        price: sellItemList[index].price,
                        expiredAt: '2020-01-09T00:02:53',
                      );
                    },
                    itemCount: sellItemList.length,
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: _isLoading3
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.separated(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return TransitionItem(
                        imageUrl: transitionList[index].imageUrl,
                        tradingType: transitionList[index].tradingType,
                        gameName: transitionList[index].gameName,
                        consoleName: transitionList[index].consoleName,
                        condition: transitionList[index].condition,
                        price: transitionList[index].price,
                        expiredAt: transitionList[index].expiredAt,
                      );
                    },
                    itemCount: transitionList.length,
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return const WatchingItem(
                        imageUrl: 'assets/images/mario_odyssey_cover.jpg',
                        gameName: 'Super Mario Odyssey',
                        consoleName: 'Nintendo Switch',
                        condition: 'New',
                        highestBid: 58.88,
                        lowestAsk: 28.99,
                      );
                    },
                    itemCount: 2,
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return const WatchingItem(
                        imageUrl: 'assets/images/mario_odyssey_cover.jpg',
                        gameName: 'Super Mario Odyssey',
                        consoleName: 'Nintendo Switch',
                        condition: 'New',
                        highestBid: 58.88,
                        lowestAsk: 28.99,
                      );
                    },
                    itemCount: 2,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
