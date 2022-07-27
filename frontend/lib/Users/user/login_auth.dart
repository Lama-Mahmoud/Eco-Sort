// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class Auth{
  late String email;
  late String password;
  late int state;

  Auth (this.email, this.password);

  void authenticate() async{
    var body= jsonEncode({'email':email,'password':password});
    print(body);
    var response= await http.post(Uri.http("127.0.0.1:3000", "api/user/auth/login"),
      headers: {"Content-Type": "application/json"},
     body: body);
    var data= response.headers;
    print(email);
    print(password);
    state= response.statusCode;
    print(data);
    print(state);
  }
}