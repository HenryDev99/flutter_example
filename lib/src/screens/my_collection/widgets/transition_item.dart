import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../theme/colors.dart';
import '../../../models/item.dart';
import '../../../widgets/rounded_corner_image.dart';

class TransitionItem extends StatelessWidget {
  const TransitionItem({
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
                            color: tradingType == ItemType.buy
                                ? AppColor.goodiezGreen
                                : AppColor.goodiezRed,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Sale: ${expiredDate.year.toString()}-${expiredDate.month.toString().padLeft(2, '0')}-${expiredDate.day.toString().padLeft(2, '0')}',
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
        const Positioned(
          bottom: 20,
          right: 16,
          child: Text(
            'On Shipping',
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
