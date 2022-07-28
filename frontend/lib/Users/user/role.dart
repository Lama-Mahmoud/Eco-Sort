

import 'package:flutter/material.dart';

class Role extends StatefulWidget {
  const Role({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RoleState();
  }
}


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class RoleState extends State<Role> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                SizedBox(height:20),
                Text("Are YOu?",
                style: TextStyle(
                    color: Color(0xFF999999), 
                    fontSize: 25,)
                ),])))));
  }}