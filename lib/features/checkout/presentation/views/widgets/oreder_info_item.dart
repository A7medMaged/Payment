import 'package:flutter/material.dart';
import 'package:payment/core/utils/theme/text_style.dart';

class OrederInfoItem extends StatelessWidget {
  const OrederInfoItem({
    super.key,
    required this.orderName,
    required this.orderPrice,
  });
  final String orderName;
  final String orderPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          orderName,
          style: TextStyles.style18,
        ),
        const Spacer(),
        Text(
          orderPrice,
          style: TextStyles.style18,
        ),
      ],
    );
  }
}
