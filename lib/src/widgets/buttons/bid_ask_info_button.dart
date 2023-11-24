import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class BidAskInfoButton extends StatefulWidget {
  const BidAskInfoButton({
    Key? key,
    required this.icon,
    required this.info,
  }) : super(key: key);

  final IconData icon;
  final String info;

  @override
  State<BidAskInfoButton> createState() => _BidAskInfoButtonState();
}

class _BidAskInfoButtonState extends State<BidAskInfoButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.lightGray,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                widget.icon,
                color: AppColor.defaultGray,
                size: 16,
              ),
              const SizedBox(width: 16),
              Text(
                widget.info,
                style: const TextStyle(
                  color: AppColor.defaultGray,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.edit,
            size: 16,
            color: AppColor.defaultGray,
          ),
        ],
      ),
    );
  }
}
