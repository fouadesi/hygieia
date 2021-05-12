
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../widget.forgot.dart';
import '../widget.signup.dart';
class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email_controlleur ;
  TextEditingController password_controlleur ;
  double he = 0.00127 ;

  bool show_password = false ;
  @override

  void initState() {
    email_controlleur = TextEditingController();
    password_controlleur = TextEditingController();
    super.initState();
  }

  login(String email, String pass) async {
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
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),

            child: SingleChildScrollView(child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Text("Connexion",style: GoogleFonts.archivo(
                    fontSize: 35*height * 0.0015,color: Color.fromRGBO(1, 85, 156, 1),
                    fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(
                  height: height *0.04,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Adresse e-mail",
                      style: GoogleFonts.archivo(
                        fontWeight: FontWeight.w500,
                        fontSize: 13 * height * 0.0015,
                        color: Color.fromRGBO(00, 88, 243,1),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    TextFormField(
                        validator: (value) {
                          if (!RegExp('^[a-zA-Z][a-zA-Z]?.[a-zA-Z]*@esi-sba.dz').hasMatch(value) || value.isEmpty) {
                            return 'Entrer un mail valide';
                          }
                          return null;
                        },
                        controller: email_controlleur,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          errorStyle:   GoogleFonts.archivo(
                            fontSize: 10*height * 0.0015,
                            color: Colors.red,

                          ),
                          hintStyle: GoogleFonts.archivo(color: Color.fromRGBO(148, 148, 158, 0.6,),fontSize: 13),
                          prefixIcon: Icon(Icons.email_outlined,color: Color.fromRGBO(58, 122, 254, 1).withOpacity(0.7),size: 25,),
                          hintText: "Adresse e-mail",
                          contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          fillColor: Colors.white,
                          filled: true,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:  BorderSide(
                              color: Colors.white,

                              width: 0.0,
                            ),
                          ),
                          focusedErrorBorder:    OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:  BorderSide(
                              color: Colors.white,
                              width: 0.0,),),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:  BorderSide(
                              color: Colors.white,

                              width: 0.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:  BorderSide(
                              color: Colors.white,
                              width: 0.0,
                            ),
                          ),

                        )
                    ),
                  ],),
                SizedBox(
                  height: 8*height * 0.0015,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Mot de passe",
                      style: GoogleFonts.archivo(
                        fontWeight: FontWeight.w500,

                        fontSize: 13*height * 0.0015,
                        color: Color.fromRGBO(00, 88, 243,1),

                      ),

                    ),
                    SizedBox(
                      height: 2,
                    ),
                    TextFormField(

                        controller: password_controlleur,
                        validator: (value) {
                          if  (value.length < 8) {
                            return 'Entrer un mot de passe a 8 lettres au minimum';
                          }
                          return null;
                        },
                        onChanged: (value) {

                        },
                        obscureText: show_password,

                        decoration: InputDecoration(

                          errorStyle:   GoogleFonts.archivo(


                            fontSize: 10*height * 0.0015,
                            color: Colors.red,

                          ),

                          suffixIcon: show_password?  InkWell(
                              onTap: (){
                                setState(() {
                                  show_password = !show_password;
                                });},child: Icon(Icons.remove_red_eye_sharp,color: Color.fromRGBO(58, 122, 254, 1).withOpacity(0.8),size: 25,)) : InkWell(
                              onTap: (){
                                setState(() {
                                  show_password = !show_password;
                                });},child: Icon(Icons.remove_red_eye_outlined,color: Color.fromRGBO(58, 122, 254, 1).withOpacity(0.8),size: 25,)),
                          hintStyle: GoogleFonts.archivo(color: Color.fromRGBO(148, 148, 158, 0.6,),fontSize: 13),
                          prefixIcon: Icon(Icons.lock_outline,color: Color.fromRGBO(58, 122, 254, 1).withOpacity(0.8),size: 25,),
                          hintText: "Mot de passe",
                          contentPadding: new EdgeInsets.symmetric(vertical:  height *0.00011, horizontal: 10.0),
                          fillColor: Colors.white.withOpacity(0.95),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:  BorderSide(
                              color: Colors.white,

                              width: 0.0,
                            ),
                          ),
                          filled: true,
                          focusedErrorBorder:    OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:  BorderSide(
                              color: Colors.white,
                              width: 0.0,),),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:  BorderSide(
                              color: Colors.white,

                              width: 0.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:  BorderSide(
                              color: Colors.white,
                              width: 0.0,
                            ),
                          ),

                        )
                    ),
                  ],),
                SizedBox(
                  height: 4,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgot()))  ;
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text("Mot de passe oubliè ?",style :GoogleFonts.archivo(color: Color.fromRGBO(58, 122, 254, 0.9),fontSize: 12*height * 0.0015,

                      ),),
                    )),
                SizedBox(
                  height: 27.1*height * 0.0015,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 21,vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: Text("Se connecter",style: GoogleFonts.archivo(
                      color: Colors.white,
                      fontSize: 18*height * 0.0015
                  ),),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Processing Data')));
                           // calling the login function
                      login(email_controlleur.text , password_controlleur.text) ;
                    }
                    bool emailValid = RegExp('^[a-zA-Z][a-zA-Z]?.[a-zA-Z]*@esi-sba.dz').hasMatch("f.djellali@esi-sba.dz");
                    print(emailValid);
                  },color: Color.fromRGBO(8, 96, 160, 1),),
                SizedBox(
                  height: 12,
                ),
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                },
                    child: Text("Vous n'avez pas un compte ? S'inscrire",textAlign: TextAlign.center ,style :GoogleFonts.archivo(fontStyle: FontStyle.italic,color: Color.fromRGBO(58, 122, 254, 1),fontSize:height * 0.0013* 13.92,fontWeight: FontWeight.w500,))),
              ],
            ))));
  }
}
