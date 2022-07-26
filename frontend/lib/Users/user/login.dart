import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  void hello() { 
    return;
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
          children:  [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child:   Image(
                width: 200.0,
                height: 150.0,
                image: AssetImage("assets/Lama_Mahmoud_Eco_Sort.png"))
                ),

                //Email
            const Padding(
              padding: EdgeInsets.all(25.0),
              child:TextField(
                decoration: InputDecoration(  
                  border: OutlineInputBorder()  ,
                  labelText: 'Email',  
                  hintText: 'Email...'  
                ),  
              )
                ),

                //password
            const Padding(
              padding: EdgeInsets.all(25.0),
              child:TextField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      hintText: "Enter password",
                  border: OutlineInputBorder() 
                  ),
                ),  
              ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child:FractionallySizedBox(
                widthFactor: 1.0,
              child: TextButton(
              child: const Padding(
              padding: EdgeInsets.all(5.0),
                child: Text("Login",
                style: TextStyle(color: Colors.white, fontSize: 25,),),
                
                ),
                // ignore: avoid_print
                onPressed: ()=>print("hello world"),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF5BB259),
                  primary: const Color(0xFFFEFEFE),
                )
                )
              )
              )
          ],
        ),
    );
  }
}