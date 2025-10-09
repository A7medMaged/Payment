import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:payment/core/utils/dio_factory.dart';

GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  //  Dio
  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());
}
