import 'package:goodiez_abalone/src/models/item.dart';

class MTransitionItem {
  final String imageUrl;
  final ItemType tradingType;
  final String gameName;
  final String consoleName;
  final String condition;
  final double price;
  final String expiredAt;

  const MTransitionItem({
    required this.imageUrl,
    required this.tradingType,
    required this.gameName,
    required this.consoleName,
    required this.condition,
    required this.price,
    required this.expiredAt,
  });
}
