import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/features/checkout/data/models/payment_intent_request.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo_impl.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepoImpl) : super(PaymentInitial());
  final CheckoutRepoImpl checkoutRepoImpl;

  Future makePayment({
    required PayMentIntentRequest paymentIntentRequest,
  }) async {
    emit(PaymentLoading());
    var result = await checkoutRepoImpl.makePayment(
      paymentIntentRequest: paymentIntentRequest,
    );
    result.fold(
      (l) => emit(PaymentFailure(l.errorMessage)),
      (r) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    super.onChange(change);
    log(change.toString());
  }
}
