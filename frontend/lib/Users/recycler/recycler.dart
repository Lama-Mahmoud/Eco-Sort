
import 'package:flutter/material.dart';
import 'package:frontend/Users/recycler/tabs/complain.dart';
import 'package:frontend/Users/recycler/tabs/me.dart';
import 'package:frontend/Users/recycler/tabs/recycle.dart';


class Recycler extends StatefulWidget {
  const Recycler({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RecyclerState();
  }
}

class RecyclerState extends State<Recycler> {

  final tabs=[
    const Center(child:Recycle()),
    const Center(child:Complain()),
    const Center(child: Profile())
  ];

  int _currentIndex=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30,
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
