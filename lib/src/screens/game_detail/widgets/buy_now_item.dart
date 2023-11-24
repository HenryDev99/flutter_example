import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../constants/constants.dart';
import '../../../models/buy_item.dart';
import '../../../widgets/buttons/buttons.dart';
import '../../../widgets/rounded_corner_image.dart';

class BuyNowItem extends StatelessWidget {
  const BuyNowItem({
    Key? key,
    required this.buyItem,
    required this.onBuyPressed,
  }) : super(key: key);

  final BuyItem buyItem;
  final ValueChanged<BuyItem> onBuyPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          RoundedCornerImage(
            imageUrl: buyItem.cover[0],
            imageSize: 122.0,
          ),
          const SizedBox(width: 24),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  buyItem.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.darkGray,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  buyItem.description,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.defaultGray,
                  ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
                const SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            buyItem.sellerAvatar,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      buyItem.seller,
                      style: const TextStyle(
                        color: AppColor.darkGray,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '\$${buyItem.price}',
                      style: const TextStyle(
                        color: AppColor.darkGray,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ThinButton(
                      title: Constants.buyNow,
                      onPressed: () {
                        onBuyPressed(buyItem);
                        // print(Constants.buyNow);
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
