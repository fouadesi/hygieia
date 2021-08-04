import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hygeia/users/controller/PatientProvider.dart';
import 'package:hygeia/users/controller/authController.dart';
import 'package:hygeia/users/data/model/patient.dart';
import 'package:hygeia/users/view/auth/component/message.error.dart';
import 'package:hygeia/users/view/profile/yourProfile/widget.modifierporfil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hygeia/users/view/drawer/widget.drawer.dart';


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();
  File _image ;
  bool cic =  true ;
  @override
  Widget build(BuildContext context) {
    Patient user = Provider.of<UserProvider>(context).user;

    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawer("profile"),
        appBar: AppBar(
          backgroundColor: Color(0xFF3A7AFE),
          title: Text('Profil',
              style:
                  GoogleFonts.inter(fontSize: 21, fontWeight: FontWeight.w500)),
          centerTitle: true,
          elevation: 20,
        ),
        body: Container(
          height: 100.h,
          width: 100.w,
          child: Stack(children: [
            Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/backprofil.png"),
                  fit: BoxFit.fitWidth),
            )),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage:
                                  _image == null ?    NetworkImage(user.picture) : FileImage(_image),
                              maxRadius: 7.5.h,
                              minRadius: 7.5.h,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 1.h,
                          right: 1.w,
                          child: InkWell(
                            onTap: ()async  {
                              _picker.getImage(source: ImageSource.gallery).
                              then((value) async  {
                                if (value != null) {
                                  setState(() {
                                    _image = File(value.path);
                                  });
                                  String iname = "image" + user.email ;
                                  setState(() {
                                    cic = false ;
                                  });
                                  final  firebaseStorageRef = await FirebaseStorage.instance.ref().child(iname);
                                  TaskSnapshot uploadTask =
                                      await firebaseStorageRef.putFile(_image);
                                  String download_URL = await  uploadTask.ref.getDownloadURL();
                                  AuthProvider().UpdatePicture(
                                    download_URL,user.email ,
                                    context,
                                  ).then((value) {

                                    if(value =="succes") {
                                      Patient  p = user ;
                                      p.picture = download_URL ;
                                      AuthProvider().UpdateAccount(
                                          p
                                          ,context);
                                      Provider.of<UserProvider>(context,listen:false).setUser(p);
                                      setState(() {
                                        cic = true ;
                                      });
                                      showSuccesMessage("Photo changé avec succées", context);
                                    }else {
                                      showSuccesMessage("Erreur", context);

                                    }
                                  });


                                }
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Color(0xff01559C),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(1.h),
                                child: Icon(Icons.edit, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "${user.name} ${user.lastname}",
                    style: GoogleFonts.inter(
                        fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffF3F5F4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    margin:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 7.w),
                    height: 40.h,
                    child: ListView(children: [
                      informations(
                          icon: Icons.email, info: user.email),
                      informations(
                          icon: Icons.person, info: user.name +" "+ user.lastname),
                      informations(icon: Icons.event, info: user.birthday.substring(0,10)),
                      informations(icon: Icons.place, info: user.wilaya),
                      informations(icon: Icons.phone, info: "0"+user.phonenumber),
                      informations(
                          icon: Icons.home_repair_service, info: user.role),
                      informations(icon: Icons.accessibility, info: user.sexe),
                      informations(
                          icon: Icons.zoom_out_map_rounded, info: user.bloodgroupe, last: true),
                    ]),
                  ),
             cic   ?   InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => modifierProfile()));
                      },
                      child: Container(
                        width: 45.w,
                        height: 6.5.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.16),
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: Offset(0.0, 10),
                            ),
                          ],
                          color: Color(0xff01559C),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                            child: Text(
                          'modifier',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 13.4.sp,
                              fontWeight: FontWeight.w500),
                        )),
                      )) : CircularProgressIndicator()
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class informations extends StatelessWidget {
  informations({this.icon, this.info, this.last});
  final IconData icon;
  final String info;
  final bool last;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: last != true
          ? EdgeInsets.only(top: 2.h)
          : EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          Icon(icon, size: 25),
          SizedBox(
            width: 7.w,
          ),
          Text(
            info,
            style: GoogleFonts.poppins(
              fontSize: 17,
            ),
          )
        ],
      ),
    );
  }
}
