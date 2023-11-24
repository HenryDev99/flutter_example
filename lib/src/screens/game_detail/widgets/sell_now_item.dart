import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../constants/constants.dart';
import '../../../models/sell_item.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/rounded_corner_image.dart';

class SellNowItem extends StatelessWidget {
  const SellNowItem({
    Key? key,
    required this.sellItem,
    required this.onSellPressed,
  }) : super(key: key);

  final SellItem sellItem;
  final ValueChanged<SellItem> onSellPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          RoundedCornerImage(
            imageUrl: sellItem.buyerAvatar,
            imageSize: 122.0,
          ),
          const SizedBox(width: 24),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  sellItem.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.darkGray,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  sellItem.description,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.defaultGray,
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
                const SizedBox(height: 12),
                Text(
                  sellItem.buyer,
                  style: const TextStyle(
                    color: AppColor.darkGray,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '\$${sellItem.price}',
                      style: const TextStyle(
                        color: AppColor.darkGray,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ThinButton(
                      title: Constants.sellNow,
                      onPressed: () {
                        onSellPressed(sellItem);
                        // print(Constants.sellNow);
                      },
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
