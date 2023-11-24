import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../widgets/rounded_corner_image.dart';

class WatchingItem extends StatelessWidget {
  const WatchingItem({
    Key? key,
    required this.imageUrl,
    required this.gameName,
    required this.consoleName,
    required this.condition,
    required this.highestBid,
    required this.lowestAsk,
  }) : super(key: key);

  final String imageUrl;
  final String gameName;
  final String consoleName;
  final String condition;
  final double highestBid;
  final double lowestAsk;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RoundedCornerImage(
            imageUrl: imageUrl,
            imageSize: 96.0,
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      gameName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColor.darkGray,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      consoleName,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColor.defaultGray,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Condition: $condition',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.darkGray,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Highest Bid: \$$highestBid',
                      style: const TextStyle(
                        color: AppColor.defaultGray,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Lowest Ask: \$$lowestAsk',
                      style: const TextStyle(
                        color: AppColor.defaultGray,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
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
