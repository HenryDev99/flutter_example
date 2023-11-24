class SellItem {
  final String id;
  final String gameId;
  final List<String> cover;
  final String title;
  final String description;
  final String buyer;
  final String buyerAvatar;
  final double price;
  final String console;
  final String condition;

  const SellItem({
    required this.id,
    required this.gameId,
    required this.cover,
    required this.title,
    required this.description,
    required this.buyer,
    required this.buyerAvatar,
    required this.price,
    required this.console,
    required this.condition
  });
}
