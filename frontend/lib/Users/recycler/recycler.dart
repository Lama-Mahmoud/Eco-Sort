
import 'dart:html';

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

  final tabs=[
    Center(child:Recycle()),
    Center(child:Complain()),
    Center(Me())
  ];

  int _currentIndex=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 35,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        backgroundColor: const Color(0xFF5BB259),
        items:const [
        BottomNavigationBarItem(icon: Icon(Icons.yard),
        label: "Home",),

        BottomNavigationBarItem(icon: Icon(Icons.feed_outlined),
        label: "Complain",
        ),

        BottomNavigationBarItem(icon: Icon(Icons.person),
        label: "Profile",),
        
      ],
      onTap: (index){
        setState(() {
          _currentIndex=index;
        });
      },
      )
    );
  }
  

}
