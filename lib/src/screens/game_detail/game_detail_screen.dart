import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goodiez_abalone/src/providers/providers.dart';
import 'package:provider/provider.dart';

import '../../../theme/colors.dart';
import '../../constants/constants.dart';
import '../../models/game.dart';
import '../../models/sell_item.dart';
import '../../providers/buy_items_data.dart';
import '../../widgets/app_bars/app_bars.dart';
import 'widgets/widgets.dart';

class GameDetailScreen extends StatefulWidget {
  const GameDetailScreen({
    Key? key,
    required this.game,
    required this.onBidPressed,
    required this.onAskPressed,
    required this.onBuyPressed,
    required this.onSellPressed,
  }) : super(key: key);

  final Game game;
  final ValueChanged<Game> onBidPressed;
  final ValueChanged<Game> onAskPressed;
  final Function onBuyPressed;
  final Function onSellPressed;

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  bool _isInit = true;
  bool _isLoading = false;
  bool _isLoading2 = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
        _isLoading2 = true;
      });

      Provider.of<BuyItemsData>(context).fetchAndSetBuyItems(widget.game.id, 'game').then((_) {
        setState(() {
          _isLoading = false;
        });
      });

      Provider.of<SellItemsData>(context).fetchAndSetSellItems(widget.game.id, 'game').then((_) {
        setState(() {
          _isLoading2 = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  int selectedValue = 0;
  Map<int, Widget> children = <int, Widget>{
    0: const Text(
      'Buy Now',
      style: TextStyle(fontSize: 14, color: Colors.white),
    ),
    1: const Text(
      'Sell Now',
      style: TextStyle(fontSize: 14, color: AppColor.tabGray),
    ),
  };

  void _selectTab(int? value) {
    setState(() {
      selectedValue = value as int;
      children = <int, Widget>{
        0: Text(
          'Buy Now',
          style: TextStyle(
            fontSize: 14,
            color: selectedValue == 0 ? Colors.white : AppColor.tabGray,
          ),
        ),
        1: Text(
          'Sell Now',
          style: TextStyle(
            fontSize: 14,
            color: selectedValue == 1 ? Colors.white : AppColor.tabGray,
          ),
        ),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final buyItemData = Provider.of<BuyItemsData>(context);
    final buyItemList = buyItemData.buyItemList;
    final sellItemData = Provider.of<SellItemsData>(context);
    final sellItemList = sellItemData.sellItemList;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 184),
                Text(
                  widget.game.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColor.darkGray,
                  ),
                ),
                Text(
                  widget.game.console,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.defaultGray,
                  ),
                ),
                const SizedBox(height: 16),
                const ConditionTag(condition: 'New'),
                const SizedBox(height: 16),
                GameImageDescription(
                  gameImgUrl: widget.game.cover[0],
                  description: widget.game.description,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoSlidingSegmentedControl(
                    padding: const EdgeInsets.all(4),
                    children: children,
                    onValueChanged: _selectTab,
                    thumbColor: selectedValue == 0
                        ? AppColor.goodiezGreen
                        : AppColor.goodiezRed,
                    groupValue: selectedValue,
                  ),
                ),
                const SizedBox(height: 16),
                IndexedStack(
                  index: selectedValue,
                  children: <Widget>[
                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.separated(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, index) => const SizedBox(
                        height: 16,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return BuyNowItem(
                          buyItem: buyItemList[index],
                          onBuyPressed: widget.onBuyPressed(widget.game),
                        );
                      },
                      itemCount: buyItemList.length,
                    ),
                    _isLoading2
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.separated(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, index) => const SizedBox(
                        height: 16,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return SellNowItem(
                          sellItem: sellItemList[index],
                          onSellPressed: widget.onSellPressed(widget.game),
                        );
                      },
                      itemCount: sellItemList.length,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: AppColor.lineGray,
                    width: 1.0,
                  ),
                ),
              ),
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: Colors.white,
                      minimumSize: const Size.fromHeight(48),
                      alignment: Alignment.centerLeft,
                      side: const BorderSide(
                        color: AppColor.darkGray,
                        width: 1,
                      ),
                    ),
                    onPressed: () {
                      print(widget.game.title);
                    },
                    child: const Text(
                      'New',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.darkGray,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: <Widget>[
                      BidButton(
                        buttonText: Constants.highestBid,
                        price: 58.99,
                        onPressed: () {
                          widget.onBidPressed(widget.game);
                        },
                      ),
                      const SizedBox(width: 16),
                      BidButton(
                        buttonText: Constants.lowestAsk,
                        price: 28.99,
                        onPressed: () {
                          widget.onAskPressed(widget.game);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
