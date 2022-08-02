
import 'package:flutter/material.dart';

class Recycle extends StatefulWidget {
  const Recycle({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RecycleState();
  }
}

class RecycleState extends State<Recycle> {
  
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recycle"),
      backgroundColor: const Color(0xFF5BB259),),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: const <Widget>[
                Text("Recycle")
              ])
        )
      )
    )
  );
  }

}