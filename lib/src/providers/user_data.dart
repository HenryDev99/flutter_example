import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:goodiez_abalone/src/models/payment.dart';
import 'package:goodiez_abalone/src/models/shipping_address.dart';
import '../models/muser.dart';
import "package:http/http.dart" as http;

class UserData with ChangeNotifier {
  MUser userData = MUser(
      id: '',
      AvatarUrl: '',
      nickname: '',
      email: '',
      oauthProvider: '',
      oauthAccessToken: '',
      oauthRefreshToken: '',
      oauthExpired: '',
      shippingAddress: ShippingAddress(
        firstName: '',
        lastName: '',
        country: '',
        address: '',
        address2: '',
        city: '',
        state: '',
        zipCode: '',
        phoneNumber: '',
      ),
      payment: Payment(
        cardName: '',
        cardNumber: '',
        expired: '',
        cvs: '',
      ),
      created: ''
  );

  Future<void> fetchAndSetUser(String user_id) async {
    final url = Uri.parse(
        "https://data.mongodb-api.com/app/data-nmnyt/endpoint/data/beta/action/findOne");

    Map filter = {
      '_id': {
        '\$oid': user_id
      },
    };

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'dataSource': 'Goodiez',
          'database': 'goodiez',
          'collection': 'users',
          'filter': filter,
        }),
        headers: {
          'Content-type': 'application/json',
          'Access-Control-Request-Headers': '*',
          'api-key':
          '0xs3Of0dzGEmXKZLvQ6gGnSbMntL4clyMCZSeEXS8AACRhi0ipzbshthP2QcNtfG'
        },
      );

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      // ignore: unnecessary_null_comparison
      if (extractedData == null) {
        return;
      }

      userData = MUser.fromJson(extractedData['document']);

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
