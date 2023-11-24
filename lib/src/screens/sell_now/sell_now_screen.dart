import 'package:flutter/material.dart';
import 'package:goodiez_abalone/src/models/policy.dart';

import '../../../theme/colors.dart';
import '../../models/askbid_data.dart';
import '../../models/game.dart';
import '../../models/item.dart';
import '../../models/sell_item.dart';
import '../../utils/utils.dart';
import '../../widgets/app_bars/app_bars.dart';
import '../../widgets/buttons/bid_ask_info_button.dart';
import '../../widgets/buttons/bottom_button.dart';
import '../../widgets/buttons/image_upload_button.dart';
import '../../widgets/prices/prices.dart';
import '../../widgets/texts/center_horizontal.dart';
import '../verification/verification.dart';
import '../place_ask/widgets/uploaded_image.dart';

class SellNowScreen extends StatefulWidget {
  static const routeName = '/placeAsk';

  const SellNowScreen({
    Key? key,
    required this.game,
    required this.sellItem,
    required this.policy,
  }) : super(key: key);

  final Game game;
  final SellItem sellItem;
  final Policy policy;

  @override
  State<SellNowScreen> createState() => _SellNowScreenState();
}

class _SellNowScreenState extends State<SellNowScreen> {

  void uploadImageBtnPressed(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BidAskAppBar(
        title: widget.sellItem.title,
        consoleName: widget.game.console,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 16.0),
                  Container(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ImageUploadButton(imageNum: 5, onBtnPressed: uploadImageBtnPressed),
                  ),
                  const SizedBox(width: 16.0),
                  //UploadedImage(imageUrl: widget.game.cover[0]),
                  //UploadedImage(imageUrl: widget.game.cover[0]),
                  //UploadedImage(imageUrl: widget.game.cover[0]),
                  //UploadedImage(imageUrl: widget.game.cover[0]),
                  //UploadedImage(imageUrl: widget.game.cover[0]),
                  const SizedBox(width: 16.0),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      primary: Colors.white,
                      minimumSize: const Size.fromHeight(48),
                      alignment: Alignment.centerLeft,
                      side: const BorderSide(
                        color: AppColor.darkGray,
                        width: 1,
                      ),
                    ),
                    onPressed: () {
                      print(widget.game.title);
                    },
                    child: const Text(
                      'New',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.darkGray,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  BidAskStatus(
                    maxBid: widget.game.maxBid,
                    minSell: widget.game.minSell,
                  ),
                  const SizedBox(height: 8.0),
                  const CenterHorizontal(
                    children: <Widget>[
                      Text(
                        'Condition: New',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColor.defaultGray,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  //const PriceInputField(hintText: 'Enter Ask'),
                  const SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 0.0,
                    ),
                    height: 152.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColor.lineGray,
                          width: 1.0,
                        ),
                        color: Colors.white),
                    child: const TextField(
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      maxLines: 10,
                      style: TextStyle(
                        color: AppColor.darkGray,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        labelText: '',
                        counterText: '',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.only(bottom: 16.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  CenterHorizontal(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          style: GoodiezTextStyles.infoHeaderText,
                          children: const <TextSpan>[
                            TextSpan(text: 'You\'re '),
                            TextSpan(
                              text: 'not',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(text: ' the Lowest Asker'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  PriceDetailItem(
                    title: 'Transaction Fee (10.0%)',
                    price: -5.85,
                    itemType: ItemType.ask,
                  ),
                  PriceDetailItem(
                    title: 'Payment Proc. (3.0%)',
                    price: -1.53,
                    itemType: ItemType.ask,
                  ),
                  PriceDetailItem(
                    title: 'Shipping',
                    price: 0,
                    itemType: ItemType.ask,
                  ),
                  const SizedBox(height: 8.0),
                  const FinalPriceDisplayer(
                    label: 'Total Payout',
                    price: 58.55,
                  ),
                  const Text(
                    'Final price will be calculated at checkout',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.darkGray,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            const BidAskInfoButton(
              icon: Icons.monetization_on,
              info: 'Payout Method: Active',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        buttonColor: AppColor.goodiezRed,
        buttonTitle: 'Review Sell',
        onPressed: () {
          /*Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => VerificationAskScreen(
              itemType: ItemType.ask,
              game: widget.game,
              policy: widget.policy,
              abd: widget.abd,
            ),
          ));*/
        },
      ),
    );
  }
}
