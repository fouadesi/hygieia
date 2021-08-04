import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hygeia/users/view/auth/widget.login.dart';
import 'package:hygeia/users/view/drawer/widget.drawer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ChangePassword2 extends StatefulWidget {
  @override
  _ChangePassword2State createState() => _ChangePassword2State();
}

class _ChangePassword2State extends State<ChangePassword2> {
  TextEditingController OldPasswordController;
  TextEditingController NewPasswordController;
  TextEditingController NewPasswordConfirmController;
  GlobalKey<FormState> _formKey;
  @override
  void initState() {
    super.initState();
    OldPasswordController = new TextEditingController();
    NewPasswordController = new TextEditingController();
    _formKey = GlobalKey<FormState>();
    NewPasswordConfirmController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    TextEditingController emailControlleur;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3A7AFE),
        title: Text('Paramètres',
            style:
                GoogleFonts.inter(fontSize: 21, fontWeight: FontWeight.w500)),
        centerTitle: true,
        elevation: 20,
      ),
      drawer: NavigationDrawer('parametre'),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: height * 0.7,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(20.0),
                  bottomRight: const Radius.circular(20.0),
                )),
          ),
          Center(
            child: Container(
              height: height * 0.4,
              width: width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                border: Border.all(
                    color: Color.fromRGBO(112, 112, 112, 1), width: 0.1),
                color: Color.fromRGBO(249, 251, 251, 1),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(width * 0.08),
                child: Column(
                  children: [
                    Text(
                      "Changer mot de passe ",
                      style: GoogleFonts.inter(
                          color: Color.fromRGBO(1, 85, 156, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                    SizedBox(height: height * 0.012),
                    TextFormField(
                      style: GoogleFonts.poppins(
                        color: Color.fromRGBO(21, 32, 43, 0.7),
                        fontSize: 15,
                      ),
                      controller: emailControlleur,
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.poppins(
                          color: Color.fromRGBO(21, 32, 43, 0.7),
                          fontSize: 15,
                        ),
                        alignLabelWithHint: true,
                        hintText: "mot de passe actuel",
                        contentPadding: EdgeInsets.only(top: 22),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(61, 199, 201, 1)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(61, 199, 201, 1)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(61, 199, 201, 1)),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(61, 199, 201, 1)),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(61, 199, 201, 1)),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.02 * height),
                    TextFormField(
                      style: GoogleFonts.poppins(
                        color: Color.fromRGBO(21, 32, 43, 0.7),
                        fontSize: 15,
                      ),
                      controller: NewPasswordController,
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.poppins(
                          color: Color.fromRGBO(21, 32, 43, 0.7),
                          fontSize: 15,
                        ),
                        alignLabelWithHint: true,
                        hintText: "Nouveau mot de passe",
                        contentPadding: EdgeInsets.only(top: 22),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(61, 199, 201, 1)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(61, 199, 201, 1)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(61, 199, 201, 1)),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(61, 199, 201, 1)),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(61, 199, 201, 1)),
                        ),
                      ),
                    ),
                    TextFormField(
                      style: GoogleFonts.poppins(
                        color: Color.fromRGBO(21, 32, 43, 0.7),
                        fontSize: 15,
                      ),
                      controller: NewPasswordConfirmController,
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.poppins(
                          color: Color.fromRGBO(21, 32, 43, 0.7),
                          fontSize: 15,
                        ),
                        alignLabelWithHint: true,
                        hintText: "confirmer mot de passe",
                        contentPadding: EdgeInsets.only(top: 22),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(61, 199, 201, 1)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(61, 199, 201, 1)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(61, 199, 201, 1)),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(61, 199, 201, 1)),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(61, 199, 201, 1)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.035,
                    ),
                    CustomElevation(
                      height: 39,
                      child: FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0)),
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          color: Color.fromRGBO(1, 85, 156, 1),
                          onPressed: () async {
                            if (!RegExp(
                                    '^[a-zA-Z][a-zA-Z]?.[a-zA-Z]*@esi-sba.dz')
                                .hasMatch(emailControlleur.text)) {
                              showTopSnackBar(
                                context,
                                CustomSnackBar.error(
                                  textStyle: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                  message:
                                      "Veuillez entrer une adresse e-mail valide",
                                ),
                              );
                              return;
                            }
                          },
                          child: Text(
                            "changer",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
