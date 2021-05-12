import 'package:flutter/material.dart';
import 'package:hygeia/slides/views/component/widget.page1.dart';
import 'package:hygeia/users/users/auth/widget.login.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // "hot reload" (press "r" in the console where you ran "flutter run",
        primarySwatch: Colors.blue,

      ),
      debugShowCheckedModeBanner: false,
      home:  Page1(),
    );
  }
}
