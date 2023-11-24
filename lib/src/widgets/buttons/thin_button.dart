import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../constants/constants.dart';

class ThinButton extends StatelessWidget {
  const ThinButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14.0,
            vertical: 4.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: title == Constants.buyNow
                ? AppColor.goodiezGreen
                : AppColor.goodiezRed,
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onTap: () {
        onPressed();
      },
    );
  }
}
