// ignore_for_file: avoid_print

import 'package:frontend/Users/user/Role.dart';
import 'package:frontend/Users/user/login.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  late String email;
  late String _password;
  late String _region;
  late String _city;

  Widget _buildFname() {
    return TextFormField(
      style: const TextStyle(color: Color(0xff999999)),
      decoration: const InputDecoration(
        labelText: 'First Name',
        hintText: 'First Name ....',
        border: OutlineInputBorder() ),
      validator: ( value) {
        if (value ==null) {
          return 'First Name is Required';
        }
        return null;
      },
      onSaved: ( value) {
        _fname = value!;
      },
    );
  }



  Widget _buildLname() {
    return TextFormField(
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
        _lname = value!;
      },
    );
  }



// Email textfield
  Widget _buildEmail() {
    return TextFormField(
      style: const TextStyle(color: Color(0xff999999)),
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Email...',
        border: OutlineInputBorder() ),
      validator: ( value) {
        if (value ==null) {
          return 'Email is Required';
        }
      // Email validation
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
  }

// Password textfield
  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      obscuringCharacter: "*",
      decoration: const InputDecoration(
        labelText: 'Password',
        hintText: 'Password...',
        border: OutlineInputBorder() ),
       //password validation 
      validator: ( value) {
        if (value ==null) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: ( value) {
        _password = value!;
      },
    );
  }

// city textfield
  Widget _buildCity() {
    return TextFormField(
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
        _city = value!;
      },
    );
  }


  Widget _buildRegion(){
    List <String> items=['South', 'North', 'Beirut', 'Mont Lebanon','Nabatieh','Beqaa'];
    String? selectedItem="Beirut";
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF999999) ,width: 1))
      ),
      value: selectedItem,
      items: items
        .map((item) => DropdownMenuItem(
          value: item,
          child: Text(item),)
          ).toList(),
          onChanged:(item) =>setState(() {
            selectedItem=item;
            print(selectedItem);
          }) ,
          onSaved: (value){
            _region=value!;          },
        );
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
                    print(_city);
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.clear();
                    await prefs.setString('email', email);
                    await prefs.setString('l_name', _lname);
                    await prefs.setString('f_name', _fname);
                    await prefs.setString('city', _city);
                    await prefs.setString('region', _region);
                    await prefs.setString('password', _password);
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