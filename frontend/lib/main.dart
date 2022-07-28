import 'dart:async';

import 'package:flutter/material.dart';
import 'package:frontend/Users/user/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main(){
  runApp(
  const MaterialApp(home: MainPage()
  )
  );
}

class MainPage extends StatelessWidget {

  void next (BuildContext context)async{
    
    final prefs = await SharedPreferences.getInstance();
    String? token =  prefs.getString("authToken");
    if(token==null){
      Timer(const Duration(seconds:2),(){
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
         });
    }
    else {
      String? role =  prefs.getString("role");
      if(role=="Farmer"){
        
      }
      if(role=="Admin"){
        
      }
      if(role=="Recycler"){
        
      }
    }

  }

  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    next(context);
        
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