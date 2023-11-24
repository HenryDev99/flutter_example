import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class BidAskAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BidAskAppBar({
    Key? key,
    required this.title,
    required this.consoleName,
  }) : super(key: key);

  final String title;
  final String consoleName;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      shape: const Border(
        bottom: BorderSide(
          color: AppColor.lineGray,
          width: 1,
        ),
      ),
      leadingWidth: 62,
      leading: Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: TextButton(
          child: const Text(
            'Close',
            style: TextStyle(
              fontSize: 12,
              color: Colors.blue,
            ), //here
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColor.darkGray,
            ),
          ),
          Text(
            consoleName,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColor.defaultGray,
            ),
          ),
        ],
      ),
    );
  }
}
