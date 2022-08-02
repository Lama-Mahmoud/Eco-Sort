

import 'package:flutter/material.dart';

late String email;

Widget emailWidget=TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Email...',
        border: OutlineInputBorder() ),
      validator: ( value) {
        if (value ==null) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: ( value) {
        email = value!;
      },
    );