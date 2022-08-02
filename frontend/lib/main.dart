// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:frontend/Users/recycler/recycler.dart';
import 'package:frontend/Users/user/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

    Timer(const Duration(seconds:2),()async{
        final prefs = await SharedPreferences.getInstance();
        String? token =  prefs.getString("authToken");
        print(token);
        if(token==null){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
          }
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