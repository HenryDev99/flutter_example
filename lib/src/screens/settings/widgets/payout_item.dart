import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../widgets/rounded_corner_image.dart';

class PayoutItem extends StatelessWidget {
  const PayoutItem({
    Key? key,
    required this.price,
  }) : super(key: key);

  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColor.lineGray,
                width: 1.0,
              ),
              color: Colors.white,
            ),
            child: const Icon(
              Icons.account_balance,
              color: AppColor.defaultGray,
              size: 24.0,
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColor.darkGray,
                          letterSpacing: -0.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Payout '),
                          TextSpan(
                            text: '5410368694',
                            style: TextStyle(
                              color: AppColor.defaultGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '\$$price to Bank of America ending in 6 months.',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColor.darkGray,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Scheduled payout',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.darkGray,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const Text(
                          'Mar 29 2022',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.defaultGray,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
