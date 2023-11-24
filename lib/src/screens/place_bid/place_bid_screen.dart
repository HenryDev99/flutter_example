import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/colors.dart';
import '../../models/models.dart';
import '../../models/policy.dart';
import '../../providers/providers.dart';
import '../../widgets/app_bars/app_bars.dart';
import '../../widgets/buttons/bid_ask_info_button.dart';
import '../../widgets/buttons/bottom_button.dart';
import '../../widgets/prices/bid_ask_status.dart';
import '../../widgets/prices/final_price_displayer.dart';
import '../../widgets/texts/center_horizontal.dart';
import '../game_detail/widgets/widgets.dart';

class PlaceBidScreen extends StatefulWidget {
  static const routeName = '/placeBid';

  const PlaceBidScreen({
    Key? key,
    required this.game,
    required this.onBuyPressed,
    required this.policy,
    // required this.buyItemList,
  }) : super(key: key);

  final Game game;
  final Function onBuyPressed;
  final Policy policy;
  // final List<BuyItem> buyItemList;

  @override
  State<PlaceBidScreen> createState() => _PlaceBidScreenState();
}

class _PlaceBidScreenState extends State<PlaceBidScreen> {
  @override
  Widget build(BuildContext context) {
    final buyItemsData = Provider.of<BuyItemsData>(context);
    final buyItemList = buyItemsData.buyItemList;

    return Scaffold(
      appBar: BidAskAppBar(
        title: widget.game.title,
        consoleName: widget.game.console,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 24.0),
                  GameImageDescription(
                    gameImgUrl: widget.game.cover[0],
                    description: widget.game.description,
                  ),
                  const SizedBox(height: 24.0),
                  BidAskStatus(
                    maxBid: widget.game.maxBid,
                    minSell: widget.game.minSell,
                  ),
                  const SizedBox(height: 8.0),
                  const CenterHorizontal(
                    children: <Widget>[
                      Text(
                        'Condition: New',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.defaultGray,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28.0),
                  //const PriceInputField(hintText: 'Enter Bid'),
                  const SizedBox(height: 8.0),
                  CenterHorizontal(
                    children: <Widget>[
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.defaultGray,
                            letterSpacing: -0.5,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'You\'re '),
                            TextSpan(
                              text: 'not',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(text: ' the Highest Bidder'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32.0),
                  const FinalPriceDisplayer(label: 'Item Price', price: 58.55),
                  const Text(
                    'Final price will be calculated at checkout',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.darkGray,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            const BidAskInfoButton(
              icon: Icons.timer_outlined,
              info: 'Bid Expiration: 30 days',
            ),
            const BidAskInfoButton(
              icon: Icons.credit_card_rounded,
              info: 'MasterCard ending in **01',
            ),
            const BidAskInfoButton(
              icon: Icons.home,
              info: '32 Long Beach St',
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'You can buy now!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.darkGray,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ListView.separated(
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
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        buttonColor: AppColor.goodiezGreen,
        buttonTitle: 'Review Bid',
        onPressed: () {
          /*Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => ShippingAddressScreen(
              itemType: ItemType.bid,
              game: widget.game,
              policy: widget.policy,
              abd: AskBidData(
                  title: '',
              ),
            ),
          ));*/
        },
      ),
    );
  }
}
