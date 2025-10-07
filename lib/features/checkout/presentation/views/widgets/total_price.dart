import 'package:flutter/material.dart';
import 'package:payment/core/utils/theme/text_style.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key, required this.totalPrice});
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Total',
          style: TextStyles.style24,
        ),
        const Spacer(),
        Text(
          totalPrice,
          style: TextStyles.style24,
        ),
      ],
    );
  }
}
