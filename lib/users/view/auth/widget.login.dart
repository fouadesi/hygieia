import 'package:flutter/material.dart';import 'package:flutter_svg/flutter_svg.dart';import 'package:google_fonts/google_fonts.dart';import 'package:keyboard_visibility/keyboard_visibility.dart';import 'component/login.form.widget.dart';class Login extends StatefulWidget {  @override  _LoginState createState() => _LoginState();}class _LoginState extends State<Login> {  double he = 0.00127 ;  @override  @override  Widget build(BuildContext context) {    double height = MediaQuery.of(context).size.height;    double width = MediaQuery.of(context).size.width ;    print(height);    print(width);    return Scaffold(      body : Stack (          children:[           Container(              decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("assets/images/bg.png"), fit: BoxFit.fitWidth)),            ),           Container(      child: SingleChildScrollView(child: Padding(      padding: EdgeInsets.symmetric(horizontal: width*0.1),        child: Container(            color: Colors.transparent,            child: Column(      children: [        SizedBox(height: 201 * height * he ,),        Container(          height: height *0.55,          width: width - (28.2 *2),          decoration: BoxDecoration(            color: Colors.white.withOpacity(0.60),            borderRadius: BorderRadius.circular(50),),          child: LoginForm(),        ),      ],    ))))/* add child content here */,    ),          ],      ),    );  }}