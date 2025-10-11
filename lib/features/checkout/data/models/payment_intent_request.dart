class PaymentIntentRequest {
  final String amount;
  final String currency;

  PaymentIntentRequest({
    required this.amount,
    required this.currency,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': (double.parse(amount) * 100)
          .toInt(), 
      'currency': currency,
    };
  }
}
