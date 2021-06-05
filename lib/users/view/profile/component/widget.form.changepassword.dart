import 'dart:convert';import 'package:flutter/material.dart';import 'package:google_fonts/google_fonts.dart';import 'package:shared_preferences/shared_preferences.dart';import 'package:http/http.dart' as http ;class ChangePasswordForm extends StatefulWidget {  const ChangePasswordForm({Key key}) : super(key: key);  @override  _ChangePasswordFormState createState() => _ChangePasswordFormState();}class _ChangePasswordFormState extends State<ChangePasswordForm> {  TextEditingController OldPasswordController;  TextEditingController NewPasswordController;  TextEditingController NewPasswordConfirmController;  GlobalKey<FormState> _formKey  ;  @override  void initState() {    OldPasswordController=new TextEditingController();    NewPasswordController=new TextEditingController();    _formKey =  GlobalKey<FormState>();    NewPasswordConfirmController=new TextEditingController();    super.initState();  }  @override  Widget build(BuildContext context) {    double height=MediaQuery.of(context).size.height;    double width=MediaQuery.of(context).size.width;    return Center(      child: Container(        height: height *0.56,        width: width - (28.2 *2),        decoration: BoxDecoration(          borderRadius: BorderRadius.circular(50),          color: Colors.white.withOpacity(0.6),        ),        child: Padding(          padding:  EdgeInsets.symmetric(horizontal:20,vertical: 2 ),          child: Form(            key: _formKey,            child: Column(              mainAxisAlignment: MainAxisAlignment.center,              children: [  SizedBox(                height: height*0.020,              ),              Text("Changer votre mot de passe",style: GoogleFonts.archivo(              fontSize: 25*height * 0.0015,color: Color.fromRGBO(1, 85, 156, 1),              fontWeight: FontWeight.bold,            ),              textAlign:TextAlign.center,),                SizedBox(                  height: height*0.020,                ),                Align(                    alignment: Alignment.topLeft,                    child: Padding(                        padding: EdgeInsets.only(left: width * 0.040),                        child: Text(                          "Mot de passe du moment :",                          style: GoogleFonts.archivo(                            fontStyle: FontStyle.italic,                            fontWeight: FontWeight.w500,                            fontSize: 11 * height * 0.0015,                            color: Color.fromRGBO(00, 88, 243,1),                          ),                        ))),                SizedBox(                  height: 4,                ),                TextFormField(                  decoration: InputDecoration(                    errorStyle:   GoogleFonts.archivo(                      fontSize: 10*height * 0.0015,                      color: Colors.red,                    ),                    hintStyle: GoogleFonts.archivo(color: Color.fromRGBO(148, 148, 158, 0.6,),fontSize: 13,fontStyle: FontStyle.italic),                    hintText: "Entrer votre ancien mot de passe",                    contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),                    fillColor: Colors.white,                    filled: true,                    errorBorder: OutlineInputBorder(                      borderRadius: BorderRadius.circular(30),                      borderSide:  BorderSide(                        color: Colors.white,                        width: 0.0,                      ),                    ),                    focusedErrorBorder:    OutlineInputBorder(                      borderRadius: BorderRadius.circular(30),                      borderSide:  BorderSide(                        color: Colors.white,                        width: 0.0,),),                    enabledBorder: OutlineInputBorder(                      borderRadius: BorderRadius.circular(30),                      borderSide:  BorderSide(                        color: Colors.white,                        width: 0.0,                      ),                    ),                    focusedBorder: OutlineInputBorder(                      borderRadius: BorderRadius.circular(30),                      borderSide:  BorderSide(                        color: Colors.white,                        width: 0.0,                      ),                    ),                  ),                  controller: OldPasswordController,                  validator: (value){                    if(value.length>=8){                      return null;                    } else return "vous devez entrez votre mot de passe";                  },                ),                SizedBox(                 height: height*0.025,                ),                Align(                alignment: Alignment.topLeft,                    child: Padding(                    padding: EdgeInsets.only(left: width * 0.040),                    child: Text(                      "Nouveau mot de passe :",                      style: GoogleFonts.archivo(                        fontStyle: FontStyle.italic,                        fontWeight: FontWeight.w500,                        fontSize: 11 * height * 0.0015,                        color: Color.fromRGBO(00, 88, 243,1),                      ),                    ))),                SizedBox(                  height: 4,                ),                TextFormField(                  decoration: InputDecoration(                    errorStyle:   GoogleFonts.archivo(                      fontSize: 10*height * 0.0015,                      color: Colors.red,                    ),                    hintStyle: GoogleFonts.archivo(color: Color.fromRGBO(148, 148, 158, 0.6,),fontSize: 13,fontStyle: FontStyle.italic),                    hintText: "Entrer votre nouveau mot de passe",                    contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),                    fillColor: Colors.white,                    filled: true,                    errorBorder: OutlineInputBorder(                      borderRadius: BorderRadius.circular(30),                      borderSide:  BorderSide(                        color: Colors.white,                        width: 0.0,                      ),                    ),                    focusedErrorBorder:    OutlineInputBorder(                      borderRadius: BorderRadius.circular(30),                      borderSide:  BorderSide(                        color: Colors.white,                        width: 0.0,),),                    enabledBorder: OutlineInputBorder(                      borderRadius: BorderRadius.circular(30),                      borderSide:  BorderSide(                        color: Colors.white,                        width: 0.0,                      ),                    ),                    focusedBorder: OutlineInputBorder(                      borderRadius: BorderRadius.circular(30),                      borderSide:  BorderSide(                        color: Colors.white,                        width: 0.0,                      ),                    ),                  ),                  controller: NewPasswordController,                  validator: (value){                    if( OldPasswordController.text.length < 8) {                      return null;                    }                    if(value.length >=8){                      return null;                    } else return "Entrer votre nouveau mot de passe";                  },                ),                SizedBox(                  height: height*0.020,                ),                Align(                    alignment: Alignment.topLeft,                    child: Padding(                        padding: EdgeInsets.only(left: width * 0.040),                        child: Text(                          "Confirmer nouveau mot de passe :",                          style: GoogleFonts.archivo(                            fontStyle: FontStyle.italic,                            fontWeight: FontWeight.w500,                            fontSize: 11 * height * 0.0015,                            color: Color.fromRGBO(00, 88, 243,1),                          ),                        ))),                SizedBox(                  height: 4,                ),                TextFormField(                  decoration: InputDecoration(                    errorStyle:   GoogleFonts.archivo(                      fontSize: 10*height * 0.0015,                      color: Colors.red,                    ),                    hintStyle: GoogleFonts.archivo(color: Color.fromRGBO(148, 148, 158, 0.6,),fontSize: 13,fontStyle: FontStyle.italic),                    hintText: "Confirmer votre nouveau mot de passe",                    contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),                    fillColor: Colors.white,                    filled: true,                    errorBorder: OutlineInputBorder(                      borderRadius: BorderRadius.circular(30),                      borderSide:  BorderSide(                        color: Colors.white,                        width: 0.0,                      ),                    ),                    focusedErrorBorder:    OutlineInputBorder(                      borderRadius: BorderRadius.circular(30),                      borderSide:  BorderSide(                        color: Colors.white,                        width: 0.0,),),                    enabledBorder: OutlineInputBorder(                      borderRadius: BorderRadius.circular(30),                      borderSide:  BorderSide(                        color: Colors.white,                        width: 0.0,                      ),                    ),                    focusedBorder: OutlineInputBorder(                      borderRadius: BorderRadius.circular(30),                      borderSide:  BorderSide(                        color: Colors.white,                        width: 0.0,                      ),                    ),                  ),                  controller: NewPasswordConfirmController,                  validator: (value){                if(NewPasswordController.text.length < 8) {                  return null ;                }                    if(value == NewPasswordController.text)                       return null;                    else                    return  "Entrer le méme mot de passe";                  },                ),                SizedBox(                  height: height*0.025,                ),                RaisedButton(                  padding: EdgeInsets.symmetric(horizontal: 35,vertical: 12),                  shape: RoundedRectangleBorder(                      borderRadius: BorderRadius.circular(40)),                  child: Text("Changer",style: GoogleFonts.archivo(                      color: Colors.white,                      fontSize: 18*height * 0.0015                  ),),                  onPressed: ()async  {                    if(_formKey.currentState.validate()) {                      String url = "http://192.168.43.189:3000/users/changepassword";                      Map body = {                        "password": OldPasswordController.text,                        "password2": NewPasswordController.text,                      };                      var res = await http.post(Uri.parse(url), body: body);                     var  jsonresponse = jsonDecode(res.body);                     print(jsonresponse);                     if(jsonresponse["message"] =="success") {                       ScaffoldMessenger.of(context)                           .showSnackBar(SnackBar(content: Text('Mot de passe changé avec succées')));                     }else {                       if(jsonresponse["error"]=="invalid old password") {                         ScaffoldMessenger.of(context)                             .showSnackBar(SnackBar(content: Text('Mot de passe incorrect')));                       }else {                         ScaffoldMessenger.of(context)                             .showSnackBar(SnackBar(content: Text('Erreur vous devez réessayer')));                       }                     }                    }else {                    }                  },color: Color.fromRGBO(8, 96, 160, 1),),              ],            ),          ),        ),      ),    );  }}