import 'package:flutter/material.dart';
import 'package:goodiez_abalone/src/models/payout_info.dart';

class PayOutInfoData with ChangeNotifier {
  List<PayOutInfo> _processingList = const [
    PayOutInfo(
        userid: '61fbdcc41581c69a565edba3',
        order_number: '21-08440-89872',
        payout_number: '',
        coverUrl: 'www.goodiez.io/images/game/6297dd59a748d7e5c0a34b25/0.jpg',
        title: 'kyle',
        state: 'Processing',
        schedule: 'To be completed on Mar 30',
        price: 58.93
    ),
    PayOutInfo(
        userid: '61fbdcc41581c69a565edba3',
        order_number: '21-08440-89872',
        payout_number: '',
        coverUrl: 'www.goodiez.io/images/game/6297dd59a748d7e5c0a34b25/0.jpg',
        title: 'kyle',
        state: 'Processing',
        schedule: 'To be completed on Mar 30',
        price: 58.11
    ),
  ];

  List<PayOutInfo> _onholdList = const [
    PayOutInfo(
        userid: '61fbdcc41581c69a565edba3',
        order_number: '21-08440-89872',
        payout_number: '',
        coverUrl: 'www.goodiez.io/images/game/6297dd59a748d7e5c0a34b25/0.jpg',
        title: 'kyle',
        state: 'On hold',
        schedule: 'To be completed on Mar 30',
        price: 57.24
    ),
    PayOutInfo(
        userid: '61fbdcc41581c69a565edba3',
        order_number: '21-08440-89872',
        payout_number: '',
        coverUrl: 'www.goodiez.io/images/game/6297dd59a748d7e5c0a34b25/0.jpg',
        title: 'kyle',
        state: 'On hold',
        schedule: 'To be completed on Mar 30',
        price: 60.13
    ),
  ];

  List<PayOutInfo> get processingList {
    return [..._processingList];
  }

  List<PayOutInfo> get onholdList {
    return [..._onholdList];
  }


}
