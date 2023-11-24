import 'package:flutter/material.dart';
import 'package:goodiez_abalone/src/utils/goodiez_text_styles.dart';
import '../../../theme/colors.dart';
import '../../models/muser.dart';
import '../../models/payout_info.dart';
import '../../models/muser.dart';
import 'screens/account_edit_screen.dart';
import 'screens/buying_info_edit_screen.dart';
import 'screens/payout_info_screen.dart';
import 'screens/shipping_info_edit_screen.dart';
import 'widgets/account_item.dart';
import 'widgets/avatar_item.dart';
import 'widgets/settings_item.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';
  final MUser user_data;
  final List<PayOutInfo> processingList;
  final List<PayOutInfo> onholdList;
  const SettingsScreen({
    Key? key,
    required this.user_data,
    required this.processingList,
    required this.onholdList,
    this.navigatorKey,
  }) : super(key: key);

  final GlobalKey? navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext childContext) {
            void _editAccount() {
              Navigator.of(childContext).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => AccountEditScreen(user_data: user_data),
                ),
              );
            }

            void _editBuyingInfo() {
              Navigator.of(childContext).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                  const BuyingInfoEditScreen(),
                ),
              );
            }

            void _editShippingInfo() {
              Navigator.of(childContext).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ShippingInfoEditScreen(user_data: user_data,),
                ),
              );
            }

            void _editPayoutInfo() {
              Navigator.of(childContext).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => PayOutInfoScreen(
                    processingList: processingList,
                    onholdList: onholdList,
                  ),
                ),
              );
            }

            return Scaffold(
              appBar: AppBar(
                shape: const Border(
                  bottom: BorderSide(
                    color: AppColor.lineGray,
                    width: 1,
                  ),
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColor.darkGray,
                  ),
                ),
                titleSpacing: 0,
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AvatarItem(imageUrl: user_data.AvatarUrl),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SettingsItem(
                            title: 'Account',
                            items: [
                              AccountItem(
                                  label: 'Email', value: user_data.email),
                              AccountItem(label: 'Name', value: user_data.nickname),
                              AccountItem(
                                  label: 'Profile Name',
                                  value: user_data.shippingAddress.lastName),
                            ],
                            onEdit: _editAccount,
                          ),
                          SettingsItem(
                            title: 'Buying Info',
                            items: const [
                              AccountItem(
                                  label: 'Billing',
                                  value:
                                  '221 E 58th St Apt 3W\nNew York NY 10022-1221'),
                              AccountItem(
                                  label: 'Payment',
                                  value: 'Master Card ending in **01'),
                            ],
                            onEdit: _editBuyingInfo,
                          ),
                          SettingsItem(
                            title: 'Shipping Info',
                            items: [
                              AccountItem(
                                  label: 'Shipping',
                                  value:
                                  user_data.shippingAddress.address2 + '\n' + user_data.shippingAddress.address),
                            ],
                            onEdit: _editShippingInfo,
                          ),
                          SettingsItem(
                            title: 'Selling Info',
                            items: const [
                              AccountItem(
                                  label: 'Payment',
                                  value: 'Master Card ending in **01'),
                            ],
                            onEdit: _editAccount,
                          ),
                          SettingsItem(
                            title: 'Payout Info',
                            items: [
                              const Text(
                                'Payout settings will be managed in a separate window. From here, sellers can manage payout transfer methods, select preferences, and track payments from Goodiez.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.darkGray,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Text(
                                'Payout',
                                style: GoodiezTextStyles.smallTitle,
                              ),
                              const SizedBox(height: 8.0),
                              const Text(
                                'Active',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.darkGray,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ],
                            onEdit: _editPayoutInfo,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}