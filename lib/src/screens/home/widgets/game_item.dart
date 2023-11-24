import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../models/game.dart';
import '../../../widgets/rounded_corner_image.dart';

class GameItem extends StatelessWidget {
  const GameItem({
    Key? key,
    required this.item,
    required this.onSelectGame,
  }) : super(key: key);

  final Game item;
  final ValueChanged<Game> onSelectGame;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelectGame(item);
      },
      child: Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: AppColor.lineGray, width: 1),
          borderRadius: BorderRadius.zero,
        ),
        child: Container(
          width: 128,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoundedCornerImage(
                imageUrl: item.cover[0],
                imageSize: 96.0,
              ),
              const SizedBox(height: 10),
              Text(
                item.console,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColor.defaultGray,
                ),
              ),
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.5,
                  color: AppColor.darkGray,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              const SizedBox(height: 8),
              const Text(
                'Lowest Ask',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.5,
                  color: AppColor.defaultGray,
                ),
              ),
              Text(
                '\$${item.minSell}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.5,
                  color: AppColor.darkGray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
