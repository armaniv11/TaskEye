import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:taskeye/utils/app_constants.dart';
import 'package:taskeye/screens/auth/register_page_phone.dart';
import 'package:taskeye/screens/channel_homepage.dart';
import 'package:taskeye/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
// import 'package:package_info_plus/package_info_plus.dart';

import 'package:shimmer/shimmer.dart';
import 'package:taskeye/utils/route_constants.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final _fireStore = FirebaseFirestore.instance;

  Future<bool> _checklogin() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {});
    return true;
  }

  // void showDialog(UpdateModel updateModel) {
  //   showCupertinoDialog(
  //     context: context,
  //     builder: (context) {
  //       return CupertinoAlertDialog(
  //         title: const Text("Mandatory Update Found!!"),
  //         content: const Text("Click OK to start downloading"),
  //         actions: [
  //           CupertinoDialogAction(
  //               child: const Text("Ok"),
  //               onPressed: () async {
  //                 if (await canLaunch(updateModel.updateUrl)) {
  //                   await launch(updateModel.updateUrl);
  //                 } else {
  //                   print("could not douwnload");
  //                 }
  //               }),
  //         ],
  //       );
  //     },
  //   );
  // }

  // PackageInfo _packageInfo = PackageInfo(
  //   appName: 'Unknown',
  //   packageName: 'Unknown',
  //   version: 'Unknown',
  //   buildNumber: 'Unknown',
  //   buildSignature: 'Unknown',
  // );

  @override
  void initState() {
    super.initState();
    //getData();
    // _initPackageInfo();
    _checklogin().then((value) {
      if (value) checkUserLoggedInStatus();
      // checkInfo();
    });
    // _checklogin().then((status) {
    //   // checkblocked();
    //   //loadName();
    //   checkUserLoggedInStatus();
    // });
  }

  Future<void> _initPackageInfo() async {
    // final info = await PackageInfo.fromPlatform();
    // setState(() {
    //   // _packageInfo = info;
    //   print("${info.buildNumber}  printing build number");
    //   print("${info.version}  printing version number");
    // });
  }

  // String name;

  bool blocked = false;
  bool isLoggedIn = false;
  final box = GetStorage();
  checkUserLoggedInStatus() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.offAllNamed(AppRouteConstants.signInRoute);
      } else {
        print('User is signed in!');
        Get.offAllNamed(AppRouteConstants.homepageRoute);
      }
    });
    // if (box.read('isloggedIn') == true) {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => const HomePage()));
    // } else {

    // }
  }

  //String name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: size.height,
            width: double.maxFinite,
            color: Colors.black,
            child: Center(
              child: Shimmer.fromColors(
                baseColor: Colors.yellow,
                highlightColor: Colors.white,
                child: Text(
                  AppConstants.appName,
                  style: GoogleFonts.poppins(
                      color: Colors.yellow,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
              ),
            ),
          ),
          // Container(
          //   height: size.height / 2,
          //   color: Colors.white,
          //   // decoration: const BoxDecoration(
          //   //     image: DecorationImage(
          //   //         image: AssetImage(
          //   //           'assets/images/splash.jpg',
          //   //         ),
          //   //         fit: BoxFit.fill)),
          //   //height: MediaQuery.of(context).size.height,
          // ),
        ],
      ),
    );
  }
}
