import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hygeia/users/controller/PatientProvider.dart';
import 'package:hygeia/users/controller/authController.dart';
import 'package:hygeia/users/controller/userPreferences.dart';
import 'package:hygeia/users/data/model/patient.dart';
import 'package:hygeia/users/view/Bio/widget.bio.dart';
import 'package:hygeia/users/view/Home/widget.home.dart';
import 'package:hygeia/users/view/RV/rv.dart';
import 'package:hygeia/users/view/auth/widget.login.dart';
import 'package:hygeia/users/view/exmen/widget.examen.dart';
import 'package:hygeia/users/view/profile/changepassword/widget.changepassword2.dart';
import 'package:hygeia/users/view/profile/yourProfile/widget.profile.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NavigationDrawer extends StatefulWidget {
  NavigationDrawer(this.now);
  String now;
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    Patient user = Provider.of<UserProvider>(context).user;

    var mesbools = {
      'home': this.widget.now == 'home',
      'profil': this.widget.now == 'profil',
      'parametre': this.widget.now == 'parametre',
      'rvous': this.widget.now == 'rvous',
      'emedic': this.widget.now == 'emedic',

      'bio': this.widget.now == 'bio'

    };
    return Drawer(
      child: Container(
        height: 100.h,
        width: 100.w,
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              color: Colors.blue,
              height: 25.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [],
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(user.picture),
                      maxRadius: 5.5.h,
                      minRadius: 5.5.h,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "${user.name} ${user.lastname}",
                    style: GoogleFonts.inter(
                        color: Color(0xffF3F5F4),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            SizedBox(height: 4.h),
            mylisttile("home.svg", "Home", mesbools['home'], () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            }),
            mylisttile("bio.svg", "Biographie", mesbools['bio'], () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Biographie()));
            }),
            mylisttile(
                "stethoscope.svg", "Examens médicaux", mesbools['emedic'], () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ExamenMedical()));
            }),
            mylisttile("clock.svg", "Rendez-vous", mesbools['rvous'], () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Calendar2()));
            }),
            mylisttile("settings.svg", "paramètre", mesbools['parametre'], () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ChangePassword2()));
            }),
            mylisttile("user.svg", "Profil", mesbools['profil'], () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            }),
            Divider(
              thickness: 1,
              height: 4.h,
              endIndent: 4.h,
              indent: 4.h,
            ),
            mylisttile("logout.svg", "log out", false, () {
              UserPreferences().removeUser();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  Login()), (Route<dynamic> route) => false);


            }),
          ],
        ),
      ),
    );
  }
}

class mylisttile extends StatelessWidget {
  mylisttile(this.icon, this.title, this.selected, this.ontap);
  String icon;
  String title;
  bool selected;
  Function ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: selected == true
            ? BoxDecoration(color: Colors.blue.withOpacity(0.1))
            : null,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
            horizontal: 0, vertical: selected == true ? 1.h : 0.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 1.2.h),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/" + icon,
                color: selected != true ? Colors.black : Colors.blue,
                height: 2.4.h,
                width: 2.4.w,
              ),
              SizedBox(width: 8.w),
              Text(
                title,
                style: GoogleFonts.poppins(
                    color: selected != true ? Colors.black : Colors.blue,
                    fontSize: 16,
                    fontWeight:
                    selected == true ? FontWeight.w400 : FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
