import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../theme/colors.dart';

class KeywordList extends StatelessWidget {
  const KeywordList({
    Key? key,
    required this.keyword,
    required this.category,
    required this.resultNum,
    required this.onTapKeylist,
  }) : super(key: key);

  final String keyword;
  final String category;
  final int resultNum;
  final ValueChanged<String> onTapKeylist;

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('###,000');

    return GestureDetector(
      onTap: () {
        onTapKeylist(category);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColor.lineGray,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.defaultGray,
                      letterSpacing: -0.5,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: keyword,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColor.darkGray,
                        ),
                      ),
                      TextSpan(text: ' in $category'),
                    ],
                  ),
                ),
                Text(
                  '${formatter.format(resultNum)} results',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.defaultGray,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
