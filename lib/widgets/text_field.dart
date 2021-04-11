import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textField({
  TextEditingController controller,
  String labelText,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Container(
      height: 55,
      child: TextFormField(
        // ignore: missing_return
        validator: (value) {
          if (value.isNotEmpty) return null;
          if (value.isEmpty) return "Field Cannot be Empty";
        },
        keyboardType: TextInputType.phone,
        cursorColor: Colors.black,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    ),
  );
}
