import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';

class GameImageDescription extends StatelessWidget {
  const GameImageDescription({
    Key? key,
    required this.gameImgUrl,
    required this.description,
  }) : super(key: key);

  final String gameImgUrl;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Container(
        width: double.infinity,
        height: 270,
        decoration: BoxDecoration(
          image: gameImgUrl.contains('www.goodiez.io')
              ? DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage('http://$gameImgUrl'),
          )
              : DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(gameImgUrl),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
        const SizedBox(height: 16),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColor.darkGray,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }
}
