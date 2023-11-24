import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/search_games_data.dart';
import '../widgets/result_card.dart';

class ResultConsoleScreen extends StatefulWidget {
  const ResultConsoleScreen({
    Key? key,
    required this.brand,
    required this.keyword
  }) : super(key: key);

  final String brand;
  final String keyword;

  @override
  State<ResultConsoleScreen> createState() => _ResultConsoleScreen();
}

class _ResultConsoleScreen extends  State<ResultConsoleScreen> {
  bool _isInit = true;
  bool _isLoading = false;


  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<SearchGamesData>(context).fetchAndSetSearchGames(widget.keyword).then((_) {
        setState(() {
          _isLoading = false;
        });
      });

    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final searchItemData = Provider.of<SearchGamesData>(context);
    final searchItemList = searchItemData.gameList;

    double boxWidth = (MediaQuery.of(context).size.width - 48) / 2;
    double imageHeight = boxWidth - 32;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (BuildContext ctx, int index) => ResultCard(
                imageUrl: 'assets/images/mario_odyssey_cover.jpg',
                consoleName: 'Switch',
                gameName: 'Super Mario Odyssey',
                price: 48.99,
                boxWidth: boxWidth,
                imageHeight: imageHeight,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                mainAxisExtent: 156 + imageHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
