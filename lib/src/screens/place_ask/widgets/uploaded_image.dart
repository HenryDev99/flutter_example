import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../theme/colors.dart';

class UploadedImage extends StatelessWidget {
  const UploadedImage({
    Key? key,
    required this.image,
    required this.index,
    required this.onDeleteBtnPressed
  }) : super(key: key);

  final File image;
  final int index;
  final Function(int) onDeleteBtnPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80.0,
          height: 80.0,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                child: Image.file(
                  image,
                  fit: BoxFit.fill,
                  width: 72,
                  height: 100,
                )
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: (){
                    onDeleteBtnPressed(index);
                  },
                  child: Container(
                    width: 16.0,
                    height: 16.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.darkGray,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 8.0),
      ],
    );
  }
}
