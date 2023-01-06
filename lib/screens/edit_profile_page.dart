import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/usermodel.dart';
class Edit_Profile extends StatefulWidget {
  final UserModel usermodel;
  final User firebaseuser;
  Edit_Profile({required this.usermodel,required this.firebaseuser});
  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  bool newname=true;
  bool newmail=true;
  bool newphone=true;
  bool newcourse=true;
  TextEditingController newnameController=TextEditingController();
  TextEditingController newmailController=TextEditingController();
  TextEditingController newphoneController=TextEditingController();
  TextEditingController newcourseController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          Center(
            child: Stack(
              children:[
                Card(
                  elevation:20,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 10,start: 10),
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage: NetworkImage("${widget.usermodel.profilepic}"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start:100,top: 115),
                  child: Icon(Icons.add_circle,size: 30,color: Colors.blue,),
                )
              ]
            ),
          ),
          SizedBox(height: 50),
          Row(
            children: [
              SizedBox(width: 30),
              Icon(Icons.person,size: 30,color: Colors.blue,),
              SizedBox(width: 20),
              Text("Your Name",style: TextStyle(fontSize: 20,color: Colors.grey,),)
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start:85,end: 20),
            child: TextField(
              controller: newnameController,
              decoration: InputDecoration(
                hintText: '${widget.usermodel.fullname}'
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 30),
              Icon(Icons.mail,size: 30,color: Colors.blue,),
              SizedBox(width: 20),
              Text("Your Mail",style: TextStyle(fontSize: 20,color: Colors.grey,),)
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start:85,end: 20),
            child: TextField(
              controller: newmailController,
              decoration: InputDecoration(
                  hintText: '${widget.usermodel.email}'
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 30),
              Icon(Icons.phone_android_outlined,size: 30,color: Colors.blue,),
              SizedBox(width: 20),
              Text("Your Phone",style: TextStyle(fontSize: 20,color: Colors.grey,),)
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start:85,end: 20),
            child: TextField(
              controller: newphoneController,
              decoration: InputDecoration(
                  hintText: '+91${widget.usermodel.phone}'
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 30),
              Icon(Icons.school,size: 30,color: Colors.blue,),
              SizedBox(width: 20),
              Text("Your Course",style: TextStyle(fontSize: 20,color: Colors.grey,),)
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start:85,end: 20),
            child: TextField(
              controller: newcourseController,
              decoration: InputDecoration(
                  hintText: '${widget.usermodel.course}'
              ),
            ),
          ),
          SizedBox(height: 40),
          Card(
            elevation: 15,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)
            ),
            child: GestureDetector(
              onTap: (){
                updateProfileData();
              },
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue
                ),
                child: Center(child: Text("Save",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),),
              ),
            ),
          )
        ],
      ),
    );
  }
  updateProfileData(){
    setState(() {
      String Newname=newnameController.text.trim();
      String NewMail=newmailController.text.trim();
      String NewPhone=newphoneController.text.trim();
      String NewCourse=newcourseController.text.trim();
      if(Newname=="" || NewMail=="" || NewPhone=="" || NewCourse==""){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            title: Text("Enter Details"),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Ok"))
            ],
          );
        });
      }
      // else{
      //   usersref.document(widget.)
      // }
    });
  }
}
