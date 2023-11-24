import 'package:flutter/material.dart';
import 'package:goodiez_abalone/src/models/policy.dart';

import '../../../theme/colors.dart';
import '../../models/game.dart';
import '../../models/item.dart';
import '../../models/askbid_data.dart';
import '../../widgets/app_bars/app_bars.dart';
import '../order_review/order_review.dart';

class VerificationAskScreen extends StatelessWidget {
  const VerificationAskScreen({
    Key? key,
    this.itemType,
    this.game,
    required this.abd,
    required this.policy
  }) : super(key: key);

  final ItemType? itemType;
  final Game? game;
  final AskBidData abd;
  final Policy policy;

  @override
  Widget build(BuildContext context) {
    const String bidMessage =
        'We guarantee that a product matches with seller\'s description. If a product does not meet seller\'s description, we immediately issue a full refund. Our team also ensures packaging meets the highest quality standard.';
    const String askMessage =
        'Once a product arrives to Goodiez from seller, our verification team will inspect a product to make sure matches with a product description. Only after being verified, our team will issue a payout immediately, and ensures to protect a seller including no return and no refund from a buyer.';

    return Scaffold(
      appBar: const TitleAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 24),
            const Text(
              'Verification Service ?',
              style: TextStyle(
                fontSize: 24,
                color: AppColor.darkGray,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              itemType == ItemType.bid ? bidMessage : askMessage,
              style: const TextStyle(
                fontSize: 16,
                color: AppColor.defaultGray,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 30.0,
        margin: const EdgeInsets.only(bottom: 32.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => OrderReviewScreen(
                      isVerified: false,
                      itemType: itemType!,
                      game: game!,
                      abd: abd,
                      policy: policy,
                    ),
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: AppColor.darkGray,
                      width: 1.0,
                    ),
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.darkGray,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => OrderReviewScreen(
                      isVerified: true,
                      itemType: itemType!,
                      game: game!,
                      abd: abd,
                      policy: policy,
                    ),
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColor.darkGray,
                  ),
                  child: const Center(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
