import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../rounded_corner_image.dart';

class ReviewGameItem extends StatelessWidget {
  const ReviewGameItem({
    Key? key,
    required this.coverImgUrl,
    required this.title,
    required this.consoleName,
    required this.condition
  }) : super(key: key);

  final String coverImgUrl;
  final String title;
  final String consoleName;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RoundedCornerImage(
          imageUrl: coverImgUrl,
          imageSize: 72.0,
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.darkGray,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                consoleName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.defaultGray,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Condition: ${condition}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.darkGray,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
