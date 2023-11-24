import 'dart:convert';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import '../models/buy_item.dart';

class BuyItemsData with ChangeNotifier {
  List<BuyItem> _buyItemList = const [
    /*BuyItem(
      id: 'bi1',
      gameId: '5099803df3f4948bd2f98391',
      cover: ['assets/images/mario_odyssey_cover.jpg'],
      title: 'Super Mario Odyssey',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, tincidunt sit amet est sit amet, facilisis porta tortor.\n\nPraesent rhoncus faucibus accumsan. Fusce porttitor urna a sapien auctor congue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, tincidunt sit amet est sit amet, facilisis porta tortor.\n\nPraesent rhoncus faucibus accumsan. Fusce porttitor urna a sapien auctor congue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, tincidunt sit amet est sit amet, facilisis porta tortor.\n\nPraesent rhoncus faucibus accumsan. Fusce porttitor urna a sapien auctor congue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, tincidunt sit amet est sit amet, facilisis porta tortor.\n\nPraesent rhoncus faucibus accumsan. Fusce porttitor urna a sapien auctor congue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, tincidunt sit amet est sit amet, facilisis porta tortor.\n\nPraesent rhoncus faucibus accumsan. Fusce porttitor urna a sapien auctor congue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, tincidunt sit amet est sit amet, facilisis porta tortor.\n\nPraesent rhoncus faucibus accumsan. Fusce porttitor urna a sapien auctor congue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, tincidunt sit amet est sit amet, facilisis porta tortor.\n\nPraesent rhoncus faucibus accumsan. Fusce porttitor urna a sapien auctor congue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, tincidunt sit amet est sit amet, facilisis porta tortor.\n\nPraesent rhoncus faucibus accumsan. Fusce porttitor urna a sapien auctor congue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, tincidunt sit amet est sit amet, facilisis porta tortor.\n\nPraesent rhoncus faucibus accumsan. Fusce porttitor urna a sapien auctor congue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, tincidunt sit amet est sit amet, facilisis porta tortor.\n\nPraesent rhoncus faucibus accumsan. Fusce porttitor urna a sapien auctor congue.',
      seller: 'Goodiez Seller',
      sellerAvatar: 'assets/images/seller.jpeg',
      price: 58.99,
    ),
    BuyItem(
      id: 'bi2',
      gameId: '5099803df3f4948bd2f98391',
      cover: ['assets/images/mario_odyssey_cover.jpg'],
      title: 'Super Mario Odyssey',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, tincidunt sit amet est sit amet, facilisis porta tortor.\n\nPraesent rhoncus faucibus accumsan. Fusce porttitor urna a sapien auctor congue.',
      seller: 'Goodiez Seller',
      sellerAvatar: 'assets/images/seller.jpeg',
      price: 48.99,
    ),
    BuyItem(
      id: 'bi3',
      gameId: '5099803df3f4948bd2f98391',
      cover: ['assets/images/mario_odyssey_cover.jpg'],
      title: 'Super Mario Odyssey',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, tincidunt sit amet est sit amet, facilisis porta tortor.\n\nPraesent rhoncus faucibus accumsan. Fusce porttitor urna a sapien auctor congue.',
      seller: 'Goodiez Seller',
      sellerAvatar: 'assets/images/seller.jpeg',
      price: 46.99,
    ),*/
  ];

  List<BuyItem> get buyItemList {
    return [..._buyItemList];
  }

  BuyItem findById(String id) {
    return _buyItemList.firstWhere((item) => item.id == id);
  }

  Future<void> fetchAndSetBuyItems(String data, String type) async {
    final url = Uri.parse(
        "https://data.mongodb-api.com/app/data-nmnyt/endpoint/data/beta/action/find");

    Map filterType = {};

    if(type == 'game')
      filterType = {
        "game_id": data
      };
    else{
      filterType = {
        "buyer": data
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

      final List<BuyItem> loadedGames = [];
      extractedData['documents'].forEach((buyItemData) {
        loadedGames.add(BuyItem(
          id: buyItemData['_id'] as String,
          gameId: buyItemData['game_id'] as String,
          cover: List<String>.from(buyItemData['item_cover']),
          title: 'aaaa',//buyItemData['title'],
          description: buyItemData['item_desc'] as String,
          seller: buyItemData['seller'] as String,
          sellerAvatar: 'www.goodiez.io/img/024294114410',
          price: buyItemData['price'] + 0.0,
          console: 'console',
          condition: buyItemData['condition'] as String
        ));
      });
      _buyItemList = loadedGames;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

}
