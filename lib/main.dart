import 'package:HNG_Pay/ui/screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wallets Africa',
        home: LoginUI03()//Loader(),
    );
  }
}