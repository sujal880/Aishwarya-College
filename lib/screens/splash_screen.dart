import 'dart:developer';

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
    super.initState();
    Future.delayed(Duration(milliseconds: 3000),(){
      if(FirebaseAuth.instance.currentUser!=null){
        log("${FirebaseAuth.instance.currentUser!.uid}");
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Bottom(userModel: widget.userModel, firebaseuser: widget.firebaseuser)));
      }
      else{
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LogIn()));
      }
    });
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
              enableHover: true,
              hoverColor: Colors.black12,
              hoverRadius: 90,
            ),
            Center(child: Image.network('https://github.com/sujal880/College_App/blob/master/assets/images/WhatsApp%20Image%202022-08-24%20at%208.37.01%20AM.jpeg?raw=true'))
          ],
        )
    );
  }


}
