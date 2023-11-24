import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../widgets/rounded_corner_image.dart';

class PayoutGameItem extends StatelessWidget {
  const PayoutGameItem({
    Key? key,
    required this.imageUrl,
    required this.gameName,
    required this.price,
    required this.order_number,
    required this.schedule,
    required this.state
  }) : super(key: key);

  final String imageUrl;
  final String gameName;
  final double price;
  final String state;
  final String schedule;
  final String order_number;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RoundedCornerImage(
                imageUrl: imageUrl,
                imageSize: 60.0,
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
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkGray,
                              letterSpacing: -0.5,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: state=='payout'?'Payout':'Order'),
                              TextSpan(
                                text: ' ' + order_number,
                                style: TextStyle(
                                  color: AppColor.defaultGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          gameName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.darkGray,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          schedule,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColor.defaultGray,
                            letterSpacing: -0.5,
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
          top: 0,
          right: 0,
          child: Text(
            '\$${price}',
            style: TextStyle(
              color: AppColor.darkGray,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.5,
            ),
          ),
        ),
      ],
    );
  }
}
