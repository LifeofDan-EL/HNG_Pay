import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class LoginUI03 extends StatefulWidget {
  @override
  _LoginUI03State createState() => _LoginUI03State();
}

class Network {
  int id;
  String name;
  String code;

  Network(this.id, this.name);
  Network.fromMap(Map<String, dynamic> data) {
    code = data['Code'];
    name = data['Name'];
  }
}

class _LoginUI03State extends State<LoginUI03> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<Network>> _dropdownMenuItems;
  Network _selectedNetwork;
  List<Network> _networks;

  var number;
  var amount;
  bool autovalidate = false;
  bool purchasing = false;
//  loadPurchase();

  @override
  void initState() {
    super.initState();
  }

  List<DropdownMenuItem<Network>> buildDropDownMenuItems(List networks) {
    List<DropdownMenuItem<Network>> items = List();
    for (Network network in networks) {
      items.add(
        DropdownMenuItem(
          value: network,
          child: Text(network.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Network selectedNetwork) {
    setState(() {
      _selectedNetwork = selectedNetwork;
    });
  }

  get spacing => SizedBox(height: 20);
  get spacingX2 => SizedBox(height: 20 * 2.0);
  get spacingX4 => SizedBox(height: 20 * 4.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: _networks != null && _networks.isNotEmpty
            ? _buildScreen()
            : FutureBuilder<List<Network>>(
            initialData: _networks,
            future: getAirtimeProviders(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _networks = snapshot.data;
                return _buildScreen();
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  _buildScreen() {
    _dropdownMenuItems = buildDropDownMenuItems(_networks);
    if (_selectedNetwork == null) {
      _selectedNetwork = _dropdownMenuItems[0].value;
    }
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              spacingX4,
              FlutterLogo(colors: Colors.lightGreen, size: 100),
              spacingX2,
              Text('Wallets.africa!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.w700)),
              spacingX2,
              TextFormField(
                autovalidate: autovalidate,
                onSaved: (value) {
                  number = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Phone number is required';
                  }

                  return null;
                },
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
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
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                ),
              ),
              spacing,
              TextFormField(
                autovalidate: autovalidate,
                onSaved: (value) {
                  amount = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Amount is required';
                  }

                  return null;
                },
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                keyboardType: TextInputType.number,
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
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                ),
              ),
              spacing,
              DropdownButton(
                dropdownColor: Colors.black,
                style: TextStyle(color: Colors.white),
                value: _selectedNetwork,
                items: _dropdownMenuItems,
                onChanged: onChangeDropdownItem,
              ),
              spacingX2,
              Text(
                'Network Provider is ${_selectedNetwork.name}',
                style: TextStyle(color: Colors.white),
              ),
              spacingX2,
              purchasing
                  ? Center(child: CircularProgressIndicator())
                  : RaisedButton(
                  onPressed: buyAirtime,
                  color: Colors.lightBlueAccent,
                  child: SizedBox(
                    height: 56,
                    child: Center(
                      child: Text(
                        'PURCHASE',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                      side: BorderSide(color: Colors.white, width: 2)))
//              Row(
//                children: <Widget>[
//                  Expanded(
//                    child: RaisedButton(
//                        splashColor: Colors.grey[200],
//                        onPressed: () {},
//                        color: Colors.transparent,
//                        child: SizedBox(
//                          height: 56,
//                          child: Center(
//                            child: Text(
//                              'ADD NUMBER',
//                              style: TextStyle(
//                                  color: Colors.grey[200],
//                                  fontWeight: FontWeight.w500),
//                            ),
//                          ),
//                        ),
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(28),
//                            side: BorderSide(color: Colors.grey, width: 2))),
//                  ),
//                  SizedBox(width: 20),
//                  Expanded(
//                    child: RaisedButton(
//                        onPressed: () {},
//                        color: Colors.lightBlueAccent,
//                        child: SizedBox(
//                          height: 56,
//                          child: Center(
//                            child: Text(
//                              'PURCHASE',
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontWeight: FontWeight.w500),
//                            ),
//                          ),
//                        ),
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(28),
//                            side: BorderSide(color: Colors.white, width: 2))),
//                  )
//                ],
//              ),
            ],
          ),
        ),
      ),
    );
  }

  static const baseUrl = 'https://sandbox.wallets.africa/bills/airtime';
  Future<List<Network>> getAirtimeProviders() async {
    try {
      var response = await http.post(
        baseUrl + '/providers',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer uvjqzm5xl6bw',
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        _networks =
            List<Network>.from(data['Providers'].map((x) => Network.fromMap(x)))
                .toList();
        return _networks;
      }

      throw Exception('error occurred');
    } catch (err) {
      print(err);
    }
  }

  Future buyAirtime() async {
    if (!_formKey.currentState.validate()) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('Please enter all fields')));

      if (autovalidate == false) {
        setState(() {
          autovalidate = true;
        });
      }
      return;
    }

    _formKey.currentState.save();
    setState(() {
      purchasing = true;
    });
    try {
      var response = await http.post(baseUrl + '/purchase',
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer uvjqzm5xl6bw',
          },
          body: json.encode({
            'Code': _selectedNetwork.code,
            'SecretKey': 'hfucj5jatq8h',
            'PhoneNumber': number,
            'Amount': amount,
          }));

      var data = json.decode(response.body);
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(data['Message'])));
    } catch (err) {
      _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text('Uknown error occured, please try again')));
      print(err);
    }
    setState(() {
      purchasing = false;
    });
  }
}