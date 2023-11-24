import 'package:flutter/material.dart';

import '../../models/item.dart';
import '../../utils/goodiez_text_styles.dart';

class PriceDetailItem extends StatelessWidget {
  const PriceDetailItem({
    Key? key,
    required this.title,
    required this.price,
    required this.itemType
  }) : super(key: key);

  final String title;
  final double price;
  final ItemType itemType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: GoodiezTextStyles.labelText,
            ),
            if (price == 0)
              Text(
                'Free',
                style: GoodiezTextStyles.labelText,
              ),
            if (price != 0)
              Text(
                itemType == ItemType.bid ?
                '${price > 0 ? '+' : ''}${price.toStringAsFixed(2)} \$' :
                '${price > 0 ? '-' : ''}${price.toStringAsFixed(2)} \$',
                style: GoodiezTextStyles.labelText,
              ),
          ],
        ),
      ],
    );
  }
}
