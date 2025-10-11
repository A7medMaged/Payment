import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/widgets/custom_button.dart';
import 'package:payment/features/checkout/data/models/payment_intent_request.dart';
import 'package:payment/features/checkout/logic/cubit/payment_cubit.dart';
import 'package:payment/features/checkout/presentation/views/thank_you_view.dart';
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
          BlocConsumer<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is PaymentSuccess) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const ThankYouView(),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Payment Successful'),
                  ),
                );
              } else if (state is PaymentFailure) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Payment Failed: ${state.errorMessage}'),
                  ),
                );
                log(state.errorMessage);
              }
            },
            builder: (context, state) {
              return CustomButton(
                text: 'Continue',
                isLoading: state is PaymentLoading ? true : false,
                onPressed: () {
                  PaymentIntentRequest paymentIntentRequest =
                      PaymentIntentRequest(
                        amount: '5.5',
                        currency: 'AED',
                      );
                  BlocProvider.of<PaymentCubit>(
                    context,
                  ).makePayment(paymentIntentRequest: paymentIntentRequest);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
