import 'package:flutter/material.dart';

import 'package:hygeia/slides/views/widget.slide.dart';


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
      home:  OnboardingScreen(),

    );
  }
}
