import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../theme/colors.dart';
import '../../../models/item.dart';
import '../../../widgets/rounded_corner_image.dart';

class TradingItem extends StatelessWidget {
  const TradingItem({
    Key? key,
    required this.imageUrl,
    required this.tradingType,
    required this.gameName,
    required this.consoleName,
    required this.condition,
    required this.price,
    required this.expiredAt,
  }) : super(key: key);

  final ItemType tradingType;
  final String imageUrl;
  final String gameName;
  final String consoleName;
  final String condition;
  final double price;
  final String expiredAt;

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    DateTime expiredDate = dateFormat.parse(expiredAt);

    return Stack(
      children: [
        Container(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '\$$price',
                          style: TextStyle(
                            color: tradingType == ItemType.bid
                                ? AppColor.goodiezGreen
                                : AppColor.goodiezRed,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Expires at: ${expiredDate.year.toString()}-${expiredDate.month.toString().padLeft(2, '0')}-${expiredDate.day.toString().padLeft(2, '0')}',
                          style: const TextStyle(
                            color: AppColor.defaultGray,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: -12,
          right: 0,
          child: IconButton(
            icon: const Icon(
              Icons.edit,
              size: 16,
            ),
            tooltip: 'Edit a buying item',
            onPressed: () {
              print('Edit a buying item');
            },
          ),
        )
      ],
    );
  }
}
