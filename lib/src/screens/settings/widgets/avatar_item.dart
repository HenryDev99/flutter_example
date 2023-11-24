import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';

class AvatarItem extends StatelessWidget {
  const AvatarItem({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0, bottom: 16.0),
      child: Align(
        alignment: Alignment.center,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage(imageUrl),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Material(
                borderRadius: BorderRadius.circular(16),
                elevation: 2,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    color: AppColor.darkGray,
                    padding: const EdgeInsets.all(7),
                    iconSize: 18,
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      print('Edit a avatar');
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
