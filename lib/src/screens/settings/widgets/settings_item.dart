import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    Key? key,
    required this.title,
    required this.items,
    required this.onEdit,
  }) : super(key: key);

  final String title;
  final List<Widget> items;
  final Function onEdit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColor.darkGray,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 8.0),
            ...items,
          ],
        ),
        Positioned(
          top: 32,
          right: 0,
          child: InkWell(
            onTap: () {
              onEdit();
            },
            child: const Center(
              child: Text(
                'Edit',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
