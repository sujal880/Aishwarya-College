import 'package:aishwarya_college/models/usermodel.dart';
import 'package:aishwarya_college/screens/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        backgroundColor: Color(0xff202642), 
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10.w,),
                  InkWell(
                    onTap: (){
                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen(userModel:widget.userModel, firebaseuser: widget.firebaseuser)));
                    },
                      child: Icon(Icons.arrow_back,color: Colors.white,)),
                  SizedBox(width: 95.w,),
                  Text("My Profile",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white),),
                ],
              ),
              SizedBox(height: 12.h,),
              ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: Image.network("${widget.userModel.profilepic}",fit: BoxFit.cover,),
              ),
              SizedBox(height: 14.h,),
              Container(
                width: MediaQuery.of(context).size.width.w,
                height: MediaQuery.of(context).size.height*0.652,
                decoration: BoxDecoration(
                    color: Color(0xffe9f5f7),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(35))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h,),
                        LableDecoration(TextValue: Text("Username",style: TextStyle(color: Colors.grey),)),
                        SizedBox(height: 5.h,),
                        ContainerDecoration(TextValue: Text("${widget.userModel.fullname}",style: TextStyle(fontSize: 18,color: Colors.blue))),
                        SizedBox(height: 16.h,),
                        LableDecoration(TextValue: Text("Email@",style: TextStyle(color: Colors.grey),)),
                        SizedBox(height: 5.h,),
                        ContainerDecoration(TextValue: Text("${widget.userModel.email}",style: TextStyle(fontSize: 18,color: Colors.blue))),
                        SizedBox(height: 16.h,),
                        LableDecoration(TextValue: Text("Phone",style: TextStyle(color: Colors.grey),)),
                        SizedBox(height: 5.h,),
                        ContainerDecoration(TextValue: Text("${widget.userModel.phone}",style: TextStyle(fontSize: 18,color: Colors.blue))),
                        SizedBox(height: 16.h,),
                        LableDecoration(TextValue: Text("Course",style: TextStyle(color: Colors.grey),)),
                        SizedBox(height: 5.h,),
                        ContainerDecoration(TextValue: Text("${widget.userModel.course}",style: TextStyle(fontSize: 18,color: Colors.blue))),
                        SizedBox(height: 16.h,),
                        LableDecoration(TextValue: Text("Course",style: TextStyle(color: Colors.grey),)),
                        SizedBox(height: 5.h,),
                        ContainerDecoration(TextValue: Text("${widget.userModel.course}",style: TextStyle(fontSize: 18,color: Colors.blue))),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget ContainerDecoration({required Text TextValue}){
    return  Container(
      height: 43.h,
      width: 260.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xffFFFAFA)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10,top: 13),
        child: TextValue,
      ),
    );
  }
  Widget LableDecoration({required Text TextValue}){
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: TextValue,
    );
  }
}