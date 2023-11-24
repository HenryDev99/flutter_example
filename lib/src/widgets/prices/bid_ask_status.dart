import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../texts/center_horizontal.dart';

class BidAskStatus extends StatelessWidget {
  const BidAskStatus({
    Key? key,
    required this.maxBid,
    required this.minSell,
  }) : super(key: key);

  final double maxBid;
  final double minSell;

  @override
  Widget build(BuildContext context) {
    return CenterHorizontal(
      children: <Widget>[
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColor.defaultGray,
              letterSpacing: -0.5,
            ),
            children: [
              const TextSpan(text: 'Highest Bid: '),
              TextSpan(
                text: '\$$maxBid',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const TextSpan(text: ' | Lowest Ask: '),
              TextSpan(
                text: '\$$minSell',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
