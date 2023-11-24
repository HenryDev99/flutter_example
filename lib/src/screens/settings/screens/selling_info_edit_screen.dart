import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../widgets/app_bars/app_bars.dart';

class SellingInfoEditScreen extends StatefulWidget {
  const SellingInfoEditScreen({Key? key}) : super(key: key);

  @override
  State<SellingInfoEditScreen> createState() => _SellingInfoEditScreenState();
}

class _SellingInfoEditScreenState extends State<SellingInfoEditScreen> {
  String? selectedValue = 'USA';

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleAppBar(
        title: 'Buying Info',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 28),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColor.lineGray,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              value: selectedValue,
              style: const TextStyle(
                color: AppColor.darkGray,
                fontSize: 16,
              ),
              items: dropdownItems,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColor.lineGray,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'Address',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColor.lineGray,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'Address 2',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColor.lineGray,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'City',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColor.lineGray,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'State / Province / Region',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColor.lineGray,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'Zip / Postal Code',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
