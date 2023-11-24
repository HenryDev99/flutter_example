import 'package:flutter/material.dart';

import '../models/policy.dart';

class PolicyData with ChangeNotifier {
  Policy policyData = Policy(
    vat: 0.03,
    processingFee: 0.05,
    paymentProc: 0.02,
    Shipping: 1.5,
    Verification: 5,
    transactionFee: 0.01
  );

}