import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/Users/user/login.dart';


void main(){
  runApp(
  const MaterialApp(home: MainPage()
  )
  );
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Timer(const Duration(seconds:2),(){
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
         });  
    return const Scaffold(
      backgroundColor:Color(0xFF5BB259),
      body:Center(
        child: Image(
          image: AssetImage("assets/White_logo.png")
          ),
      ),
      
    );
  }
}