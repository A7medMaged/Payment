import 'package:flutter/material.dart';
import 'package:payment/core/utils/theme/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: const Color(0xFF34A853),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyles.style22,
          ),
        ),
      ),
    );
  }
}
