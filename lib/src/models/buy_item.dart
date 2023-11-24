class BuyItem {
  final String id;
  final String gameId;
  final List<String> cover;
  final String title;
  final String description;
  final String seller;
  final String sellerAvatar;
  final double price;
  final String console;
  final String condition;

  const BuyItem({
    required this.id,
    required this.gameId,
    required this.cover,
    required this.title,
    required this.description,
    required this.seller,
    required this.sellerAvatar,
    required this.price,
    required this.console,
    required this.condition
  });
}
