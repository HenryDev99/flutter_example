import 'package:flutter/material.dart';

import '../../models/brand.dart';
import '../../../theme/colors.dart';
import '../../widgets/app_bars/app_bars.dart';

class ConsolesScreen extends StatelessWidget {
  const ConsolesScreen({
    Key? key,
    required this.brand,
  }) : super(key: key);

  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 32,
                    height: 32,
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(brand.imageUrl),
                        fit: BoxFit.contain,
                      ),
                      border: Border.all(
                        color: AppColor.lineGray,
                        width: brand.name == 'Sega' ? 1 : 0,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Text(
                    brand.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColor.darkGray,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: brand.consoles.length,
                itemBuilder: (BuildContext ctx, int index) {
                  // double imageSize = MediaQuery.of(ctx).size.width / 3 - 36;
                  return SizedBox(
                    width: double.infinity,
                    // color: AppColor.primaryColorLight,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.lineGray,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(brand.consoles[index].imageUrl),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          brand.consoles[index].name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.darkGray,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ],
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  mainAxisExtent: 164,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
