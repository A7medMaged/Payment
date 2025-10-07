import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:payment/core/utils/theme/text_style.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({super.key, required this.formKey, required this.autovalidateMode});
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  String bankName = '';
  bool showBackView = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      // ignore: deprecated_member_use
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          onCreditCardWidgetChange: (value) {},
          isHolderNameVisible: true,
          bankName: bankName,
          frontCardBorder: useGlassMorphism
              ? null
              : Border.all(color: Colors.grey),
          backCardBorder: useGlassMorphism
              ? null
              : Border.all(color: Colors.grey),
          cardBgColor: Colors.black,
        ),
        CreditCardForm(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: (creditCardModel) {
            setState(() {
              cardNumber = creditCardModel.cardNumber;
              expiryDate = creditCardModel.expiryDate;
              cardHolderName = creditCardModel.cardHolderName;
              cvvCode = creditCardModel.cvvCode;
              showBackView = creditCardModel.isCvvFocused;
            });
          },
          formKey: widget.formKey,
          autovalidateMode: widget.autovalidateMode,
          inputConfiguration: InputConfiguration(
            cardHolderDecoration: InputDecoration(
              labelStyle: TextStyles.style18,
              labelText: 'Card Holder Name',
            ),
            cardNumberDecoration: InputDecoration(
              labelStyle: TextStyles.style18,
              labelText: 'Card Number',
            ),
            expiryDateDecoration: InputDecoration(
              labelStyle: TextStyles.style18,
              labelText: 'Expiry Date',
            ),
            cvvCodeDecoration: InputDecoration(
              labelStyle: TextStyles.style18,
              labelText: 'CVV',
            ),
          ),
        ),
      ],
    );
  }
}
