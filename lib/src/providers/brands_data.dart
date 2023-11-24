import 'package:flutter/material.dart';

import '../models/models.dart';

class BrandsData with ChangeNotifier {
  final List<Brand> _brandList = const [
    Brand(
      name: 'Nintendo',
      imageUrl: 'assets/images/brands/nintendo.png',
      consoles: [
        Console(
          name: 'Switch',
          imageUrl: 'assets/images/consoles/switch.png',
        ),
        Console(
          name: 'Wii U',
          imageUrl: 'assets/images/consoles/wii_u.png',
        ),
        Console(
          name: 'Wii',
          imageUrl: 'assets/images/consoles/wii.png',
        ),
        Console(
          name: 'GameCube',
          imageUrl: 'assets/images/consoles/gamecube.png',
        ),
        Console(
          name: 'Nintendo 64',
          imageUrl: 'assets/images/consoles/nintendo64.png',
        ),
        Console(
          name: 'Super Nintendo',
          imageUrl: 'assets/images/consoles/supernintendo.png',
        ),
        Console(
          name: 'Nintendo (NES)',
          imageUrl: 'assets/images/consoles/nintendo.png',
        ),
        Console(
          name: '3DS',
          imageUrl: 'assets/images/consoles/3ds.png',
        ),
        Console(
          name: 'DS',
          imageUrl: 'assets/images/consoles/ds.png',
        ),
        Console(
          name: 'Gameboy Advanced',
          imageUrl: 'assets/images/consoles/gameboy_adv.png',
        ),
        Console(
          name: 'Gameboy',
          imageUrl: 'assets/images/consoles/gameboy.png',
        ),
      ],
    ),
    Brand(
      name: 'Sony',
      imageUrl: 'assets/images/brands/sony.png',
      consoles: [
        Console(
          name: 'Switch',
          imageUrl: 'assets/images/consoles/switch.png',
        )
      ],
    ),
    Brand(
      name: 'Microsoft',
      imageUrl: 'assets/images/brands/microsoft.png',
      consoles: [
        Console(
          name: 'Switch',
          imageUrl: 'assets/images/consoles/switch.png',
        )
      ],
    ),
    Brand(
      name: 'Sega',
      imageUrl: 'assets/images/brands/sega.png',
      consoles: [
        Console(
          name: 'Switch',
          imageUrl: 'assets/images/consoles/switch.png',
        )
      ],
    ),
    Brand(
      name: 'Other',
      imageUrl: 'assets/images/brands/other.png',
      consoles: [
        Console(
          name: 'Switch',
          imageUrl: 'assets/images/consoles/switch.png',
        )
      ],
    ),
  ];

  List<Brand> get brandList {
    return [..._brandList];
  }
}
