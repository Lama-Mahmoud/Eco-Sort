import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(home: MainPage(),
));

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
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