// ignore_for_file: avoid_print

import 'package:frontend/Users/user/Role.dart';
import 'package:frontend/Users/user/login.dart';

import 'package:flutter/material.dart';
import 'package:frontend/Users/widgets/city.dart';
import 'package:frontend/Users/widgets/email.dart';
import 'package:frontend/Users/widgets/f_name.dart';
import 'package:frontend/Users/widgets/l_name.dart';
import 'package:frontend/Users/widgets/password.dart';
import 'package:frontend/Users/widgets/region.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SignupState();
  }
}

class SignupState extends State<Signup> {

  Widget _buildFname() {
    return fNameWidget;
  }

  Widget _buildLname() {
    return lNameWidget;
  }

// Email textfield
  Widget _buildEmail() {
    return emailWidget;
  }

// Password textfield
  Widget _buildPassword() {
    return passwordWidget;
  }

// city textfield
  Widget _buildCity() {
    return cityWidget;
  }


  Widget _buildRegion(){
    return region;
  }

  

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

//sign up form

                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child:_buildFname(),),//first name

                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child:_buildLname(),),// last name
                  
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child:_buildEmail(),),// email

                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child:_buildPassword()),// password (it is hashed in the backend)

                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child:_buildRegion(),),//Region dropdown List

                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child:_buildCity(),), // city or village


                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child:FractionallySizedBox(
                  widthFactor: 1,
                  child: TextButton(
                  child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Sign up",
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 20,
                    ),),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF5BB259),
                    primary: const Color(0xFFFEFEFE),
                  ),onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    _formKey.currentState!.save();
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.clear();
                    await prefs.setString('email', email);
                    await prefs.setString('l_name', lname);
                    await prefs.setString('f_name', fname);
                    await prefs.setString('city', city);
                    await prefs.setString('region', regionchoice);
                    await prefs.setString('password', password);
                    print(email);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Role()));
                    
                  },
                )
                ),),
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