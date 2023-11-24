import 'package:goodiez_abalone/src/models/shipping.dart';

import 'transaction.dart';

enum ShippingType { brokeraze, direct }
enum ItemType { bid, ask, buy, sell }

class Item {
  final String id;
  final String gameId;
  final String seller;
  final String buyer;
  final ShippingType shipingType;
  final String cancelled;
  final int cancelledCount;
  final ItemType itemType;
  final String cancelPenalty;
  final List<String> itemCover;
  final String itemDesc;
  final double price;
  final String condition;
  final bool isTransacted;
  final List<Shipping> shipping;
  final Transaction trasaction;
  final String created;
  final String updated;

  const Item({
    required this.id,
    required this.gameId,
    required this.seller,
    required this.buyer,
    required this.shipingType,
    required this.cancelled,
    required this.cancelledCount,
    required this.itemType,
    required this.cancelPenalty,
    required this.itemCover,
    required this.itemDesc,
    required this.price,
    required this.condition,
    required this.isTransacted,
    required this.shipping,
    required this.trasaction,
    required this.created,
    required this.updated,
  });
}
