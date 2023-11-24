import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:goodiez_abalone/src/models/policy.dart';

import '../../../theme/colors.dart';
import '../../models/buy_item.dart';
import '../../models/item.dart';
import '../../models/models.dart';
import '../../widgets/buttons/bottom_button.dart';
import '../place_bid/screens/shipping_adress_screen.dart';

class BuyNowScreen extends StatefulWidget {
  const BuyNowScreen({
    Key? key,
    required this.game,
    required this.buyItem,
    required this.policy
  }) : super(key: key);

  final Game game;
  final BuyItem buyItem;
  final Policy policy;

  @override
  State<BuyNowScreen> createState() => _BuyNowScreenState();
}

class _BuyNowScreenState extends State<BuyNowScreen> {
  Color appBarBackgroundColor = Colors.transparent;
  ShapeBorder? appBarBorder;

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.pixels < 238) {
      setState(() {
        appBarBackgroundColor = Colors.transparent;
        appBarBorder = null;
      });
    } else {
      setState(() {
        appBarBackgroundColor = Colors.white;
        appBarBorder = const Border(
          bottom: BorderSide(
            color: AppColor.lineGray,
            width: 1,
          ),
        );
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.darkGray,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        shape: appBarBorder,
        backgroundColor: appBarBackgroundColor,
        elevation: 0,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              /*Container(
                width: MediaQuery.of(context).size.width,
                height: 336,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.buyItem.cover[0]),
                  ),
                ),
              ),*/
              Container(
                child: CarouselSlider(
                    options: CarouselOptions(),
                items: widget.buyItem.cover
                    .map((item) => Container(
                  child: Center(
                      child:
                      Image.network(item, fit: BoxFit.cover, width: 1000)),
                ))
                    .toList(),
              )),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                widget.buyItem.sellerAvatar,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.buyItem.seller,
                          style: const TextStyle(
                            color: AppColor.darkGray,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '\$${widget.buyItem.price}',
                      style: const TextStyle(
                        color: AppColor.darkGray,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.buyItem.title,
                      style: const TextStyle(
                        color: AppColor.darkGray,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Text(
                      widget.game.console,
                      style: const TextStyle(
                        color: AppColor.defaultGray,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      widget.buyItem.description,
                      style: const TextStyle(
                        color: AppColor.darkGray,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomButton(
        buttonColor: AppColor.goodiezGreen,
        buttonTitle: 'Review Order',
        onPressed: () {
          /*Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ShippingAddressScreen(
                itemType: ItemType.bid,
                game: widget.game,
                policy: widget.policy,
              ),
            ),
          );*/
        },
      ),
    );
  }
}
