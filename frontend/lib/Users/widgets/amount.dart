import 'package:flutter/material.dart';
late int amount;

  Widget buildAmount= TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Amount',
        hintText: 'Amount...',
        border: OutlineInputBorder() ),
      validator: ( value) {
        if (value ==null) {
          return 'Amount is Required';
        }

        return null;
      },
      onSaved: ( value) {
        amount=value! as int;
      },
    );
