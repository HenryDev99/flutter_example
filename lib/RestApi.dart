// ignore: file_names
// import 'dart:async';
import 'dart:convert';
import 'package:goodiez_abalone/src/models/askbid_data.dart';
import 'package:goodiez_abalone/src/models/item.dart';
import 'package:goodiez_abalone/src/models/shipping_address.dart';
import "package:http/http.dart" as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import 'src/models/game.dart';

class RestApi {
  RestApi._();
  static final RestApi _instance = RestApi._();
  factory RestApi() => _instance;

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Access-Control-Request-Headers': '*',
    'api-key':
        '0xs3Of0dzGEmXKZLvQ6gGnSbMntL4clyMCZSeEXS8AACRhi0ipzbshthP2QcNtfG'
  };

  Map<String, String> headers2 = {
    'Content-Type': 'multipart/form-data',
    'Access-Control-Request-Headers': '*',
    'api-key': ''
  };

  Map<String, String> cookies = {};

  Future<dynamic> goodiezGet(String url) async {
    print('get() url: $url');
    http.Response response =
        await http.get(Uri.encodeFull(url) as Uri, headers: headers);
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {}
    return json.decode(utf8.decode(response.bodyBytes));
  }

  Future<List<Game>> loadGameList() async {
    Map console = {
      '\$regex': 'xbox',
      '\$options': '\&i',
    };
    Map filter = {'console': console};
    Map sort = {'_id': 1};
    Map param = {
      'dataSource': 'Goodiez',
      'database': 'goodiez',
      'collection': 'games',
      'filter': filter,
      'sort': sort,
      'limit': 10,
      'skip': 10
    };
    final String encodedData = convertJson(param);

    final response = await http.post(
      Uri.parse(
          "https://data.mongodb-api.com/app/data-nmnyt/endpoint/data/beta/action/find"),
      body: encodedData,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return parseGames(response.body);
    } else {
      throw Exception('Failed');
    }
  }

  List<Game> parseGames(String responseBody) {
    final Map parsed = jsonDecode(responseBody);
    return (parsed['documents'] as List)
        .map<Game>((data) => Game.fromJson(data))
        .toList();
  }

  Future<void> updateShipping (String user_id, ShippingAddress sa) async {
    Map filter = {
      '_id': {
        '\$oid': user_id
      },
    };

    Map update = {
      '\$set' : {
        'shipping_address': sa.toJson()
      }
    };

    Map param = {
      'dataSource': 'Goodiez',
      'database': 'goodiez',
      'collection': 'users',
      'filter': filter,
      'update': update,
    };
    final String encodedData = convertJson(param);

    final response = await http.post(
      Uri.parse(
          "https://data.mongodb-api.com/app/data-nmnyt/endpoint/data/beta/action/updateOne"),
      body: encodedData,
      headers: headers,
    );

    if (response.statusCode == 200) {
      print('Update OK');
    }
    else
      print(response.body);
  }

  Future<List<dynamic>> searchListData (String SearchData) async {
    Map match1 = {
      '\$match': {
        'title': {'\$regex': SearchData, '\$options': 'i'}
      }
    };

    //match에서 검색한 결과의 _id와 items의 game_id와 같은 값을 결과의 result 속성에 담아라
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

    Map group = {
      '\$group': {
        '_id': '\$console',
        'count': {
          '\$sum': {'\$size': '\$result'}
        }
      }
    };

    Map sort = {
      '\$sort': {
        'count': -1
      }
    };

    List<Map> pipe = [
      match1,
      lookUp,
      match2,
      group,
      sort
    ];

    Map param = {
      'dataSource': 'Goodiez',
      'database': 'goodiez',
      'collection': 'games',
      'pipeline': pipe,
    };

    final String encodedData = convertJson(param);

    final response = await http.post(
      Uri.parse(
          "https://data.mongodb-api.com/app/data-nmnyt/endpoint/data/beta/action/aggregate"),
      body: encodedData,
      headers: headers,
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;

    return extractedData['documents'];
  }

  Future<void> updateAskBid (AskBidData abd) async {
    var postUri = Uri.parse("https://1ix4ttjvq4.execute-api.us-east-1.amazonaws.com/dev/uploadImage/post");
    MultipartRequest request = http.MultipartRequest("POST", postUri);
    int i = 1;

    request.headers.addAll(headers2);
    request.fields['game_id'] = abd.id;
    request.fields['seller'] = abd.type == ItemType.ask ? abd.user_id : '';
    request.fields['buyer'] = abd.type == ItemType.bid ? abd.user_id : '';
    request.fields['shipping_type'] = 'direct';
    request.fields['item_type'] = abd.type == ItemType.bid ? 'bid' : 'sell';
    request.fields['item_desc'] = abd.description;
    request.fields['price'] = abd.total_price.round().toString();
    request.fields['condition'] = abd.condition;

    request.headers.forEach((key, value) {
      print(key+":"+value);
    });

    abd.images.forEach((element) async {
      request.files.add(http.MultipartFile.fromBytes('file'+i.toString(), await element.readAsBytes(), contentType: MediaType('image', 'png')));
      i+=1;
    });

    await request.send().then((response) {
      if (response.statusCode == 200){
        print("Uploaded!");
      }
      else{
        response.stream.bytesToString().then((value) => print(value));
      }
    });

  }

  dynamic convertJson(dynamic param) {
    const JsonEncoder encoder = JsonEncoder();
    final dynamic object = encoder.convert(param);
    return object;
  }

}
