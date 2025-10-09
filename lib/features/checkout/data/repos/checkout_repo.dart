import 'package:dartz/dartz.dart';
import 'package:payment/core/errors/failure.dart';
import 'package:payment/features/checkout/data/models/payment_intent_request.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({
    required PayMentIntentRequest paymentIntentRequest,
  });
}
