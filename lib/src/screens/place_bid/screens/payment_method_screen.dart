import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../models/askbid_data.dart';
import '../../../models/item.dart';
import '../../../models/models.dart';
import '../../../models/policy.dart';
import '../../../widgets/app_bars/app_bars.dart';
import '../../../widgets/buttons/bottom_button.dart';
import '../../verification/verification.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({
    Key? key,
    this.itemType,
    this.game,
    required this.policy,
    required this.abd
  }) : super(key: key);

  final ItemType? itemType;
  final Game? game;
  final Policy policy;
  final AskBidData abd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleAppBar(
        title: 'Payment Method',
      ),
      bottomNavigationBar: BottomButton(
        buttonColor: AppColor.primaryColor,
        buttonTitle: 'Next',
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => VerificationAskScreen(
              itemType: ItemType.bid,
              game: game,
              policy: policy,
              abd: abd,
            ),
          ));
        },
      ),
    );
  }
}
