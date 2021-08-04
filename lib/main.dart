import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hygeia/users/controller/PatientProvider.dart';
import 'package:hygeia/users/controller/authController.dart';
import 'package:hygeia/users/data/model/patient.dart';
import 'package:hygeia/users/view/Home/widget.home.dart';
import 'package:hygeia/users/view/auth/widget.login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'users/controller/userPreferences.dart';

void main() async {
  await  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<Patient> getUserData() => UserPreferences().getUser();
    SharedPreferences.getInstance().then((value) =>
       print( value.getString("Firstname")) ) ;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: Sizer(
        builder: (context,orientation,deviceType)=> MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: FutureBuilder(
                future: getUserData(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    default:
                      if (snapshot.hasError)
                        return Text('Error: ${snapshot.error}');
                      else if (snapshot.data.name == null)
                        return Login();
                      else
                      return Welcome(snapshot.data);

                  }
                }),
            routes: {

            }),
      ),
    );
  }
}
class Welcome extends StatelessWidget {
  Patient patient ;
 Welcome(this.patient);


  @override
  Widget build(BuildContext context) {
    print(patient.name);
    Provider.of<UserProvider>(context).setUser(patient);
    return Home();
  }
}

