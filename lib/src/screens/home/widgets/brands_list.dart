import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/brand.dart';
import '../../../providers/brands_data.dart';
import 'brand_item.dart';

class BrandsList extends StatelessWidget {
  const BrandsList({
    Key? key,
    required this.onSelectBrand,
  }) : super(key: key);

  final ValueChanged<Brand> onSelectBrand;

  @override
  Widget build(BuildContext context) {
    final brandsData = Provider.of<BrandsData>(context);
    final brandList = brandsData.brandList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Shop by Console Brand',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 124,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            scrollDirection: Axis.horizontal,
            itemCount: brandList.length,
            itemBuilder: (context, index) => BrandItem(
              brand: brandList[index],
              onSelectBrand: onSelectBrand,
            ),
            separatorBuilder: (_, index) => const SizedBox(
              width: 16,
            ),
          ),
        ),
      ],
    );
  }
}
