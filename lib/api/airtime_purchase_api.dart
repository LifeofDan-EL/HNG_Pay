import 'dart:convert';
import 'dart:io';
import 'package:HNG_Pay/constants/ints.dart';
import 'package:HNG_Pay/constants/strings.dart';
import 'package:HNG_Pay/models/network_providers.dart';
import 'package:http/http.dart' as http;

abstract class AirtimePurchaseABS {
  // Network Providers
  Future<List<Network>> getNetworkProviders();
  // Purchase Airtime Credit
  Future<bool> purchaseAirtime({String code, String amount, String phoneNumber});
}

class AirtimePurchaseApi implements AirtimePurchaseABS {
  Map<String, String> header = {
    // 'Content-Type': 'application/json',
    'Authorization': 'Bearer uvjqzm5xl6bw',
  };
  @override
  Future<List<Network>> getNetworkProviders() async {
    try {
      var response = await http.post(
          '${AppStrings.baseUrl}/${AppStrings.wallet}/providers',
          headers: header);
      if (response.statusCode == AppNumbers.statusOkay) {
        Iterable json = jsonDecode(response.body)["Providers"];
        return json.map((e) => Network.fromMap(e)).toList();
      }
    } on SocketException {
      throw Failure("No Internet Connection");
    } on HttpException {
      throw Failure("Couldn't Retrieve Providers");
    } on FormatException {
      throw Failure("Bad Response Format");
    }
    return null;
  }

  @override
  Future<bool> purchaseAirtime(
      {String code, String amount, String phoneNumber}) async {
    Map<String, dynamic> body = {
      "Code": code,
      "Amount": amount,
      "PhoneNumber": phoneNumber,
      "SecretKey": "hfucj5jatq8h"
    };
    try {
      var response = await http.post(
          '${AppStrings.baseUrl}/${AppStrings.wallet}/purchase',
          headers: header,
          body: body);
      if (response.statusCode == AppNumbers.statusOkay) {
        print(response.body);
        return true;
      }
    } on SocketException {
      throw Failure("No Internet Connection");
    } on HttpException {
      throw Failure("Couldn't Retrieve Providers");
    } on FormatException {
      throw Failure("Bad Response Format");
    }
    return false;
  }
}

class Failure {
  // Use something like "int code;" if you want to translate error messages
  final String message;

  Failure(this.message);

  @override
  String toString() => message;
}
