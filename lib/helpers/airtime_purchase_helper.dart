// import 'dart:convert';

// import 'package:HNG_Pay/api/airtime_purchase_api.dart';
// import 'package:HNG_Pay/locator.dart';
// import 'package:HNG_Pay/models/AirtimePurchase.dart';
// import 'package:HNG_Pay/models/glitch.dart';
// import 'package:HNG_Pay/models/network_providers.dart';
// import 'package:dartz/dartz.dart';

// class AirtimePurchaseHelper {
//   final api = locator<AirtimePurchaseABS>();

//   Future<Either<Glitch, AirtimePurchase>> purchaseAirtime(
//       {String code, int amount, String phoneNumber}) async {
//     final result = await api.purchaseAirtime(
//         code: code, amount: amount, phoneNumber: phoneNumber);
//     return result.fold(
//       (l) => Left(
//         NoInternetGlitch(),
//       ),
//       (r) => Right(
//         AirtimePurchase.fromJson(jsonDecode(r)),
//       ),
//     );
//   }

//   Future<Either<Glitch, Network>> getProviders() async {
//     final result = await api.getNetworkProviders();
//     return result.fold(
//       (l) => Left(NoInternetGlitch()),
//       (r) => Right(
//         Network.fromMap(
//           jsonDecode(r),
//         ),
//       ),
//     );
//   }
// }
