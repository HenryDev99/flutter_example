class MWatchingItem {
  final String imageUrl;
  final String gameName;
  final String consoleName;
  final String condition;
  final double highestBid;
  final double lowestAsk;

  const MWatchingItem({
    required this.imageUrl,
    required this.gameName,
    required this.consoleName,
    required this.condition,
    required this.highestBid,
    required this.lowestAsk,
  });
}