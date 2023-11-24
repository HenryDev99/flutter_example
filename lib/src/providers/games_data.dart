import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import '../models/models.dart';

class GamesData with ChangeNotifier {
  List<Game> _gameList = const [
    /*Game(
      id: '5099803df3f4948bd2f98391',
      console: 'Switch',
      title: 'Super Mario Odyssey',
      cover: ['assets/images/mario_odyssey_cover.jpg'],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas diam lacus, tincidunt sit amet est sit amet, facilisis porta tortor.\n\nPraesent rhoncus faucibus accumsan. Fusce porttitor urna a sapien auctor congue.',
      minSell: 49.99,
      maxBid: 29.99,
      upc: '024294114410',
      created: '2020-01-09T00:02:53',
    ),
    Game(
      id: '5099803df3f4948bd2f98392',
      console: 'Switch',
      title: 'The Legend of Zelda: Breath of the Wild',
      cover: ['assets/images/zeldabreath.png'],
      description: 'Lorem ipsum dolor sit amet.',
      minSell: 49.99,
      maxBid: 29.99,
      upc: '024294114411',
      created: '2020-01-09T00:02:53',
    ),
    Game(
      id: '5099803df3f4948bd2f98393',
      console: 'Switch',
      title: 'Super Mario Odyssey',
      cover: ['assets/images/mario_odyssey_cover.jpg'],
      description: 'Lorem ipsum dolor sit amet.',
      minSell: 49.99,
      maxBid: 29.99,
      upc: '024294114410',
      created: '2020-01-09T00:02:53',
    ),
    Game(
      id: '5099803df3f4948bd2f98394',
      console: 'Switch',
      title: 'The Legend of Zelda: Breath of the Wild',
      cover: ['assets/images/zeldabreath.png'],
      description: 'Lorem ipsum dolor sit amet.',
      minSell: 49.99,
      maxBid: 29.99,
      upc: '024294114411',
      created: '2020-01-09T00:02:53',
    ),*/
  ];

  List<Game> get gameList {
    return [..._gameList];
  }

  Game findById(String id) {
    return _gameList.firstWhere((game) => game.id == id);
  }

  Future<void> fetchAndSetGames() async {
    final url = Uri.parse(
         "https://data.mongodb-api.com/app/data-nmnyt/endpoint/data/beta/action/find");
     Map console = {
       '\$regex': 'xbox',
       '\$options': '\&i',
     };
     Map filter = {'console': console};
     Map sort = {'_id': 1};
     try {
       final response = await http.post(
         url,
         body: json.encode({
           'dataSource': 'Goodiez',
           'database': 'goodiez',
           'collection': 'games',
           'filter': filter,
           'sort': sort,
           'limit': 10,
           'skip': 10,
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

       //print(extractedData['documents']);
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
