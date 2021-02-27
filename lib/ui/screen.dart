import 'package:HNG_Pay/vm/airtime_recharge_vm.dart';
import 'package:HNG_Pay/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider_architecture/provider_architecture.dart';

class LoginUI03 extends StatefulWidget {
  @override
  _LoginUI03State createState() => _LoginUI03State();
}

class _LoginUI03State extends State<LoginUI03> {
  get spacing => SizedBox(height: 20);
  get spacingX2 => SizedBox(height: 20 * 2.0);
  get spacingX4 => SizedBox(height: 20 * 4.0);

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<AirtimeRechargeViewModel>.withConsumer(
      onModelReady: (model) => model.networkProviders(),
      builder: (context, model, _) => Scaffold(
        key: model.scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Buy Airtime",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: model.busy
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.black),
                ),
              )
            : Form(
                key: model.formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 60,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: model.networks.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    model.onSelectedNetwork(
                                      model.networks[index],
                                    );
                                  },
                                  child: Card(
                                    // color: model.selected
                                    //     ? Colors.black
                                    //     : Colors.white,
                                    child: Container(
                                      height: 40,
                                      width: 60,
                                      child: Center(
                                        child: Text(
                                          model.networks[index].name,
                                          // style: TextStyle(
                                          //     color: model.selected
                                          //         ? Colors.white
                                          //         : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    textField(
                        controller: phoneNumber, labelText: "Phone Number"),
                    SizedBox(
                      height: 20,
                    ),
                    textField(controller: amount, labelText: "Amount"),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (model.selected) {
                              if (model.formKey.currentState.validate()) {
                                await model.purchaseAirtime(
                                  phoneNumber: phoneNumber.text,
                                  amount: amount.text,
                                  code: model.selectedNetwork.code,
                                );
                                if (model.failure != null) {
                                  // ignore: deprecated_member_use
                                  model.scaffoldKey.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text(model.failure.message),
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                } else {
                                  // ignore: deprecated_member_use
                                  model.scaffoldKey.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text(model.message),
                                      backgroundColor: Colors.greenAccent,
                                    ),
                                  );
                                }
                              }
                              phoneNumber.clear();
                              amount.clear();
                              model.onSelectedNetwork();
                            } else {
                              // ignore: deprecated_member_use
                              model.scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text("Select a Provider"),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Container(
                              height: 55,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: model.busy
                                    ? CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white),
                                      )
                                    : Text(
                                        "Purchase",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
      ),
      viewModelBuilder: () => AirtimeRechargeViewModel(),
    );
  }
}
