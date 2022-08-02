import 'package:flutter/material.dart';

late String password;

Widget passwordWidget=TextFormField(
      obscureText: true,
      obscuringCharacter: "*",
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Password...',
        border: OutlineInputBorder() ),
      validator: ( value) {
        if (value ==null) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: ( value) {
        password = value!;
      },
    );