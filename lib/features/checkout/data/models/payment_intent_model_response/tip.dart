class Tip {
  int? amount;
  String? currency;

  Tip({this.amount, this.currency});

  factory Tip.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return Tip();

    int? parsedAmount;
    final rawAmount = json['amount'];
    if (rawAmount is int) {
      parsedAmount = rawAmount;
    } else if (rawAmount is String) {
      parsedAmount = int.tryParse(rawAmount);
    }

    return Tip(
      amount: parsedAmount,
      currency: json['currency'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    if (amount != null) 'amount': amount,
    if (currency != null) 'currency': currency,
  };
}
