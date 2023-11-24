import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class ImageUploadButton extends StatelessWidget {
  const ImageUploadButton({
    Key? key,
    this.imageNum = 0,
    required this.onBtnPressed
  }) : super(key: key);

  final int imageNum;
  final VoidCallback onBtnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72.0,
      height: 72.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColor.lineGray,
          width: 1.0,
        ),
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: onBtnPressed,
        child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.camera_alt_rounded,
                color: AppColor.defaultGray,
                size: 32.0,
              ),
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
                      text: imageNum.toString(),
                      style: const TextStyle(
                        color: AppColor.primaryColor,
                      ),
                    ),
                    const TextSpan(text: '/10'),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
