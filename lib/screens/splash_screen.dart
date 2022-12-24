import 'package:aishwarya_college/screens/homescreen.dart';
import 'package:aishwarya_college/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:particles_flutter/particles_flutter.dart';

import '../models/usermodel.dart';
import 'bottomnavigationbar.dart';
class Splash extends StatefulWidget{
  final UserModel userModel;
  final User firebaseuser;
  Splash({required this.userModel,required this.firebaseuser});
  @override
  State<StatefulWidget> createState()=>SplashScreen();

}

class SplashScreen extends State<Splash>{
final getStorge=GetStorage();
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      if(getStorge.read("email")!=null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom(userModel: widget.userModel,
            firebaseuser: widget.firebaseuser)));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
      }
    }
    );
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            CircularParticle(
              width: w,
              height: h,
              awayRadius: w / 5,
              numberOfParticles: 150,
              speedOfParticles: 1.5,
              maxParticleSize: 7,
              particleColor: Colors.blue.withOpacity(.7),
              awayAnimationDuration: Duration(milliseconds: 600),
              awayAnimationCurve: Curves.easeInOutBack,
              onTapAnimation: true,
              isRandSize: true,
              isRandomColor: false,
              connectDots: true,
              // randColorList: [
              // Colors.red.withAlpha(210),
              // Colors.white.withAlpha(210),
              // Colors.yellow.withAlpha(210),
              // Colors.green.withAlpha(210),
              // ],
              enableHover: true,
              hoverColor: Colors.black12,
              hoverRadius: 90,
            ),
            Center(child: Image.asset('assets/images/WhatsApp Image 2022-08-24 at 8.37.01 AM.jpeg'))
          ],
        )
    );
  }


}
