class Payment {
  final String cardName;
  final String cardNumber;
  final String expired;
  final String cvs;

  const Payment({
    required this.cardName,
    required this.cardNumber,
    required this.expired,
    required this.cvs,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      cardName: json['card_name'] as String,
      cardNumber: json['card_number'] as String,
      expired: json['expired'] as String,
      cvs: json['cvs'] as String,
    );
  }
}
