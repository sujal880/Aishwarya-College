import 'package:aishwarya_college/screens/login.dart';
import 'package:aishwarya_college/services/notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  await NotificationService.initialize();
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
      runApp(MyApp());
    }
  }
  else{
    runApp(MyApp()
    );
  }
}

//Not Logged In
class MyApp extends StatelessWidget {
  // final User firebaseuser;
  // final UserModel userModel;
  // MyApp({required this.userModel,required this.firebaseuser});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context,child){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aishwarya College',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LogIn(),
      );

    },
    designSize: const Size(360,680),
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
    return MaterialApp(title: "Aishwarya College",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: Bottom(userModel: userModel,firebaseuser: firebaseuser),
    );
  }

}