class PayMentIntentRequest {
  final String amount;
  final String currency;

  PayMentIntentRequest({
    required this.amount,
    required this.currency,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'currency': currency,
    };
  }
}
