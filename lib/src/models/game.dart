class Game {
  final String id;
  final String console;
  final String title;
  final List<String> cover;
  final String description;
  final double minSell;
  final double maxBid;
  final String upc;
  final String created;

  const Game({
    required this.id,
    required this.console,
    required this.title,
    required this.cover,
    required this.description,
    required this.minSell,
    required this.maxBid,
    required this.upc,
    required this.created,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    // print(json);
    return Game(
      id: json['_id'] as String,
      console: json['console'] as String,
      title: json['title'] as String,
      cover: List<String>.from(json['cover']),
      description: json['description'] as String,
      minSell: json['minsell'] + 0.0,
      maxBid: json['maxbid'] + 0.0,
      created: json['created'] as String,
      upc: json['upc'] as String,
    );
  }
}
