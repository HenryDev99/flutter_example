import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.buttonColor,
    required this.buttonTitle,
    required this.onPressed,
  }) : super(key: key);

  final Color buttonColor;
  final String buttonTitle;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32.0),
      color: buttonColor,
      child: InkWell(
        onTap: () {
          onPressed();
        },
        child: SizedBox(
          height: 56,
          width: double.infinity,
          child: Center(
            child: Text(
              buttonTitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
