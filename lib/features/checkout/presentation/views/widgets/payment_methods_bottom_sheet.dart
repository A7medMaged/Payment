import 'package:flutter/material.dart';
import 'package:payment/core/utils/widgets/custom_button.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_method.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PaymentMethod(),
          const SizedBox(
            height: 32,
          ),
          CustomButton(text: 'Continue', onPressed: () {}),
        ],
      ),
    );
  }
}
