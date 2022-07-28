// ignore_for_file: unnecessary_const, avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:frontend/Users/user/signup_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              children:  <Widget>[
                const SizedBox(height:90),
                const Text("Are You?",
                style: TextStyle(
                    color: Color(0xFF999999), 
                    fontSize: 25,)
                ),

                
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child:FractionallySizedBox(
                  widthFactor: 1,
                  child: TextButton(
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                      child: Text("Farmer",
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 20,
                        ),),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF5BB259),
                          primary: const Color(0xFFFEFEFE),
                        ),
                  onPressed: () async {
                    final prefs =  await SharedPreferences.getInstance();
                    String? email=prefs.getString('email');
                    String? lName=prefs.getString('l_name');
                    String? fName=prefs.getString('f_name');
                    String? city=prefs.getString('city');
                    String? region=prefs.getString('region');
                    String? password=prefs.getString('password');
                    
                    User user=User(
                      fName.toString(),
                      lName.toString(),
                      email.toString(),
                      password.toString(),
                      city.toString(),
                      region.toString(),
                      "Recycler");
                      user.add();
                  },
                ),
                  )
                  ),
                  

                
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child:FractionallySizedBox(
                  widthFactor: 1,
                  child: TextButton(
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                      child: Text("Recycler",
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 20,
                        ),),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF5BB259),
                          primary: const Color(0xFFFEFEFE),
                        ),
                  onPressed: () async {
                    final prefs =  await SharedPreferences.getInstance();
                    String? email=prefs.getString('email');
                    String? lName=prefs.getString('l_nmae');
                    String? fName=prefs.getString('f_name');
                    String? city=prefs.getString('city');
                    String? region=prefs.getString('region');
                    String? password=prefs.getString('password');
                    
                    User user=User(
                      lName.toString(),
                      fName.toString(),
                      email.toString(),
                      password.toString(),
                      city.toString(),
                      region.toString(),
                      "Recycler");
                      user.add();
                  },
                ),
                  )
                  )

              ]
            )
          )
        )
      )
    );
  }
}
