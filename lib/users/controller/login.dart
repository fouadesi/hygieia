import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

login(String email, String pass, context) async {
  String url = "http://10.0.2.2:3000/users/patient/login";
  SharedPreferences.setMockInitialValues({});
  SharedPreferences sharedPrefrences = await SharedPreferences.getInstance();
  Map body = {"email": email, "password": pass};
  var jsonresponse;
  var res = await http.post(Uri.parse(url), body: body);
  if (res.statusCode == 200) {
    jsonresponse = jsonDecode(res.body);
    print('Response status ${res.statusCode}');
    print('Response body ${res.body}');
    if (jsonresponse != null) {
      sharedPrefrences.setString("token", jsonresponse['token']);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  Container(child: Text('Auth seccessful !'))),
          (Route<dynamic> route) => false);
    }
  }
}
