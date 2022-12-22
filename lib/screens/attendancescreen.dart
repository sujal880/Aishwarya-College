import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/usermodel.dart';
class AttendanceScreen extends StatefulWidget {
  final UserModel userModel;
  final User firebaseuser;
  AttendanceScreen({required this.userModel,required this.firebaseuser});
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Attendance"),),
    );
  }
}
