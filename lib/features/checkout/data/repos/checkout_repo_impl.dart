import 'package:dartz/dartz.dart';
import 'package:payment/core/errors/failure.dart';
import 'package:payment/core/utils/stripe_service.dart';
import 'package:payment/features/checkout/data/models/payment_intent_request.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService;

  CheckoutRepoImpl({required this.stripeService});

  @override
  Future<Either<Failure, void>> makePayment({
    required PayMentIntentRequest paymentIntentRequest,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentRequest: paymentIntentRequest,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
