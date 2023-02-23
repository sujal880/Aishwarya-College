import 'package:aishwarya_college/models/usermodel.dart';
import 'package:aishwarya_college/screens/edit_profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/usermodel.dart';
class ProfileScreen extends StatefulWidget {
  final UserModel userModel;
  final User firebaseuser;
  ProfileScreen({required this.userModel,required this.firebaseuser});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children:[
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Image.network("${widget.userModel.profilepic}",fit: BoxFit.cover,),
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.white38,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 170),
                    child: Card(
                      elevation: 25,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80)
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage("${widget.userModel.profilepic}"),
                          radius: 55,
                        ),
                      ),
                    ),
                  ),
                )
              ]
            ),
            SizedBox(height: 50),
            Row(
              children: [
                SizedBox(width: 40),
                Icon(Icons.person_outline_rounded,size: 30,color: Colors.blue,),
                SizedBox(width: 20),
                Text("${widget.userModel.fullname}",style: TextStyle(fontSize: 20,color: Colors.grey,),)
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.black12,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 40),
                Icon(Icons.mail_outline,size: 30,color: Colors.blue,),
                SizedBox(width: 20),
                Text("${widget.userModel.email}",style: TextStyle(fontSize: 20,color: Colors.grey,),)
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.black12,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 40),
                Icon(Icons.phone_android_outlined,size: 30,color: Colors.blue,),
                SizedBox(width: 20),
                Text("+91${widget.userModel.phone}",style: TextStyle(fontSize: 20,color: Colors.grey,),)
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.black12,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 40),
                Icon(Icons.school_outlined,size: 30,color: Colors.blue,),
                SizedBox(width: 20),
                Text("${widget.userModel.course}",style: TextStyle(fontSize: 20,color: Colors.grey,),)
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.black12,
            ),
            SizedBox(height: 40),
            Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Edit_Profile(usermodel: widget.userModel,firebaseuser: widget.firebaseuser)));
                },
                child: Container(
                  height: 48,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue
                  ),
                  child: Center(child: Text("Edit Profile",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}