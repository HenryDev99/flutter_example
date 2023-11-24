import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:goodiez_abalone/src/providers/payoutinfo_data.dart';
import 'package:goodiez_abalone/src/providers/search_games_data.dart';
import 'package:goodiez_abalone/src/providers/transition_data.dart';
import 'package:goodiez_abalone/src/providers/user_data.dart';
import 'package:goodiez_abalone/src/providers/watching_data.dart';

import 'package:provider/provider.dart';
import 'app.dart';
import 'firebase_options.dart';
import 'src/providers/providers.dart';
import 'theme/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: GoodiezTheme.defaultTheme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => BrandsData(),
          ),
          ChangeNotifierProvider(
            create: (_) => GamesData(),
          ),
          ChangeNotifierProvider(
            create: (_) => BuyItemsData(),
          ),
          ChangeNotifierProvider(
            create: (_) => SellItemsData(),
          ),
          ChangeNotifierProvider(
            create: (_) => UserData(),
          ),
          ChangeNotifierProvider(
            create: (_) => TransitionData(),
          ),
          ChangeNotifierProvider(
            create: (_) => WatchingData(),
          ),
          ChangeNotifierProvider(
            create: (_) => PayOutInfoData(),
          ),
          ChangeNotifierProvider(
            create: (_) => SearchGamesData(),
          ),
          ChangeNotifierProvider(
            create: (_) => PolicyData(),
          ),
        ],
        child: const App(),
      ),
      // initialRoute: '/home',
      // routes: {
      //   '/home': (context) => const App(),
      //   PlaceBidScreen.routeName: (context) => const PlaceBidScreen(),
      // },
    );
  }
}
