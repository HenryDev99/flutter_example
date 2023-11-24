import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';

class ConditionListTile extends StatelessWidget {
  const ConditionListTile({
    Key? key,
    required this.label,
    this.isSelected = false,
  }) : super(key: key);

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColor.lineGray,
          ),
        ),
      ),
      child: ListTile(
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.darkGray,
            letterSpacing: -0.5,
          ),
        ),
        trailing: isSelected ? const Icon(Icons.check) : null,
      ),
    );
  }
}