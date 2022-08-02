 import 'package:flutter/material.dart';

 late String lname;

Widget lNameWidget =TextFormField(
      style: const TextStyle(color: Color(0xff999999)),
      decoration: const InputDecoration(
        labelText: 'Last Name ',
        hintText: 'Last Name...',
        border: OutlineInputBorder() ),
      validator: ( value) {
        if (value ==null) {
          return 'LAst Name is Required';
        }
        return null;
      },
      onSaved: ( value) {
        lname = value!;
      },
    );