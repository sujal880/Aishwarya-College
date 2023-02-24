import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/usermodel.dart';
class Edit_Profile extends StatefulWidget {
  final UserModel usermodel;
  final User firebaseuser;
  Edit_Profile({required this.usermodel, required this.firebaseuser});
  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}
class _Edit_ProfileState extends State<Edit_Profile> {
  late UserModel me;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Stack(children: [
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10, start: 10),
                child: CircleAvatar(
                  radius: 65,
                  backgroundImage:
                      NetworkImage("${widget.usermodel.profilepic}"),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 100, top: 115),
                child: Icon(
                  Icons.add_circle,
                  size: 30,
                  color: Colors.blue,
                ),
              )
            ]),
            SizedBox(height: 50),
            Row(
              children: [
                SizedBox(width: 30),
                Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.blue,
                ),
                SizedBox(width: 20),
                Text(
                  "Your Name",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 85, end: 20),
              child: TextFormField(
                onSaved: (value) => me.fullname = value ?? "",
                validator: (value) => value != null && value.isNotEmpty
                    ? null
                    : "Please Fill Required Fields",
                initialValue: widget.usermodel.fullname,
                decoration: InputDecoration(hintText: 'Name'),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 30),
                Icon(
                  Icons.mail,
                  size: 30,
                  color: Colors.blue,
                ),
                SizedBox(width: 20),
                Text(
                  "Your Mail",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 85, end: 20),
              child: TextFormField(
                onSaved: (value) => me.email = value ?? "",
                validator: (value) => value != null && value.isNotEmpty
                    ? null
                    : "Please Fill Required Fields",
                initialValue: widget.usermodel.email,
                decoration: InputDecoration(hintText: 'Email'),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 30),
                Icon(
                  Icons.phone_android_outlined,
                  size: 30,
                  color: Colors.blue,
                ),
                SizedBox(width: 20),
                Text(
                  "Your Phone",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 85, end: 20),
              child: TextFormField(
                onSaved: (value) => me.phone = value ?? "",
                validator: (value) => value != null && value.isNotEmpty
                    ? null
                    : "Please Fill Required Fields",
                initialValue: widget.usermodel.phone,
                decoration: InputDecoration(hintText: 'Phone'),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 30),
                Icon(
                  Icons.school,
                  size: 30,
                  color: Colors.blue,
                ),
                SizedBox(width: 20),
                Text(
                  "Your Course",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 85, end: 20),
              child: TextFormField(
                onSaved: (value) => me.course = value ?? "",
                validator: (value) => value != null && value.isNotEmpty
                    ? null
                    : "Please Enter Required Fields",
                initialValue: widget.usermodel.course,
                decoration: InputDecoration(hintText: 'Course'),
              ),
            ),
            SizedBox(height: 40),
            Card(
              elevation: 15,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: GestureDetector(
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    updateUserInfo().then((value) {
                      log("Profile Updated");
                    });
                  }
                },
                child: Container(
                  height: 59,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue),
                  child: Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> updateUserInfo() async {
    await FirebaseFirestore.instance
        .collection("students")
        .doc(widget.usermodel.email)
        .update({
      "fullname": me.fullname,
      "email": me.email,
      "phone": me.phone,
      "course": me.course
    });
  }
}
