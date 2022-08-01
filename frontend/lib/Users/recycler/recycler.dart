
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '';

class Recycler extends StatefulWidget {
  const Recycler({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RecyclerState();
  }
}

class RecyclerState extends State<Recycler> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static const IconData compost_outlined = IconData(0xf05ce, fontFamily: 'MaterialIcons');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        backgroundColor: const Color(0xFF5BB259),
        items:const [
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: "Home",),

        BottomNavigationBarItem(icon: Icon(Icons.paste_rounded),
        label: "Complain",
        ),

        BottomNavigationBarItem(icon: Icon(Icons.person),
        label: "Profile",),
        
      ],)
    );
  }
  

}
