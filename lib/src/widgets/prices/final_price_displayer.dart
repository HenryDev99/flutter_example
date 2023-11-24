import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class FinalPriceDisplayer extends StatelessWidget {
  const FinalPriceDisplayer({
    Key? key,
    required this.label,
    required this.price,
  }) : super(key: key);

  final String label;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Divider(
          color: AppColor.lineGray,
          thickness: 1,
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColor.darkGray,
              ),
            ),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColor.darkGray,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
