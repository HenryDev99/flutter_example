import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../theme/colors.dart';

class PriceInputField extends StatelessWidget {
  const PriceInputField({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    required this.onChangeMoney
  }) : super(key: key);

  final String hintText;
  final TextEditingController textEditingController;
  final VoidCallback onChangeMoney;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.lineGray,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 56.0,
            decoration: const BoxDecoration(
              color: AppColor.lightGray,
              border: Border(
                right: BorderSide(
                  width: 1.0,
                  color: AppColor.lineGray,
                ),
              ),
            ),
            child: const Center(
              child: Text(
                '\$',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColor.darkGray,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            width: 300.0,
            height: 56.0,
            child: TextFormField(
              controller: textEditingController,
              onChanged: (String keyword) {
                if(textEditingController.text == ''){
                  textEditingController.text = '0';
                }
                onChangeMoney();
              },
              keyboardType: defaultTargetPlatform == TargetPlatform.iOS
                  ? const TextInputType.numberWithOptions(
                      decimal: true,
                      signed: true,
                    )
                  : TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
              ],
              maxLength: 10,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColor.darkGray,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: AppColor.lineGray,
                ),
                labelText: '',
                counterText: '',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
