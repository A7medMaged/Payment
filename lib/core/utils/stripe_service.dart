import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/features/checkout/data/models/payment_intent_model_response/payment_intent_model.dart';
import 'package:payment/features/checkout/data/models/payment_intent_request.dart';

class StripeService {
  final Dio dio;

  StripeService({required this.dio});
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentRequest paymentIntentRequest,
  ) async {
    var response = await dio.post(
      'https://api.stripe.com/v1/payment_intents',
      data: paymentIntentRequest.toJson(),
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Flutter Stripe Store',
        paymentIntentClientSecret: paymentIntentClientSecret,
      ),
    );
  }

  Future presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      rethrow;
    }
  }

  Future makePayment({
    required PaymentIntentRequest paymentIntentRequest,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentRequest);
    final clientSecret = paymentIntentModel.clientSecret;
    if (clientSecret == null || clientSecret.isEmpty) {
      throw Exception('PaymentIntent client_secret is missing');
    }
    await initPaymentSheet(
      paymentIntentClientSecret: clientSecret,
    );
    await presentPaymentSheet();
  }
}
