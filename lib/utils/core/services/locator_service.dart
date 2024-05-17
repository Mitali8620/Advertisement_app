import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../networking/client_impl.dart';
import '../networking/client_setup.dart';
import 'store_service.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<ClientImpl>(() => ClientImpl(getDioInstance()));
  locator.registerLazySingleton<StoreService>(() => StoreService());
}
