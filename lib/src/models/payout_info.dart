class PayOutInfo {
  final String userid;
  final String order_number;
  final String payout_number;
  final String coverUrl;
  final String title;
  final String state;
  final String schedule;
  final double price;

  const PayOutInfo({
    required this.userid,
    required this.order_number,
    required this.payout_number,
    required this.coverUrl,
    required this.title,
    required this.state,
    required this.schedule,
    required this.price,
  });
}
