import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../models/muser.dart';

class AccountEditScreen extends StatefulWidget {
  MUser user_data;
  AccountEditScreen({
    Key? key,
    required this.user_data,
  }) : super(key: key);

  @override
  State<AccountEditScreen> createState() => _AccountEditScreen();
}

class _AccountEditScreen extends State<AccountEditScreen>{
  final tfc_firstname = TextEditingController();
  final tfc_lastname = TextEditingController();
  final tfc_profilename = TextEditingController();

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
          'Account',
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
            TextField(
              controller: tfc_firstname,
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
              controller: tfc_profilename,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColor.lineGray,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'Profile Name',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
