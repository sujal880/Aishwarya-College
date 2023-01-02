import 'package:aishwarya_college/models/usermodel.dart';
import 'package:aishwarya_college/screens/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/*class ProfileScreen extends StatefulWidget {
  final UserModel userModel;
  final User firebaseuser;
  ProfileScreen({required this.userModel,required this.firebaseuser});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}*/

/*class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var Height=MediaQuery.of(context).size.height;
    var Width= MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          height: Height,
          width: Width,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 30),
                  Text("My Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 34,color: Colors.blue),),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: 30),
                  Text("Please complete your profile.",style: TextStyle(fontSize: 17,color: Colors.grey),),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 30),
                  Stack(
                    children:[
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.network("${widget.userModel.profilepic}",fit: BoxFit.cover,),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 113,start: 120),
                        child: CircleAvatar(
                          radius: 23,
                          child: Icon(Icons.camera_alt),
                        ),
                      )
                    ]
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 30),
                  Text("Name",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 33),
                  Card(
                    elevation: 14,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start:20,top: 10),
                        child: Text("${widget.userModel.fullname}",style: TextStyle(fontSize: 18,color: Colors.blue),),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 30),
                  Text("Email",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 33),
                  Card(
                    elevation: 14,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start:20,top: 10),
                        child: Text("${widget.userModel.email}",style: TextStyle(fontSize: 18,color: Colors.blue),),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 30),
                  Text("Phone",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 33),
                  Card(
                    elevation: 14,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start:20,top: 10),
                        child: Text("+91"+"${widget.userModel.phone}",style: TextStyle(fontSize: 18,color: Colors.blue),),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 30),
                  Text("Course",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 33),
                  Card(
                    elevation: 14,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start:20,top: 10),
                        child: Text("${widget.userModel.course}",style: TextStyle(fontSize: 18,color: Colors.blue),),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }

}*/
