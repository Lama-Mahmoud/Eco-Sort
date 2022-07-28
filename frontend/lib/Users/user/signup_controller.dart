// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;


class User{
  late String fname, lname,email,password,city,region,role;

  User(this.fname,this.lname,this.email,this.password,this.city,this.region,this.role);
 
  void add () async{
    var body= jsonEncode({"first_name":fname,
    "last_name":lname,
    "email":email,
    "password":password,
    "city":city,
    "region":region,
    "role":role});
    var response= await http.post(Uri.http("127.0.0.1:3000", "api/user/auth/signup"),
      headers: {"Content-Type": "application/json"},
     body: body);
    var data= response.headers;
    print(email);
    print(password);
    int state= response.statusCode;
    print(data);
    print(state);
  }

}