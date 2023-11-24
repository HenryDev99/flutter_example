import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../widgets/app_bars/app_bars.dart';

class BuyingInfoEditScreen extends StatefulWidget {
  const BuyingInfoEditScreen({Key? key}) : super(key: key);

  @override
  State<BuyingInfoEditScreen> createState() => _BuyingInfoEditScreenState();
}

class _BuyingInfoEditScreenState extends State<BuyingInfoEditScreen> {
  String? selectedValue = 'USA';
  final tfc_address = TextEditingController();
  final tfc_address2 = TextEditingController();
  final tfc_city = TextEditingController();
  final tfc_state = TextEditingController();
  final tfc_zipcode = TextEditingController();
  final tfc_phonenumber = TextEditingController();

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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        shape: const Border(
          bottom: BorderSide(
            color: AppColor.lineGray,
            width: 1,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Buying Info',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: ()
              {

              },
              child: Text('Done'))
        ],
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
              controller: tfc_address,
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
              controller: tfc_address2,
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
              controller: tfc_city,
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
              controller: tfc_state,
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
              controller: tfc_zipcode,
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
            const SizedBox(height: 16),
            TextField(
              controller: tfc_phonenumber,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColor.lineGray,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'phone number',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
