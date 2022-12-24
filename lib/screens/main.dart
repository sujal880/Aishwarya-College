
import 'package:aishwarya_college/screens/login.dart';
import 'package:aishwarya_college/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uuid/uuid.dart';
import '../models/firebasehelper.dart';
import '../models/usermodel.dart';
import 'bottomnavigationbar.dart';
import 'homescreen.dart';
var uuid=Uuid();

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  final User firebaseuser;
  UserModel? thisUserModel;
  User? currentuser=FirebaseAuth.instance.currentUser;
  if(currentuser!=null){
    //Logged In
    UserModel? thisUserModel=await FirebaseHelper.getUserModelById(currentuser.email!);
    if(thisUserModel!=null){
      runApp(MyAppLoggedIn(userModel: thisUserModel, firebaseuser: currentuser));
    }
    else{
      runApp(MyApp(userModel: thisUserModel!,firebaseuser: currentuser,));
    }
  }
  else{
    runApp(MyApp(userModel: thisUserModel!,firebaseuser: currentuser!,)
    );
  }
}

//Not Logged In
class MyApp extends StatelessWidget {
  final User firebaseuser;
  final UserModel userModel;
  MyApp({required this.userModel,required this.firebaseuser});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Splash(userModel: userModel , firebaseuser: firebaseuser  ),
    );
  }
}


//Logged In
class MyAppLoggedIn extends StatelessWidget{
  final UserModel userModel;
  final User firebaseuser;
  MyAppLoggedIn({required this.userModel,required this.firebaseuser});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: Bottom(userModel: userModel,firebaseuser: firebaseuser),
    );
  }

}