import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

login(String email, String pass, context) async {
  String url = "http://192.168.1.8:3000/users/patient/login";
  SharedPreferences.setMockInitialValues({});
  SharedPreferences sharedPrefrences = await SharedPreferences.getInstance();
  Map body = {"email": email, "password": pass};
  var jsonresponse;
  var res = await http.post(Uri.parse(url), body: body);

  jsonresponse = jsonDecode(res.body);
  print('Response status ${res.statusCode}');
  print('Response body ${res.body}');

  if (jsonresponse['token'] != null) {
    sharedPrefrences.setString("token", jsonresponse['token']);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                Container(child: Text('Auth seccessful !'),)),
            (Route<dynamic> route) => false);
  } else {
    
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
      content: Text('${jsonresponse['message']}', style: GoogleFonts.archivo(
        fontWeight: FontWeight.w500,
        color: Colors.red,

      ), ),
      backgroundColor:Colors.white.withOpacity(0.6),
    ));
  }
}
