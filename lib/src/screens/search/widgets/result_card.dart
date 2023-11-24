import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    Key? key,
    required this.imageUrl,
    required this.consoleName,
    required this.gameName,
    required this.price,
    required this.boxWidth,
    required this.imageHeight,
  }) : super(key: key);

  final String imageUrl;
  final String consoleName;
  final String gameName;
  final double price;
  final double boxWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.lineGray,
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imageUrl,
                  width: boxWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                Text(
                  consoleName,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.defaultGray,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  gameName,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.darkGray,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Lowest Ask',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColor.defaultGray,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  '\$$price',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColor.darkGray,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
