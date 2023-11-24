import 'package:flutter/material.dart';

import '../models/game.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

class SearchGamesData with ChangeNotifier {
  List<Game> _gameList = const [
  ];

  List<Game> get gameList {
    return [..._gameList];
  }

  Future<void> fetchAndSetSearchGames(String SearchData) async {
    final url = Uri.parse(
        "https://data.mongodb-api.com/app/data-nmnyt/endpoint/data/beta/action/aggregate");

    Map match1 = {
      '\$match': {
        /*"\$or": [
          {
            "console": "Nintendo Switch"
          },
          {
            "console": "3DO"
          },
        ],*/
        'console': 'Nintendo Switch',
        'title': {'\$regex': SearchData, '\$options': 'i'}
      }
    };

    Map lookUp = {
      '\$lookup':{
        'from': 'items',
        'localField': '_id',
        'foreignField': 'game_id',
        'as': 'result'
      }
    };

    Map match2 = {
      '\$match': {
        '\$expr': {
          '\$gt': [
            {
              '\$size': '\$result'
            }, 0
          ]
        }
      }
    };

    List<Map> pipe = [
      match1,
      lookUp,
      match2,
    ];

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'dataSource': 'Goodiez',
          'database': 'goodiez',
          'collection': 'games',
          'pipeline': pipe,
        }),
        headers: {
          'Content-type': 'application/json',
          'Access-Control-Request-Headers': '*',
          'api-key':
          '0xs3Of0dzGEmXKZLvQ6gGnSbMntL4clyMCZSeEXS8AACRhi0ipzbshthP2QcNtfG'
        },
      );
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      if (extractedData == null) {
        return;
      }

      final List<Game> loadedGames = [];
      extractedData['documents'].forEach((gameData) {
        loadedGames.add(Game(
          id: gameData['_id'],
          console: gameData['console'],
          title: gameData['title'],
          cover: List<String>.from(gameData['cover']),
          description: gameData['description'],
          minSell: gameData['minsell'] + 0.0,
          maxBid: gameData['maxbid'] + 0.0,
          upc: gameData['upc'],
          created: gameData['created'],
        ));
      });
      _gameList = loadedGames;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
