import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../theme/colors.dart';
import '../../models/item.dart';
import '../../models/models.dart';
import '../../models/policy.dart';
import '../../models/askbid_data.dart';
import '../../providers/providers.dart';
import '../../utils/utils.dart';
import '../../widgets/app_bars/app_bars.dart';
import '../../widgets/bottom_sheet/condition_sheet.dart';
import '../../widgets/buttons/bid_ask_info_button.dart';
import '../../widgets/buttons/bottom_button.dart';
import '../../widgets/buttons/image_upload_button.dart';
import '../../widgets/prices/prices.dart';
import '../../widgets/texts/center_horizontal.dart';
import '../game_detail/widgets/widgets.dart';
import '../verification/verification.dart';
import 'widgets/uploaded_image.dart';

class PlaceAskScreen extends StatefulWidget {
  static const routeName = '/placeAsk';

  const PlaceAskScreen({
    Key? key,
    required this.game,
    required this.onSellPressed,
    required this.policy,
    required this.user_id
  }) : super(key: key);

  final Game game;
  final Function onSellPressed;
  final Policy policy;
  final String user_id;

  @override
  State<PlaceAskScreen> createState() => _PlaceAskScreenState();
}

class _PlaceAskScreenState extends State<PlaceAskScreen> {
  var imagenum = 0;
  List<File> images = <File>[];
  final priceController = TextEditingController();
  final descController = TextEditingController();
  var condition = 'new';

  void changeCondition(String value){
    setState(() {
      condition = value;
    });
  }
  void uploadImageBtnPressed() async{
    if(imagenum == 10){
      return;
    }
    var picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imagenum += 1;
      images.add(File(image!.path));
    });
  }

  void removeUploadImage(int index) {
    setState(() {
      imagenum -= 1;
      images.removeAt(index);
    });
  }

  void changeMoney(){
    setState(() {
    });
  }

  @override
  void initState() {
    priceController.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    final sellItemsData = Provider.of<SellItemsData>(context);
    final sellItemList = sellItemsData.sellItemList;

    return Scaffold(
      appBar: BidAskAppBar(
        title: widget.game.title,
        consoleName: widget.game.console,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ImageUploadButton(imageNum: imagenum, onBtnPressed: uploadImageBtnPressed),
                ),
                const SizedBox(width: 16,),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    height: 72,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return UploadedImage(
                            image: images[index],
                            index: index,
                            onDeleteBtnPressed: removeUploadImage);
                        }),
                  )
                ),
              ],
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
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(24.0),
                            topLeft: Radius.circular(24.0),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext ctx) {
                          return ConditionSheet(changecondition: changeCondition);
                        },
                      );
                    },
                    child: Text(
                      '$condition',
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
                  CenterHorizontal(
                    children: <Widget>[
                      Text(
                        'Condition: $condition',
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
                  PriceInputField(hintText: 'Enter Ask', textEditingController: priceController, onChangeMoney: changeMoney),
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
                    child: TextField(
                      controller: descController,
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
                    title: 'Transaction Fee (${(widget.policy.transactionFee * 100).round()}%)',
                    price: priceController.text == '' ? 0 : double.parse(priceController.text) * widget.policy.transactionFee,
                    itemType: ItemType.ask
                  ),
                  PriceDetailItem(
                    title: 'Payment Proc. (${(widget.policy.paymentProc * 100).round()}%)',
                    price: priceController.text == '' ? 0 : double.parse(priceController.text) * widget.policy.paymentProc,
                    itemType: ItemType.ask
                  ),
                  PriceDetailItem(
                    title: 'Shipping',
                    price: widget.policy.Shipping,
                    itemType: ItemType.ask
                  ),
                  const SizedBox(height: 8.0),
                  FinalPriceDisplayer(
                    label: 'Total Payout',
                    price: (double.parse(priceController.text) -
                        double.parse(priceController.text) * widget.policy.transactionFee -
                        double.parse(priceController.text) * widget.policy.paymentProc - widget.policy.Shipping),
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
            Container(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'You can sell now!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.darkGray,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ListView.separated(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, index) => const SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return SellNowItem(
                        sellItem: sellItemList[index],
                        onSellPressed: widget.onSellPressed(widget.game),
                      );
                    },
                    itemCount: sellItemList.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        buttonColor: AppColor.goodiezRed,
        buttonTitle: 'Review Ask',
        onPressed: () {
          AskBidData abd = AskBidData(
            title: widget.game.title,
              total_price: double.parse((double.parse(priceController.text) -
                double.parse(priceController.text) * widget.policy.transactionFee -
                double.parse(priceController.text) * widget.policy.paymentProc - widget.policy.Shipping).toStringAsFixed(2)),
            id: widget.game.id,
            condition: condition,
            description: descController.text,
            images: images,
            type: ItemType.ask,
            user_id: widget.user_id
          );
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => VerificationAskScreen(
              itemType: ItemType.ask,
              game: widget.game,
              abd: abd,
              policy: widget.policy,
            ),
          ));
        },
      ),
    );
  }
}
