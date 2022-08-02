// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

List <String> items=['South', 'North', 'Beirut', 'Mont Lebanon','Nabatieh','Beqaa'];
String? selectedItem="Beirut";
late String regionchoice;

Widget region= DropdownButtonFormField<String>(
  decoration: const InputDecoration(
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF999999) ,width: 1))
    ),
    value: selectedItem,
    items: items
      .map((item) => DropdownMenuItem(
          value: item,
          child: Text(item),)
          ).toList(),
          onChanged:(item) =>(() {
            selectedItem=item;
            print(selectedItem);
          }) ,
          onSaved: (value){
            regionchoice=value!;          
            },
        );