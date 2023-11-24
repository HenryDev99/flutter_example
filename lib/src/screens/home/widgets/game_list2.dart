import 'package:flutter/material.dart';
import '../../../models/game.dart';
import 'game_item.dart';

class GamesList2 extends StatelessWidget {
  const GamesList2({
    Key? key,
    required this.listTitle,
    required this.onSelectGame,
    required this.onSeeAll,
    required List<Game> gameList
  }) : _gameList = gameList, super(key: key);

  final String listTitle;
  final ValueChanged<Game> onSelectGame;
  final ValueChanged<String> onSeeAll;
  final List<Game> _gameList;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                listTitle,
                style: Theme.of(context).textTheme.headline1,
              ),
              TextButton(
                onPressed: () => onSeeAll(listTitle),
                child: Row(
                  children: const <Widget>[
                    Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                      size: 25,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 254,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            scrollDirection: Axis.horizontal,
            itemCount: _gameList.length,
            itemBuilder: (context, index) {
              return GameItem(
                item: _gameList[index],
                onSelectGame: onSelectGame,
              );
            },
            separatorBuilder: (_, index) => const SizedBox(
              width: 8,
            ),
          ),
        ),
      ],
    );
  }
}