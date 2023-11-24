class Transaction {
  final String stripeId;
  final String dwollaId;
  final String stripeTransactionStatus;
  final String dwollaTransactionStatus;
  final String stripeDetail;
  final String dwollaDetail;
  final List<History> stripeHistory;
  final List<History> dwollaHistory;

  const Transaction({
    required this.stripeId,
    required this.dwollaId,
    required this.stripeTransactionStatus,
    required this.dwollaTransactionStatus,
    required this.stripeDetail,
    required this.dwollaDetail,
    required this.stripeHistory,
    required this.dwollaHistory,
  });

  @override
  String toString() {
    return 'Transaction: {stripeId: $stripeId, dwollaId: $dwollaId}';
  }
}

class History {
  final String status;
  final String date;
  final String detail;

  const History({
    required this.status,
    required this.date,
    required this.detail,
  });
}
