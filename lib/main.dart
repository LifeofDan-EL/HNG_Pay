import 'package:HNG_Pay/ui/screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Templates',
        home: LoginUI03()//Loader(),
    );
  }
}
//Map<int, Color> color ={
//  50:Color.fromRGBO(136,14,79, .1),
//  100:Color.fromRGBO(136,14,79, .2),
//  200:Color.fromRGBO(136,14,79, .3),
//  300:Color.fromRGBO(136,14,79, .4),
//  400:Color.fromRGBO(136,14,79, .5),
//  500:Color.fromRGBO(136,14,79, .6),
//  600:Color.fromRGBO(136,14,79, .7),
//  700:Color.fromRGBO(136,14,79, .8),
//  800:Color.fromRGBO(136,14,79, .9),
//  900:Color.fromRGBO(136,14,79, 1),
//};
//
//MaterialColor colorCustom = MaterialColor(45444890, color);
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Welcome to Flutter',
//      theme: ThemeData(
//        primarySwatch: colorCustom,
//      ),
//
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Welcome to Flutter'),
//        ),
//        body: ListView(
//          children: <Widget>[
//          Padding(
//            padding: const EdgeInsets.only(top: 20),
//            child: Center(child: Text("Purchase Airtime",
//              style: TextStyle (
//                fontSize: 20,
//                color: Colors.purple,
//                fontWeight: FontWeight.bold
//              )
//              ,)
//            ),
//          ),
//            Padding(
//              padding: const EdgeInsets.only(top: 20, left: 20),
//              child: Align(
//                alignment: Alignment.centerLeft,
//                child: Container(
//                  child: Text(
//                    "Input Number",
//                      style: TextStyle (
//                          fontSize: 20,
//                          color: Colors.purple,
//                          fontWeight: FontWeight.bold
//                      )
//                  ),
//                ),
//              ),
//            ),
//          TextField(
//            decoration: InputDecoration(
//              hintText: "0812345678",
//              border: UnderlineInputBorder(
//                borderSide: BorderSide(
//                  color: Colors.red
//                )
//              )
//            ),
//          )
//          ],
//        )
//      ),
//    );
//  }
//}