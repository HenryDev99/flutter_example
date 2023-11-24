import 'package:flutter/material.dart';
import 'package:goodiez_abalone/src/models/policy.dart';
import 'package:goodiez_abalone/src/models/askbid_data.dart';
import 'package:provider/provider.dart';

import '../../models/game.dart';
import '../../models/item.dart';
import '../../providers/providers.dart';
import '../../utils/utils.dart';
import '../../widgets/app_bars/app_bars.dart';
import '../../widgets/buttons/bottom_button.dart';
import '../../widgets/buttons/review_info_button.dart';
import '../../widgets/list_items/review_game_item.dart';
import '../../widgets/prices/prices.dart';
import '../place_bid/screens/success_screen.dart';

class OrderReviewScreen extends StatefulWidget {
  const OrderReviewScreen({
    Key? key,
    required this.isVerified,
    required this.itemType,
    required this.game,
    required this.abd,
    required this.policy
  }) : super(key: key);

  final bool isVerified;
  final ItemType itemType;
  final Game game;
  final AskBidData abd;
  final Policy policy;

  @override
  State<OrderReviewScreen> createState() => _OrderReviewScreenState();
}

class _OrderReviewScreenState extends State<OrderReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        title: '${ValueUtil.getBidType(widget.itemType)} Review',
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 24),
            Text(
              '${ValueUtil.getBidType(widget.itemType)} details',
              style: GoodiezTextStyles.headerText,
            ),
            const SizedBox(height: 8),
            Text(
              'Confirm your ${ValueUtil.getBidType(widget.itemType)} details below',
              style: GoodiezTextStyles.infoHeaderText,
            ),
            const SizedBox(height: 24),
            ReviewGameItem(
              coverImgUrl: widget.game.cover[0],
              title: widget.game.title,
              consoleName: widget.game.console,
              condition: widget.abd.condition
            ),
            const SizedBox(height: 16),
            PriceDetailItem(title: widget.itemType == ItemType.bid ? 'Purchase Price' : 'Sell Price', price: widget.abd.total_price, itemType: ItemType.bid),
            PriceDetailItem(title: 'VAT (incl. above)', price: widget.abd.total_price * widget.policy.vat, itemType: widget.itemType),
            PriceDetailItem(title: 'Processing Fee', price: widget.abd.total_price * widget.policy.processingFee, itemType: widget.itemType),
            PriceDetailItem(title: 'Shipping', price: widget.policy.Shipping, itemType: widget.itemType),
            if (widget.isVerified)
              PriceDetailItem(title: 'Verification', price: widget.policy.Verification, itemType: widget.itemType),
            const SizedBox(height: 8),
            FinalPriceDisplayer(
              label: 'Total (incl. taxes)*',
              price: widget.isVerified
                  ? widget.abd.total_price - widget.abd.total_price * widget.policy.vat - widget.abd.total_price * widget.policy.processingFee - widget.policy.Verification
                  : widget.abd.total_price - widget.abd.total_price * widget.policy.vat - widget.abd.total_price * widget.policy.processingFee
            ),
            Text(
              '*Includes duties, VAT, and fees based on buyer and seller location',
              style: GoodiezTextStyles.infoBodyText,
            ),
            const ReviewInfoButton(
              icon: Icons.credit_card_rounded,
              title: 'Payment Method',
              info: 'chuck.lee@goodiez.io',
            ),
            const ReviewInfoButton(
              icon: Icons.home,
              title: 'Shipping Address',
              info: 'Rhodes str.',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        buttonColor: ValueUtil.getColorByType(widget.itemType),
        buttonTitle: 'Confirm ${ValueUtil.getBidType(widget.itemType)}',
        onPressed: () {
          widget.abd.total_price = widget.isVerified
              ? widget.abd.total_price - widget.abd.total_price * widget.policy.vat - widget.abd.total_price * widget.policy.processingFee - widget.policy.Verification
              : widget.abd.total_price - widget.abd.total_price * widget.policy.vat - widget.abd.total_price * widget.policy.processingFee;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => SuccessScreen(
                itemType: widget.itemType,
                game: widget.game,
                abd: widget.abd,
              ),
            ),
          );
        },
      ),
    );
  }
}
