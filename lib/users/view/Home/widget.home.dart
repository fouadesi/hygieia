import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hygeia/users/controller/PatientProvider.dart';
import 'package:hygeia/users/data/model/patient.dart';
import 'package:hygeia/users/view/drawer/widget.drawer.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    Patient user = Provider.of<UserProvider>(context).user;
    print("lastname");
print(user.name);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF3F5F4),
      drawer: NavigationDrawer("Accueil"),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Accueil',
            style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500)),
        centerTitle: true,

        backgroundColor : Color.fromRGBO(58, 122, 254,1),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Salut ${user.lastname} ${user.name}',
                          style: GoogleFonts.inter(
                              fontSize: 23, fontWeight: FontWeight.bold)),
                      Text('bienvenue sur hygeia',
                          style: GoogleFonts.poppins(
                              color: Color(0xff707070),
                              fontSize: 15,
                              fontWeight: FontWeight.normal))
                    ],
                  ),
                  InkWell(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(user.picture),

                            maxRadius: 3.h,
                            minRadius: 3.h,
                          ),
                        ),
                        Positioned(
                          top: 0.02.h,
                          right: 0.02.w,
                          child: Container(
                            height: 1.5.h,
                            width: 1.5.h,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Consulter vos :',
                        style: GoogleFonts.inter(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 3.h),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.h),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                            color: Color(0xff3A7AFE)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 3.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "- ordonnance",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                "- bilans",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                "- orientation",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: 0,
                      right: 10.w,
                      child: Image.asset("assets/images/docteur.png")),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'vos rendez-vous :',
                    style: GoogleFonts.inter(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    child: Text(
                      'tous',
                      style: GoogleFonts.poppins(
                          color: Color(0xff707070),
                          fontSize: 17,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              MyStack("doct.jpg", "Merabet", "mer 14/05/2020", "personel", 0,() => onpresscard()),
              MyStack("doct.jpg", "Merabet", "mer 14/05/2020", "personel", 1,() => onpresscard()),
              MyStack("doct.jpg", "Merabet", "mer 14/05/2020", "personel", 2, () => onpresscard()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff01559C),
        child: Icon(Icons.add_rounded, size: 5.h),
        onPressed: () {},
      ),
    ));
  }
  onpresscard() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xff737373),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Votre rendez-vsous",
                      style: GoogleFonts.inter(
                          fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Ce rendez-vous pour vois \nl'avancement de votre cas ,\nnoubliez pas votre bavette",
                      style: GoogleFonts.poppins(
                          fontSize: 15, color: Color(0xff707070)),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/rendezv.svg",
                          color: Colors.black,
                          height: 4.h,
                          width: 4.w,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          "14/9/2021",
                          style: GoogleFonts.inter(
                              fontSize: 17, fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/sermed.svg",
                          color: Colors.black,
                          height: 2.8.h,
                          width: 2.8.w,
                        ),
                        SizedBox(width: 9.w),
                        Text(
                          "Dr Merabet",
                          style: GoogleFonts.inter(
                              fontSize: 17, fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/accetblack.svg",
                          height: 2.8.h,
                          width: 2.8.w,
                        ),
                        SizedBox(width: 9.w),
                        Text(
                          "accepté",
                          style: GoogleFonts.inter(
                              fontSize: 17, fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            child: Container(
                              width: 35.w,
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
                                color: Color(0xffFF002B),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                  child: Text(
                                    'Supprimer',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 13.4.sp,
                                        fontWeight: FontWeight.w500),
                                  )),
                            )),
                        SizedBox(
                          width: 5.w,
                        ),
                        InkWell(
                            child: Container(
                              width: 35.w,
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
                                color: Color(0xffF7DB4C),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                  child: Text(
                                    'Modifier',
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 13.4.sp,
                                        fontWeight: FontWeight.w500),
                                  )),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class MyStack extends StatelessWidget {
  MyStack(this.ImageAsset, this.Doctor, this.date, this.genre, this.situation, this.ontap);
  String ImageAsset;
  String Doctor;
  String date;
  String genre;
  int situation;
  Function ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 1.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color(0x153DC7C9)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 15.w,
                            height: 8.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0.5.h),
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/" + ImageAsset),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(width: 5.w),
                          Container(
                            height: 8.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Dr. " + Doctor,
                                    style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                                Text(date,
                                    style: GoogleFonts.poppins(
                                        color: Color(0xff707070),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                                Text(genre,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              )),
          Positioned(
            top: 0,
            right: 0,
            child: Builder(builder: (BuildContext context) {
              switch (situation) {
                case 0:
                  {
                    return SvgPicture.asset(
                      "assets/icons/refus.svg",
                      height: 2.7.h,
                      width: 2.7.w,
                    );
                    break;
                  }
                case 1:
                  {
                    return SvgPicture.asset(
                      "assets/icons/accepte.svg",
                      height: 2.7.h,
                      width: 2.7.w,
                    );
                    break;
                  }
                default:
                  {
                    return SvgPicture.asset(
                      "assets/icons/timing.svg",
                      height: 2.7.h,
                      width: 2.7.w,
                    );
                  }
              }
            }),
          ),
        ],
      ),
    );
  }
}
// situation == 1
// ? "assets/icons/accepte.svg"
//     : "assets/icons/refuse.svg",
