class Policy {
  final double vat;
  final double processingFee;
  final double Shipping;
  final double Verification;
  final double transactionFee;
  final double paymentProc;

  const Policy({
    required this.vat,
    required this.processingFee,
    required this.Shipping,
    required this.Verification,
    required this.transactionFee,
    required this.paymentProc,
  });
}