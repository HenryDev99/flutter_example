import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../models/item.dart';

class ValueUtil {
  static Color getColorByType(itemType) =>
      itemType == ItemType.bid ? AppColor.goodiezGreen : AppColor.goodiezRed;
  static String getBidType(itemType) =>
      itemType == ItemType.bid ? 'Bid' : 'Ask';
  static String getTraderType(itemType) =>
      itemType == ItemType.bid ? 'seller' : 'buyer';
}
