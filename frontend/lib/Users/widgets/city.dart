import 'package:flutter/material.dart';

late String city;

Widget cityWidget=TextFormField(
      decoration: const InputDecoration(
        labelText: 'City',
        hintText: 'City...',
        border: OutlineInputBorder() ),
       //password validation 
      validator: ( value) {
        if (value ==null) {
          return 'City is Required';
        }

        return null;
      },
      onSaved: ( value) {
        city = value!;
      },
    );