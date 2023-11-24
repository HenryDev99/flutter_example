import 'package:flutter/material.dart';
import 'package:goodiez_abalone/theme/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, this.hasLogo = false}) : super(key: key);

  final bool hasLogo;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hasLogo
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).maybePop(),
            ),
      centerTitle: false,
      shape: const Border(
        bottom: BorderSide(
          color: AppColor.lineGray,
          width: 1,
        ),
      ),
      elevation: 0,
      titleSpacing: 16.0,
      title: hasLogo
          ? Image.asset(
              'assets/images/goodiezMainText.png',
              width: 126.0,
              height: 36.0,
            )
          : null,
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.notifications_none_outlined,
            color: AppColor.darkGray,
            size: 35,
          ),
          onPressed: () => {},
        ),
        IconButton(
          icon: const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/images/image.png'),
          ),
          onPressed: () => {},
        )
      ],
    );
  }
}
