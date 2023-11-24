import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import '../models/item.dart';
import '../models/mtransition_item.dart';

class TransitionData with ChangeNotifier {
  List<MTransitionItem> _transitionList = const [];

  List<MTransitionItem> get transitionList {
    return [..._transitionList];
  }

  Future<void> fetchAndSetTransition(String data) async {
    final url = Uri.parse(
        "https://data.mongodb-api.com/app/data-nmnyt/endpoint/data/beta/action/find");

    Map seller = {
      'seller': data
    };

    Map buyer = {
      'buyer': data
    };

    List<Map> or = [seller, buyer];

    Map filterType = {
      "\$or": or
    };

    Map is_transacted = {
      'is_transacted': true,
    };

    List<Map> and = [filterType,is_transacted];

    Map filter = {
      '\$and': and,
    };

    Map param = {
      'dataSource': 'Goodiez',
      'database': 'goodiez',
      'collection': 'items',
      'filter' : filter,
    };

    try {
      final response = await http.post(
        url,
        body: json.encode(param),
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
      final List<MTransitionItem> loadedTransition = [];

      extractedData['documents'].forEach((transitionData) {
        loadedTransition.add(MTransitionItem(
          imageUrl: transitionData['item_cover'][0] as String, //ok
          tradingType: ItemType.buy,
          gameName: 'aaaaa', //transitionData['title'] as String,
          consoleName: 'Nintendo', //transitionData['console'] as String,
          condition: transitionData['condition'] as String, //ok
          price: transitionData['price'], //ok
          expiredAt: '2020-01-09T00:02:53'
        ));
      });
      _transitionList = loadedTransition;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

}