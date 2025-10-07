import 'package:flutter/material.dart';
import 'package:payment/core/utils/widgets/custom_app_bar.dart';
import 'package:payment/features/checkout/presentation/views/widgets/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: 'Payment Details',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: const PaymentDetailsViewBody(),
    );
  }
}
