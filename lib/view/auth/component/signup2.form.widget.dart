import 'package:flutter/material.dart';import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';import 'package:google_fonts/google_fonts.dart';import 'package:hygeia/controlleur/CreateAccount.dart';import 'package:hygeia/model/patient.dart';import 'package:hygeia/view/auth/widget.login.dart';class Signup2Form extends StatefulWidget {Patient patient ;Signup2Form(this.patient);  @override  _Signup2FormState createState() => _Signup2FormState();}class _Signup2FormState extends State<Signup2Form> {  TextEditingController num_controlleur ;  TextEditingController date_controlleur ;  TextEditingController sex_controlleur ;  TextEditingController role_controlleur ;  TextEditingController promo_controlleur ;  double he = 0.00127 ;  final _formKey = GlobalKey<FormState>();  bool show_password = false ;  @override  void initState() {    date_controlleur = TextEditingController();    sex_controlleur = TextEditingController();    role_controlleur = TextEditingController();    promo_controlleur = TextEditingController();    num_controlleur = TextEditingController();    super.initState();  }  List<String> items = ["Homme","Femme"];  List<String> roles= ["Enseignant","Etudiant","Ats"];  List<String> promotion = ["1CPI","2CPI","1CS","2CS","3CS"];  @override  Widget build(BuildContext context) {    double height = MediaQuery.of(context).size.height ;    double width = MediaQuery.of(context).size.width;    return Form(        key: _formKey,        child: Padding(            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),            child: SingleChildScrollView(                child: Column(                  children: [                    SizedBox(                      height: 22,                    ),                    Text("Inscription",style: GoogleFonts.archivo(                        fontSize: 35 * height * 0.0015,color: Color.fromRGBO(1, 85, 156, 1),                        fontWeight: FontWeight.bold                    ),                    ),                    SizedBox(                      height: height *0.03,                    ),                    Column(                      crossAxisAlignment: CrossAxisAlignment.start,                      children: [                        Padding(                            padding: EdgeInsets.only(left: width * 0.045),                            child: Text(                              "Numéro de téléphone :",                              style: GoogleFonts.archivo(                                fontStyle: FontStyle.italic,                                fontWeight: FontWeight.w500,                                fontSize: 13 * height * 0.0015,                                color: Color.fromRGBO(00, 88, 243,1),                              ),                            )),                        SizedBox(                          height: 2,                        ),                        TextFormField(                            validator: (value) {                              if (value.length == 10) {                                print(value);                                return null;                              } else {                                return "Vous devez entrer votre numéro de téléphone";                              }                            },                            maxLength: 10,                            keyboardType: TextInputType.phone,                            controller: num_controlleur,                            buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,                            onChanged: (value) {                            },                            decoration: InputDecoration(                              errorStyle:   GoogleFonts.archivo(                                fontSize: 10*height * 0.0015,                                color: Colors.red,                              ),                              hintStyle: GoogleFonts.archivo(color: Color.fromRGBO(148, 148, 158, 0.6,),fontSize: 13,fontStyle: FontStyle.italic),                              hintText: "Entrer votre numéro de tèlèphone",                              contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),                              fillColor: Colors.white,                              filled: true,                              errorBorder: OutlineInputBorder(                                borderRadius: BorderRadius.circular(30),                                borderSide:  BorderSide(                                  color: Colors.white,                                  width: 0.0,                                ),                              ),                              focusedErrorBorder:    OutlineInputBorder(                                borderRadius: BorderRadius.circular(30),                                borderSide:  BorderSide(                                  color: Colors.white,                                  width: 0.0,),),                              enabledBorder: OutlineInputBorder(                                borderRadius: BorderRadius.circular(30),                                borderSide:  BorderSide(                                  color: Colors.white,                                  width: 0.0,                                ),                              ),                              focusedBorder: OutlineInputBorder(                                borderRadius: BorderRadius.circular(30),                                borderSide:  BorderSide(                                  color: Colors.white,                                  width: 0.0,                                ),                              ),                            )                        ),                      ],),                    SizedBox(                      height: 8 * height * 0.0015,                    ),                    Column(                      crossAxisAlignment: CrossAxisAlignment.start,                      children: [                        Padding(                            padding: EdgeInsets.only(left: width * 0.045),                            child: Text(                              "Date de naissance :",                              style: GoogleFonts.archivo(                                fontStyle: FontStyle.italic,                                fontWeight: FontWeight.w500,                                fontSize: 13 * height * 0.0015,                                color: Color.fromRGBO(00, 88, 243,1),                              ),                            )),                        SizedBox(                          height: 2,                        ),                        TextFormField(                            onTap: () {                              DatePicker.showDatePicker(context,                                  showTitleActions: true,                                  minTime: DateTime(2000, 1, 1),                                  maxTime: DateTime(2019, 6, 7), onChanged: (date) {                                    print('change $date');                                  }, onConfirm: (date) {                                    date_controlleur.text = date.year.toString() + "/" + date.month.toString() + "/"+  date.day.toString();                                    print('confirm $date');                                  }, currentTime: DateTime.now(), locale: LocaleType.fr);                            },                            readOnly: true,                            validator: (value) {                              if(num_controlleur.text.length != 10) {                                return null;                              }                              if (value.isNotEmpty) {                                return null;                              }else {                                return "Vous devez entrer votre date de naissance";                              }                            },                            controller: date_controlleur,                            onChanged: (value) {                            },                            decoration: InputDecoration(                              errorStyle:   GoogleFonts.archivo(                                fontSize: 10*height * 0.0015,                                color: Colors.red,                              ),                              hintStyle: GoogleFonts.archivo(color: Color.fromRGBO(148, 148, 158, 0.6,),fontSize: 13,fontStyle: FontStyle.italic),                              hintText: "Entrer votre date de naissance",                              contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),                              fillColor: Colors.white,                              filled: true,                              errorBorder: OutlineInputBorder(                                borderRadius: BorderRadius.circular(30),                                borderSide:  BorderSide(                                  color: Colors.white,                                  width: 0.0,                                ),                              ),                              focusedErrorBorder:    OutlineInputBorder(                                borderRadius: BorderRadius.circular(30),                                borderSide:  BorderSide(                                  color: Colors.white,                                  width: 0.0,),),                              enabledBorder: OutlineInputBorder(                                borderRadius: BorderRadius.circular(30),                                borderSide:  BorderSide(                                  color: Colors.white,                                  width: 0.0,                                ),                              ),                              focusedBorder: OutlineInputBorder(                                borderRadius: BorderRadius.circular(30),                                borderSide:  BorderSide(                                  color: Colors.white,                                  width: 0.0,                                ),                              ),                            )                        ),                      ],),                    SizedBox(                      height: 8 * height * 0.0015,                    ),                    Column(                      crossAxisAlignment: CrossAxisAlignment.start,                      children: [                        Padding(                            padding: EdgeInsets.only(left: width * 0.045),                            child: Text(                              "Sexe :",                              style: GoogleFonts.archivo(                                fontStyle: FontStyle.italic,                                fontWeight: FontWeight.w500,                                fontSize: 13 * height * 0.0015,                                color: Color.fromRGBO(00, 88, 243,1),                              ),                            )),                        SizedBox(                          height: 2,                        ),                        TextFormField(                          controller: sex_controlleur,                          readOnly: true,                          validator: (value) {                            if(date_controlleur.text.isEmpty) {                              return null ;                            }                            if(value.isEmpty) {                              return "Vous devez choisir votre sex" ;                            }else {                              return null ;                            }                          },                          decoration: InputDecoration(                            errorStyle:   GoogleFonts.archivo(                              fontSize: 10*height * 0.0015,                              color: Colors.red,                            ),                            hintStyle: GoogleFonts.archivo(color: Color.fromRGBO(148, 148, 158, 0.6,),fontSize: 13,fontStyle: FontStyle.italic),                            hintText: "Entrer votre sexe",                            contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),                            fillColor: Colors.white,                            filled: true,                            errorBorder: OutlineInputBorder(                              borderRadius: BorderRadius.circular(30),                              borderSide:  BorderSide(                                color: Colors.white,                                width: 0.0,                              ),                            ),                            focusedErrorBorder:    OutlineInputBorder(                              borderRadius: BorderRadius.circular(30),                              borderSide:  BorderSide(                                color: Colors.white,                                width: 0.0,),),                            enabledBorder: OutlineInputBorder(                              borderRadius: BorderRadius.circular(30),                              borderSide:  BorderSide(                                color: Colors.white,                                width: 0.0,                              ),                            ),                            focusedBorder: OutlineInputBorder(                              borderRadius: BorderRadius.circular(30),                              borderSide:  BorderSide(                                color: Colors.white,                                width: 0.0,                              ),                            ),                            suffixIcon: PopupMenuButton<String>(                              icon:Icon(Icons.arrow_drop_down,color: Color.fromRGBO(58, 122, 254, 1).withOpacity(0.8)),                              onSelected: (String value) {                                sex_controlleur.text = value ;                              },                              itemBuilder: (BuildContext context) {                                return items                                    .map<PopupMenuItem<String>>((String value) {                                  return new PopupMenuItem(                                      child: new Text(value), value: value);                                }).toList();                              },                            ),                          ),                        ),                      ],),                    SizedBox(                      height: 8 * height * 0.0015,                    ),                    Column(                      crossAxisAlignment: CrossAxisAlignment.start,                      children: [                        Padding(                            padding: EdgeInsets.only(left: width * 0.045),                            child: Text(                              "Rôle :",                              style: GoogleFonts.archivo(                                fontStyle: FontStyle.italic,                                fontWeight: FontWeight.w500,                                fontSize: 13 * height * 0.0015,                                color: Color.fromRGBO(00, 88, 243,1),                              ),                            )),                        SizedBox(                          height: 2,                        ),                        TextFormField(                          controller: role_controlleur,                          readOnly: true,                          validator: (value) {                            if(sex_controlleur.text.isEmpty) {                              return null;                            }                            if(value.isEmpty) {                              return "Vous devez choisir votre Rôle" ;                            } else {                              return null ;                            }                          },                          decoration: InputDecoration(                            errorStyle:   GoogleFonts.archivo(                              fontSize: 10*height * 0.0015,                              color: Colors.red,                            ),                            hintStyle: GoogleFonts.archivo(color: Color.fromRGBO(148, 148, 158, 0.6,),fontSize: 13,fontStyle: FontStyle.italic),                            hintText: "Entrer votre Rôle",                            contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),                            fillColor: Colors.white,                            filled: true,                            errorBorder: OutlineInputBorder(                              borderRadius: BorderRadius.circular(30),                              borderSide:  BorderSide(                                color: Colors.white,                                width: 0.0,                              ),                            ),                            focusedErrorBorder:    OutlineInputBorder(                              borderRadius: BorderRadius.circular(30),                              borderSide:  BorderSide(                                color: Colors.white,                                width: 0.0,),),                            enabledBorder: OutlineInputBorder(                              borderRadius: BorderRadius.circular(30),                              borderSide:  BorderSide(                                color: Colors.white,                                width: 0.0,                              ),                            ),                            focusedBorder: OutlineInputBorder(                              borderRadius: BorderRadius.circular(30),                              borderSide:  BorderSide(                                color: Colors.white,                                width: 0.0,                              ),                            ),                            suffixIcon: PopupMenuButton<String>(                              icon:Icon(Icons.arrow_drop_down,color: Color.fromRGBO(58, 122, 254, 1).withOpacity(0.8)),                              onSelected: (String value) {                                role_controlleur.text = value ;                              },                              itemBuilder: (BuildContext context) {                                return roles                                    .map<PopupMenuItem<String>>((String value) {                                  return new PopupMenuItem(                                      child: new Text(value), value: value);                                }).toList();                              },                            ),                          ),                        ),                      ],),                    SizedBox(                      height: 8 * height * 0.0015,                    ),                    Column(                      crossAxisAlignment: CrossAxisAlignment.start,                      children: [                        Padding(                            padding: EdgeInsets.only(left: width * 0.045),                            child: Text(                              "Promotion :",                              style: GoogleFonts.archivo(                                fontStyle: FontStyle.italic,                                fontWeight: FontWeight.w500,                                fontSize: 13 * height * 0.0015,                                color: Color.fromRGBO(00, 88, 243,1),                              ),                            )),                        SizedBox(                          height: 2,                        ),                        TextFormField(                          controller: promo_controlleur,                          readOnly: true,                          validator: (value) {                            if(role_controlleur.text.isEmpty) {                              return null;                            }                            if(value.isEmpty) {                              return "Vous devez choisir votre Promotion" ;                            }else {                              return null ;                            }                          },                          decoration: InputDecoration(                            errorStyle:   GoogleFonts.archivo(                              fontSize: 10*height * 0.0015,                              color: Colors.red,                            ),                            hintStyle: GoogleFonts.archivo(color: Color.fromRGBO(148, 148, 158, 0.6,),fontSize: 13,fontStyle: FontStyle.italic),                            hintText: "Entrer votre promotion",                            contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),                            fillColor: Colors.white,                            filled: true,                            errorBorder: OutlineInputBorder(                              borderRadius: BorderRadius.circular(30),                              borderSide:  BorderSide(                                color: Colors.white,                                width: 0.0,                              ),                            ),                            focusedErrorBorder:    OutlineInputBorder(                              borderRadius: BorderRadius.circular(30),                              borderSide:  BorderSide(                                color: Colors.white,                                width: 0.0,),),                            enabledBorder: OutlineInputBorder(                              borderRadius: BorderRadius.circular(30),                              borderSide:  BorderSide(                                color: Colors.white,                                width: 0.0,                              ),                            ),                            focusedBorder: OutlineInputBorder(                              borderRadius: BorderRadius.circular(30),                              borderSide:  BorderSide(                                color: Colors.white,                                width: 0.0,                              ),                            ),                            suffixIcon: PopupMenuButton<String>(                              icon:Icon(Icons.arrow_drop_down,color: Color.fromRGBO(58, 122, 254, 1).withOpacity(0.8)),                              onSelected: (String value) {                                promo_controlleur.text = value ;                              },                              itemBuilder: (BuildContext context) {                                return promotion                                    .map<PopupMenuItem<String>>((String value) {                                  return new PopupMenuItem(                                      child: new Text(value), value: value);                                }).toList();                              },                            ),                          ),                        ),                      ],),                    SizedBox(                      height: 8 * height * 0.0015,                    ),                    SizedBox(                      height: 8 * height * 0.0015,                    ),                    InkWell(                      onTap: (){                    Navigator.pop(context);                      },                      child: Align(                          alignment: Alignment.centerLeft,                          child: Container(                            height: 35,                            width: 35,                            decoration: BoxDecoration(                                borderRadius: BorderRadius.circular(30),                                color: Color.fromRGBO(1, 85, 156, 1).withOpacity(0.8)                            ),                            child: Icon(Icons.arrow_back,color: Colors.white,size: 25,),                          )),                    ),                    SizedBox(                      height: 8 * height * 0.0033,                    ),                    RaisedButton(                      padding: EdgeInsets.symmetric(horizontal: 35,vertical: 12),                      shape: RoundedRectangleBorder(                          borderRadius: BorderRadius.circular(40)),                      child: Text("S'inscrire",style: GoogleFonts.archivo(                          color: Colors.white,                          fontSize: 18*height * 0.0015                      ),),                      onPressed: ()async  {                        if(_formKey.currentState.validate()) {                          Patient patient  = new Patient(                            name: widget.patient.name,                            lastname: widget.patient.lastname,                            email: widget.patient.email,                            password: widget.patient.password,                            role: role_controlleur.text,                            birthday: date_controlleur.text,                            promotion: promo_controlleur.text,                            sexe: sex_controlleur.text,                            phonenumber:  num_controlleur.text,                          );                          print(patient.toJson());                   dynamic result =  await  createAccount().createAccount_f(patient);                   print("wow");                   print(result.body);                if(result.statusCode == 404) {                     print("Ce compte existe déja");                     final snackBar = SnackBar(content: Text('Ce Compte existe dèja'));                     ScaffoldMessenger.of(context).showSnackBar(snackBar);                             }                          print("done");                        }else {                          print("mazal");                        }                      },color: Color.fromRGBO(8, 96, 160, 1),),                    SizedBox(                      height: 8 * height * 0.0022,                    ),                    InkWell(onTap: () {                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));                    },                        child: Text("Vous avez un compte ? Connexion",textAlign: TextAlign.center ,style :GoogleFonts.archivo(fontStyle: FontStyle.italic,color: Color.fromRGBO(58, 122, 254, 1),fontSize:height * 0.0013* 13.92,fontWeight: FontWeight.w500,))),                  ],                ))));  }}