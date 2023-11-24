import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';

class ConditionTag extends StatelessWidget {
  const ConditionTag({Key? key, required this.condition}) : super(key: key);

  final String condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.lineGray),
        borderRadius: BorderRadius.circular(16),
        color: AppColor.bgGray,
      ),
      child: Text(
        'Condition: $condition',
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColor.darkGray,
        ),
      ),
    );
  }
}
