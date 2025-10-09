import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:payment/core/utils/dio_factory.dart';
import 'package:payment/core/utils/stripe_service.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo_impl.dart';

GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  //  Dio
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

  // repo
  getIt.registerLazySingleton<StripeService>(
    () => StripeService(dio: getIt<Dio>()),
  );

  getIt.registerLazySingleton<CheckoutRepoImpl>(
    () => CheckoutRepoImpl(
      stripeService: getIt<StripeService>(),
    ),
  );

  // cubits
  getIt.registerFactory<CheckoutRepoImpl>(
    () => CheckoutRepoImpl(stripeService: getIt<StripeService>()),
  );
}
