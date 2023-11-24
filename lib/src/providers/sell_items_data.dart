import 'dart:convert';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import '../models/sell_item.dart';

class SellItemsData with ChangeNotifier {
  List<SellItem> _sellItemList = [/*
    SellItem(
      id: 'si1',
      gameId: '5099803df3f4948bd2f98391',
      title: 'Super Mario Odyssey',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, tincidunt sit amet est sit amet, facilisis porta tortor.\n\nPraesent rhoncus faucibus accumsan. Fusce porttitor urna a sapien auctor congue.',
      buyer: 'Goodiez Buyer',
      buyerAvatar: 'assets/images/seller.jpeg',
      price: 38.99,
    ),
    SellItem(
      id: 'si2',
      gameId: '5099803df3f4948bd2f98391',
      title: 'Super Mario Odyssey',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, tincidunt sit amet est sit amet, facilisis porta tortor.\n\nPraesent rhoncus faucibus accumsan. Fusce porttitor urna a sapien auctor congue.',
      buyer: 'Goodiez Buyer',
      buyerAvatar: 'assets/images/seller.jpeg',
      price: 28.99,
    ),*/
  ];

  List<SellItem> get sellItemList {
    return [..._sellItemList];
  }

  SellItem findById(String id) {
    return _sellItemList.firstWhere((item) => item.id == id);
  }

  Future<void> fetchAndSetSellItems(String data, String type) async {
    final url = Uri.parse(
        "https://data.mongodb-api.com/app/data-nmnyt/endpoint/data/beta/action/find");
    Map filterType = {};

    if(type == 'game')
      filterType = {
        "game_id": data
      };
    else{
      filterType = {
        "seller": data
      };
    }
    Map is_transacted = {
      'is_transacted': false,
    };
    List<Map> and = [filterType, is_transacted];
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

      final List<SellItem> loadedSellItem = [];
      extractedData['documents'].forEach((sellItemData) {
        loadedSellItem.add(SellItem(
          id: sellItemData['_id'] as String,
          gameId: sellItemData['game_id'] as String,
          cover: List<String>.from(sellItemData['item_cover']),
          title: 'aaaa',//buyItemData['title'],
          description: sellItemData['item_desc'] as String,
          buyer: sellItemData['seller'] as String,
          buyerAvatar: 'www.goodiez.io/img/024294114410',
          price: sellItemData['price'] + 0.0,
          console: 'console',
          condition: sellItemData['condition'] as String
        ));
      });
      _sellItemList = loadedSellItem;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
