import 'dart:async';

import 'package:HNG_Pay/api/airtime_purchase_api.dart';
import 'package:HNG_Pay/locator.dart';
import 'package:HNG_Pay/models/network_providers.dart';
import 'package:HNG_Pay/vm/basemodel.dart';
import 'package:flutter/material.dart';

class AirtimeRechargeViewModel extends BaseModel {
  final _helper = locator<AirtimePurchaseABS>();
  // final _networkProviderController =
  //     StreamController<Either<Glitch, Network>>();

  Network _selectedNetwork;
  Network get selectedNetwork => _selectedNetwork;
  List<Network> networks = [];

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  bool _success = false;
  bool get success => _success;

  Failure _failure;
  Failure get failure => _failure;
  
  bool _selected = false;
  bool get selected => _selected;

  String _message;
  String get message => _message;

  void _setFailure(Failure failure) {
    _failure = failure;
    notifyListeners();
  }

  // Stream<Either<Glitch, Network>> get networkProviders {
  //   return _networkProviderController.stream;
  // }

  // Future<void> getAllNetworkProviders() async {
  //   for (int i = 0; i < 5; i++) {
  //     final networkProviders = await _helper.getProviders();
  //     _networkProviderController.add(networkProviders);
  //   }
  // }

  Future<void> networkProviders() async {
    try {
      setBusy(true);
      final networks = await _helper.getNetworkProviders();
      this.networks = networks;
      setBusy(false);
    } on Failure catch (f) {
      _setFailure(f);
    }
    setBusy(false);
    notifyListeners();
  }

  Future<void> purchaseAirtime(
      {String code, String amount, String phoneNumber}) async {
    print(code);
    setBusy(true);
    try {
      final purchase = await _helper.purchaseAirtime(
          code: code, amount: amount, phoneNumber: phoneNumber);
      if (purchase) {
        _success = purchase;
        _message = "Successful";
        setBusy(false);
      } else {
        _success = purchase;
        _message = "Check if the number is correct and Try again";
        setBusy(false);
      }
    } on Failure catch (f) {
      _setFailure(f);
    }
    setBusy(false);
    notifyListeners();
  }

  void onSelectedNetwork([Network selectedNetwork]) {
    _selectedNetwork = selectedNetwork;
    _selected = !_selected;
    notifyListeners();
  }
}
