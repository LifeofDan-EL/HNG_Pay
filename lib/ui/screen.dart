import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginUI03 extends StatefulWidget {
  @override
  _LoginUI03State createState() => _LoginUI03State();
}

class _LoginUI03State extends State<LoginUI03> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.black
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: height * 0.2,
                  left: 50,
                  right:50,
                  child: FlutterLogo(
                      colors: Colors.lightGreen,
                      size: 100
                  ),
                ),
                Positioned(
                    top: height * 0.4,
                    child: Container(
                      width: width,
                      child: Text(
                          'Wallets.africa!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              fontWeight: FontWeight.w700
                          )
                      ),
                    )
                ),

                Positioned(
                  top: height * 0.5,
                  child: Container(
                    width: width * 0.8,
                    height: height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          style: TextStyle(
                              fontSize:16
                          ),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[700].withOpacity(0.5),
                            filled: true,
                            hintText: 'Number',
                            hintStyle: TextStyle(
                              color: Colors.grey[100],
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color:Colors.white,
                                    width: 2
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color:Colors.grey,
                                    width: 2
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color:Colors.white,
                                    width: 2
                                )
                            ),
                          ),
                        ),

                        SizedBox(height: 20,),
                        TextField(
                          style: TextStyle(
                              fontSize:16
                          ),
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[700].withOpacity(0.5),
                            filled: true,
                            hintText: 'Amount',
                            hintStyle: TextStyle(
                              color: Colors.grey[100],
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color:Colors.white,
                                    width: 2
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color:Colors.grey,
                                    width: 2
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color:Colors.white,
                                    width: 2
                                )
                            ),
                          ),
                        ),

                        SizedBox(height: 20,),
                        TextField(
                          style: TextStyle(
                              fontSize:16
                          ),
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[700].withOpacity(0.5),
                            filled: true,
                            hintText: 'Network Provider',
                            hintStyle: TextStyle(
                              color: Colors.grey[100],
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color:Colors.white,
                                    width: 2
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color:Colors.grey,
                                    width: 2
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color:Colors.white,
                                    width: 2
                                )
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),



                Positioned(
                    top: height * 0.9,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: width * 0.37,
                          height: height * 0.06,
                          child: RaisedButton(
                              splashColor: Colors.grey[200],
                              onPressed: (){},
                              color: Colors.transparent,
                              child: Text(
                                'ADD NUMBER',
                                style: TextStyle(
                                    color: Colors.grey[200],
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular((width *0.3) /2),
                                  side: BorderSide(
                                      color:Colors.grey,
                                      width: 2
                                  )
                              )

                          ),
                        ),
                        SizedBox(width:20),
                        Container(
                          width: width * 0.37,
                          height: height * 0.06,
                          child: RaisedButton(
                              onPressed: (){},
                              color: Colors.lightBlueAccent,
                              child: Text(
                                'PURCHASE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular((width *0.3) /2),
                                  side: BorderSide(
                                      color:Colors.white,
                                      width: 2
                                  )
                              )
                          ),
                        )

                      ],
                    )
                ),
              ],
            ),
          )
      ),
    );
  }
}