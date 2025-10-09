import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/features/checkout/data/models/payment_intent_model_response/payment_intent_model.dart';
import 'package:payment/features/checkout/data/models/payment_intent_request.dart';

class StripeService {
  final Dio dio = Dio();
  Future<PaymentIntentModel> createPaymentIntent(
    PayMentIntentRequest paymentIntentRequest,
  ) async {
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      data: paymentIntentRequest.toJson(),
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Flutter Stripe Store',
        paymentIntentClientSecret: paymentIntentClientSecret,
      ),
    );
  }

  Future presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PayMentIntentRequest paymentIntentRequest,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentRequest);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
    );
    await presentPaymentSheet();
  }
}
