import 'package:HNG_Pay/api/airtime_purchase_api.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;


void setupLocator(){
  locator.registerLazySingleton<AirtimePurchaseABS>(() => AirtimePurchaseApi());
}