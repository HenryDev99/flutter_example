import 'package:flutter/material.dart';

class RoundedCornerImage extends StatelessWidget {
  const RoundedCornerImage({
    Key? key,
    required this.imageUrl,
    required this.imageSize,
  }) : super(key: key);

  final String imageUrl;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
        image: imageUrl.contains('www.goodiez.io')
            ? DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://$imageUrl'),
              )
            : DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageUrl),
              ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
