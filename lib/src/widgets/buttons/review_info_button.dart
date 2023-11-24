import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class ReviewInfoButton extends StatelessWidget {
  const ReviewInfoButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.info,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: AppColor.darkGray,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColor.darkGray,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  info,
                  style: const TextStyle(
                    color: AppColor.darkGray,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(
                  Icons.edit,
                  size: 16,
                  color: AppColor.darkGray,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
