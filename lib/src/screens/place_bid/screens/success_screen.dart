import 'package:flutter/material.dart';
import 'package:goodiez_abalone/RestApi.dart';
import 'package:goodiez_abalone/src/models/askbid_data.dart';

import '../../../../theme/colors.dart';
import '../../../models/game.dart';
import '../../../models/item.dart';
import '../../../utils/utils.dart';
import '../../../widgets/app_bars/app_bars.dart';
import '../../../widgets/buttons/bottom_button.dart';
import '../../../widgets/list_items/review_game_item.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({
    Key? key,
    required this.itemType,
    required this.game,
    required this.abd
  }) : super(key: key);

  final ItemType itemType;
  final Game game;
  final AskBidData abd;

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
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
              'Success',
              style: GoodiezTextStyles.headerText,
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: GoodiezTextStyles.infoHeaderText,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Your ${ValueUtil.getBidType(widget.itemType)} for ',
                  ),
                  TextSpan(
                    text: '${widget.abd.total_price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColor.darkGray,
                    ),
                  ),
                  const TextSpan(text: ' is live.'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ReviewGameItem(
              coverImgUrl: widget.game.cover[0],
              title: widget.game.title,
              consoleName: widget.game.console,
              condition: widget.abd.condition,
            ),
            const SizedBox(height: 32),
            Text(
              'Remember',
              style: GoodiezTextStyles.header3Text,
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: GoodiezTextStyles.infoHeaderText,
                children: <TextSpan>[
                  const TextSpan(
                    text: '1.',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColor.darkGray,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' When a ${ValueUtil.getTraderType(widget.itemType)} accepts your ${ValueUtil.getBidType(widget.itemType)}, the transaction will be processed instantly.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: GoodiezTextStyles.infoHeaderText,
                children: <TextSpan>[
                  const TextSpan(
                    text: '2.',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColor.darkGray,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' You can modify your ${ValueUtil.getBidType(widget.itemType)} at any time before it is accepted by a ${ValueUtil.getTraderType(widget.itemType)}.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        buttonColor: ValueUtil.getColorByType(widget.itemType),
        buttonTitle: 'Next',
        onPressed: () {
          RestApi().updateAskBid(widget.abd);
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
      ),
    );
  }
}
