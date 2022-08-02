// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;


class User{
  late String fname, lname,email,password,city,region,role;

  User(this.fname,this.lname,this.email,this.password,this.city,this.region,this.role);
 
  void add () async{

    //encoding data to json 
    var body= jsonEncode({"first_name":fname,
      "last_name":lname,
      "email":email,
      "password":password,
      "city":city,
      "region":region,
      "role":role});

      //loading the data to the body of the api
    var response= await http.post(Uri.http("127.0.0.1:3000", "api/user/auth/signup"),
      headers: {"Content-Type": "application/json"},
     body: body);

     //response of api
    var data= response.headers;
    int state= response.statusCode;
    print(data);
    print(state);
  }

}