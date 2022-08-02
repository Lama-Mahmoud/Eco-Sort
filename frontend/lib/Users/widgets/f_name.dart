
    import 'package:flutter/material.dart';
    late  String fname;

Widget fNameWidget= TextFormField(
      style: const TextStyle(color: Color(0xff999999)),
      decoration: const InputDecoration(
        labelText: 'First Name',
        hintText: 'First Name ....',
        border: OutlineInputBorder() ),
      validator: ( value) {
        if (value ==null) {
          return 'First Name is Required';
        }
        return null;
      },
      onSaved: ( value) {
        fname = value!;
      },
    );