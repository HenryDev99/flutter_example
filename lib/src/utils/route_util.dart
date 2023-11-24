import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/consoles/consoles_screen.dart';
import '../screens/search/search.dart';

class RouteUtil {
  static Route createPlaceBidAskRoute(
    Widget Function(
      BuildContext,
      Animation<double>,
      Animation<double>,
    )
        pageBuilder,
  ) {
    return PageRouteBuilder(
      pageBuilder: pageBuilder,
      transitionsBuilder: (
        context,
        animation,
        secondaryAnimation,
        child,
      ) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static ValueChanged<Brand> selectBrand(BuildContext context) {
    return (Brand brand) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => ConsolesScreen(
            brand: brand,
          ),
        ),
      );
    };
  }

  static ValueChanged<String> selectSeeAll(BuildContext context) {
    return (String title) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => SearchScreen(),
        ),
      );
    };
  }
}
