import 'package:flutter/material.dart';
import 'package:goodiez_abalone/RestApi.dart';
import 'package:goodiez_abalone/src/screens/home/widgets/game_list2.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../models/buy_item.dart';
import '../../models/game.dart';
import '../../models/muser.dart';
import '../../models/sell_item.dart';
import '../../providers/providers.dart';
import '../../utils/route_util.dart';
import '../../widgets/app_bars/app_bars.dart';
import '../buy_now/buy_now.dart';
import '../game_detail/game_detail.dart';
import '../place_ask/place_ask.dart';
import '../place_bid/place_bid.dart';
import '../sell_now/sell_now.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    this.navigatorKey,
    required this.user_data
  }) : super(key: key);

  final GlobalKey? navigatorKey;
  final MUser user_data;
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  bool _isInit = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<GamesData>(context).fetchAndSetGames().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _policyData = Provider.of<PolicyData>(context);
    final _policy = _policyData.policyData;

    Function _onBuyPressed(Game game) =>
        (BuyItem buyItem) => Navigator.of(context).push(
              RouteUtil.createPlaceBidAskRoute(
                (newContext, animation, secondaryAnimation) => BuyNowScreen(
                  game: game,
                  buyItem: buyItem,
                  policy: _policy,
                ),
              ),
            );

    void _onBidPressed(Game game) {
      Navigator.of(context).push(
        RouteUtil.createPlaceBidAskRoute(
          (newContext, animation, secondaryAnimation) =>
              ChangeNotifierProvider<BuyItemsData>.value(
            value: Provider.of<BuyItemsData>(context),
            child: PlaceBidScreen(
              game: game,
              onBuyPressed: _onBuyPressed,
              policy: _policy,
            ),
          ),
        ),
      );
    }

    Function _onSellPressed(Game game) =>
        (SellItem sellItem) => Navigator.of(context).push(
              RouteUtil.createPlaceBidAskRoute(
                (newContext, animation, secondaryAnimation) => SellNowScreen(
                  game: game,
                  sellItem: sellItem,
                  policy: _policy,
                ),
              ),
            );

    void _onAskPressed(Game game) {
      Navigator.of(context).push(
        RouteUtil.createPlaceBidAskRoute(
          (newContext, animation, secondaryAnimation) =>
              ChangeNotifierProvider<SellItemsData>.value(
                value: Provider.of<SellItemsData>(context),
                child: PlaceAskScreen(
                  game: game,
                  onSellPressed: _onSellPressed,
                  policy: _policy,
                  user_id: widget.user_data.id,
                ),
              ),
        ),
      );
    }

    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext childContext) {
            void _selectGame(Game game) {
              Navigator.of(childContext).push(MaterialPageRoute(
                builder: (BuildContext context) => GameDetailScreen(
                  game: game,
                  onBidPressed: _onBidPressed,
                  onAskPressed: _onAskPressed,
                  onBuyPressed: _onBuyPressed,
                  onSellPressed: _onSellPressed,
                ),
              ));
            }

            return Scaffold(
              appBar: const CustomAppBar(hasLogo: true),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 32),
                    BrandsList(
                      onSelectBrand: RouteUtil.selectBrand(childContext),
                    ),
                    const SizedBox(height: 8),
                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : GamesList(
                            listTitle: Constants.mostPopuplar,
                            onSelectGame: _selectGame,
                            onSeeAll: RouteUtil.selectSeeAll(context)),
                    const SizedBox(height: 32),
                    _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : GamesList(
                            listTitle: 'Top Sellers',
                            onSelectGame: _selectGame,
                            onSeeAll: RouteUtil.selectSeeAll(context)),
                    const SizedBox(height: 32),
                    FutureBuilder<List<Game>>(
                        future: RestApi().loadGameList(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return GamesList2(
                              listTitle: 'Popular Bids',
                              onSelectGame: _selectGame,
                              onSeeAll: RouteUtil.selectSeeAll(context),
                              gameList: snapshot.data as List<Game>,
                            );
                          }
                          return CircularProgressIndicator();
                        }),
                    const SizedBox(height: 32),
                    FutureBuilder<List<Game>>(
                        future: RestApi().loadGameList(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return GamesList2(
                              listTitle: 'Hot New Releases',
                              onSelectGame: _selectGame,
                              onSeeAll: RouteUtil.selectSeeAll(context),
                              gameList: snapshot.data as List<Game>,
                            );
                          }
                          return CircularProgressIndicator();
                        }),
                    const SizedBox(height: 32),
                    FutureBuilder<List<Game>>(
                        future: RestApi().loadGameList(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return GamesList2(
                              listTitle: 'Recently Viewed',
                              onSelectGame: _selectGame,
                              onSeeAll: RouteUtil.selectSeeAll(context),
                              gameList: snapshot.data as List<Game>,
                            );
                          }
                          return CircularProgressIndicator();
                        }),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
