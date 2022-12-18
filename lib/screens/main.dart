import 'package:aishwarya_college/models/firebasehelper.dart';
import 'package:aishwarya_college/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../models/usermodel.dart';
import 'homescreen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? currentuser=FirebaseAuth.instance.currentUser;
  if(currentuser!=null){
    //Logged In
    UserModel? thisUserModel=await FirebaseHelper.getUserModelById(currentuser.uid);
    if(thisUserModel!=null){
      runApp(MyAppLoggedIn(userModel: thisUserModel,firebaseUser: currentuser));
    }
    else{
      runApp(MyApp());
    }
  }
  runApp(const MyApp());
}

//Not Logged In
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogIn()
    );
  }
}

//Logged In

class MyAppLoggedIn extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;
  MyAppLoggedIn({required this.userModel,required this.firebaseUser});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomeScreen(),
    );
  }
}
