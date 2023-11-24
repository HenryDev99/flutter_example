import 'package:flutter/material.dart';
import 'package:goodiez_abalone/RestApi.dart';
import 'package:goodiez_abalone/src/models/shipping_address.dart';
import '../../../../theme/colors.dart';
import '../../../models/muser.dart';

class ShippingInfoEditScreen extends StatefulWidget {
  MUser user_data;
  ShippingInfoEditScreen({
    Key? key,
    required this.user_data,
  }) : super(key: key);

  @override
  State<ShippingInfoEditScreen> createState() => _ShippingInfoEditScreenState();
}

class _ShippingInfoEditScreenState extends State<ShippingInfoEditScreen> {
  String? selectedValue = 'USA';
  final tfc_firstname = TextEditingController();
  final tfc_lastname = TextEditingController();
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
          'Shipping Info',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () async
              {
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    title: Text("Save"),
                    content:
                    Container(
                        width: 100,
                        height: 100,
                        alignment: Alignment.topCenter,
                        margin: EdgeInsets.only(top: 20),
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey,
                          color: AppColor.primaryColor,
                        )
                    ),
                  );
                });
                ShippingAddress sa = ShippingAddress(
                    firstName: tfc_firstname.value.text,
                    lastName: tfc_lastname.value.text,
                    country: selectedValue.toString(),
                    address: tfc_address.value.text,
                    address2: tfc_address2.value.text,
                    city: tfc_city.value.text,
                    state: tfc_state.value.text,
                    zipCode: tfc_zipcode.value.text,
                    phoneNumber: tfc_phonenumber.value.text
                );
                await RestApi().updateShipping(widget.user_data.id, sa);

                Navigator.of(context, rootNavigator: true).pop();
                Navigator.of(context).pop();
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
              controller: tfc_firstname,
              style: TextStyle(fontSize: 22.0, color: AppColor.darkGray),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColor.lineGray,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'First Name',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: tfc_lastname,
              style: TextStyle(fontSize: 22.0, color: AppColor.darkGray),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColor.lineGray,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'Last Name',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: tfc_address,
              style: TextStyle(fontSize: 22.0, color: AppColor.darkGray),
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
              style: TextStyle(fontSize: 22.0, color: AppColor.darkGray),
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
              style: TextStyle(fontSize: 22.0, color: AppColor.darkGray),
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
              style: TextStyle(fontSize: 22.0, color: AppColor.darkGray),
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
              style: TextStyle(fontSize: 22.0, color: AppColor.darkGray),
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
              style: TextStyle(fontSize: 22.0, color: AppColor.darkGray),
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

  @override
  void initState() {
    tfc_firstname.text = widget.user_data.shippingAddress.firstName;
    tfc_lastname.text = widget.user_data.shippingAddress.lastName;
    tfc_address.text = widget.user_data.shippingAddress.address;
    tfc_address2.text = widget.user_data.shippingAddress.address2;
    tfc_city.text = widget.user_data.shippingAddress.city;
    tfc_state.text = widget.user_data.shippingAddress.state;
    tfc_zipcode.text = widget.user_data.shippingAddress.zipCode;
    tfc_phonenumber.text = widget.user_data.shippingAddress.phoneNumber;
  }
}