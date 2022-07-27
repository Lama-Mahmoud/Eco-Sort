// ignore_for_file: avoid_print
import 'package:frontend/Users/user/login.dart';

import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SignupState();
  }
}

class SignupState extends State<Signup> {
  late String _fname;
  late String _lname;
  late String _email;
  late String _password;
  late String _region;
  late String _city;
  late String _dob;
  late String _gender;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              children: <Widget>[
                const SizedBox(height:20),
                const Text("Register",
                style: TextStyle(
                    color: Color(0xFF999999), 
                    fontSize: 25,)
                ),
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: TextButton(
                  child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text("Sign up",
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 25,),),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF5BB259),
                    primary: const Color(0xFFFEFEFE),
                  ),onPressed: () {
                    
                  },
                )
                ),
                const SizedBox(height:10),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?",
                      style:TextStyle(
                        color: Color(0xFF999999),)
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: const Color(0xFF5BB259),
                      ),
                      onPressed: ()=>{
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()))}, 
                    child: const Text("Log in")
                    )
                  ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}