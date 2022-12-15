import 'package:aishwarya_college/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper{
  static Future<UserModel?>getUserModelById(String uid)async{
    UserModel? userModel;
    DocumentSnapshot documentSnapshot=await FirebaseFirestore.instance.collection("students").doc(uid).get();
    if(documentSnapshot.data()!=null){
      userModel=UserModel.fromMap(documentSnapshot.data()as Map<String,dynamic>);
    }
    return userModel;
  }
}