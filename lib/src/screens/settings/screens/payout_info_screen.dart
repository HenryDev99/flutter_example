import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../models/payout_info.dart';
import '../../../utils/utils.dart';
import '../widgets/widgets.dart';

class PayOutInfoScreen extends StatefulWidget {
  static const routeName = '/my-collection';
  final List<PayOutInfo> processingList;
  final List<PayOutInfo> onholdList;
  const PayOutInfoScreen({
    Key? key,
    this.navigatorKey,
    required this.processingList,
    required this.onholdList
  }) : super(key: key);

  final GlobalKey? navigatorKey;

  @override
  State<PayOutInfoScreen> createState() => _PayOutInfoScreenState();
}

const List<Tab> tabs = <Tab>[
  Tab(text: 'Processing'),
  Tab(text: 'On hold'),
  Tab(text: 'Payouts'),
];

class _PayOutInfoScreenState extends State<PayOutInfoScreen> {
  var totalProcessingPrice = 0.0;
  var totalOnholdPrice = 0.0;
  @override
  Widget build(BuildContext context) {
    for(int i=0;i<widget.processingList.length;i++){
      totalProcessingPrice += widget.processingList[i].price;
    };
    for(int i=0;i<widget.onholdList.length;i++){
      totalOnholdPrice += widget.onholdList[i].price;
    };
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (BuildContext tabContext) {
          final TabController tabController =
              DefaultTabController.of(tabContext)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              // Your code goes here.
              // To get index of current tab use tabController.index
            }
          });
          return Scaffold(
            appBar: AppBar(
              shape: const Border(
                bottom: BorderSide(
                  color: AppColor.lineGray,
                  width: 1,
                ),
              ),
              title: const Text(
                'Payout Info',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColor.darkGray,
                  letterSpacing: -0.5,
                ),
              ),
              titleSpacing: 0,
              elevation: 0,
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 1.0,
                      color: AppColor.lineGray,
                    ),
                    const TabBar(
                      tabs: tabs,
                      labelColor: AppColor.primaryColor,
                      unselectedLabelColor: AppColor.defaultGray,
                    ),
                  ],
                ),
                preferredSize: const Size.fromHeight(50.0),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32.0),
                      Text(
                        'Processing',
                        style: GoodiezTextStyles.smallTitle,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '\$'+totalProcessingPrice.toStringAsFixed(2),
                        style: GoodiezTextStyles.priceText,
                      ),
                      const SizedBox(height: 32.0),
                      ListView.separated(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, index) => const SizedBox(
                          height: 16,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return PayoutGameItem(
                              imageUrl: widget.processingList[index].coverUrl,
                              gameName: widget.processingList[index].title,
                              price: widget.processingList[index].price,
                              order_number: widget.processingList[index].order_number,
                              schedule: widget.processingList[index].schedule,
                              state: widget.processingList[index].state
                          );
                        },
                        itemCount: widget.processingList.length,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32.0),
                      Text(
                        'On hold',
                        style: GoodiezTextStyles.smallTitle,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '\$'+totalOnholdPrice.toStringAsFixed(2),
                        style: GoodiezTextStyles.priceText,
                      ),
                      const SizedBox(height: 32.0),
                      ListView.separated(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, index) => const SizedBox(
                          height: 16,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return PayoutGameItem(
                              imageUrl: widget.onholdList[index].coverUrl,
                              gameName: widget.onholdList[index].title,
                              price: widget.onholdList[index].price,
                              order_number: widget.onholdList[index].order_number,
                              schedule: widget.onholdList[index].schedule,
                              state: widget.onholdList[index].state
                          );
                        },
                        itemCount: widget.onholdList.length,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32.0),
                      Text(
                        'Payouts',
                        style: GoodiezTextStyles.smallTitle,
                      ),
                      const SizedBox(height: 32.0),
                      ListView.separated(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, index) => const SizedBox(
                          height: 16,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return const PayoutItem(
                            price: 749.99,
                          );
                        },
                        itemCount: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
