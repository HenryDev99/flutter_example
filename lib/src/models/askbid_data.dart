import 'dart:io';

import 'item.dart';

class AskBidData {
  final String title;
  double total_price;
  final String id;
  final String condition;
  final String description;
  final List<File> images;
  final ItemType type;
  final String user_id;

  AskBidData({
    required this.title,
    required this.total_price,
    required this.id,
    required this.condition,
    required this.description,
    required this.images,
    required this.type,
    required this.user_id
  });
}