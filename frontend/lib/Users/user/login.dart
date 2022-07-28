// ignore_for_file: avoid_print
import 'package:frontend/Users/user/signup.dart';

import 'login_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  late String _email;
  late String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return TextFormField(
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
        _email = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
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
        _password = value!;
      },
    );
  }


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
                 const Image(
                  width: 200,
                  height: 200,
                  image: AssetImage("assets/Lama_Mahmoud_Eco_Sort.png")
                  ),
                _buildEmail(),
                const SizedBox(height:30),
                _buildPassword(),
                const SizedBox(height: 45),
                
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: TextButton(
                  child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text("Login",
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 25,),),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF5BB259),
                    primary: const Color(0xFFFEFEFE),
                  ),onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    _formKey.currentState!.save();

                    print(_email);
                    print(_password);
                    Auth user=Auth(_email,_password);
                    user.authenticate();
                  },
                )
                ),
                const SizedBox(height:10),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Don't have an account?"),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: const Color(0xFF5BB259),
                      ),
                      onPressed: ()=>{
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Signup()))
                        
                      }, 
                    child: const Text("Create One")
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