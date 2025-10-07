import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_method.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: Column(
        children: [
          PaymentMethod(),
        ],
      ),
    );
  }
}
