import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';
import '../../../models/brand.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    Key? key,
    required this.brand,
    required this.onSelectBrand,
  }) : super(key: key);

  final Brand brand;
  final ValueChanged<Brand> onSelectBrand;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onSelectBrand(brand);
          },
          child: Container(
            width: 96.0,
            height: 96.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(brand.imageUrl),
              ),
              border: Border.all(
                color: AppColor.lineGray,
                width: brand.name == 'Sega' ? 1 : 0,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          brand.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
      ],
    );
  }
}
