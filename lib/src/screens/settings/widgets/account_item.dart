import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              label,
              style: GoodiezTextStyles.accountLabel,
            ),
            Text(
              value,
              style: GoodiezTextStyles.accountValue,
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ],
    );
  }
}
