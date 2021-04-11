import 'package:HNG_Pay/locator.dart';
import 'package:HNG_Pay/ui/screen.dart';
import 'package:HNG_Pay/vm/airtime_recharge_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AirtimeRechargeViewModel(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Wallets Africa',
          home: LoginUI03() //Loader(),
          ),
    );
  }
}
