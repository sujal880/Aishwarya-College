

import 'package:aishwarya_college/models/usermodel.dart';
import 'package:aishwarya_college/screens/course_selection_list.dart';
import 'package:aishwarya_college/screens/login.dart';
import 'package:aishwarya_college/screens/user_profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController coursesController=TextEditingController();

  void CheckValues()async{
    String email=emailController.text.trim();
    String password=passwordController.text.trim();
    String phone=phoneController.text.trim();
    String course=coursesController.text.trim();
    if(email=="" || password=="" || phone=="" || course==""){
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text("Enter Valid Details"),
          actions: [
            TextButton(onPressed:(){
              Navigator.pop(context);
            }, child: Text("Ok"))
          ],
        );
      });
    }
    else{
      UserCredential ? userCredential;
      try{
        userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      }on FirebaseAuthException catch(ex){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            title: Text(ex.code.toString()),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Ok"))
            ],
          );
        });
      }
      if(userCredential!=null){
        String uid=userCredential.user!.uid;
        UserModel newUser=UserModel(uid: uid, fullname: "", email: email, phone: phone, course: course, profilepic: "");
        FirebaseFirestore.instance.collection("students").doc(email).set(newUser.toMap()).then((value) => print("User Created"));
        print(uid);
       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>UserDetails(userModel: newUser,firebaseuser: userCredential!.user!)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body:Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.white,
                    ],begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                      children:[
                        Card(
                          elevation:16,
                          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Container(
                            //height: MediaQuery.of(context).size.height/1.68,
                            height: 380.h,
                            width: 400.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color:Colors.white
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top:40),
                          child: Container(
                              alignment: Alignment.center,
                              child: Text('Sign In',style: TextStyle(fontSize: 22.sp))),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top:90),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: Colors.black12
                                ),
                                child: getTextFile(hint: 'Email',
                                       Controller: emailController,
                                       Icon: Icon(Icons.email)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top:150),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40.h,
                                width: 300.w,
                                //width: MediaQuery.of(context).size.width/1.23,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black12
                                ),
                                child: TextField(
                                  controller: passwordController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      prefixIcon: Icon(Icons.lock),
                                      suffixIcon: Icon(Icons.remove_red_eye),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top:210),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black12
                                ),
                                child: TextField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      hintText: 'Phone',
                                      prefixIcon: Icon(Icons.phone),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top:270),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 40.h,
                                width: 300.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black12
                                ),
                                child:TextField(
                                  controller: coursesController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: 'Course',
                                      prefixIcon: Icon(Icons.school),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top:350),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 20.h),
                                SizedBox(
                                    height: 40.h,
                                    width: 130.w,
                                    child: ElevatedButton(onPressed: ()async{
                                      CheckValues();
                                    }, child: Text('Sign Up'),style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),backgroundColor: Colors.blue),)),
                                SizedBox(width: 45.h),
                                TextButton(onPressed: (){
                                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LogIn()));
                                }, child: Text("Sign In",style: TextStyle(fontSize: 18),))
                              ]
                          ),

                        ),
                      ]
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
  /*TextField(
                                  controller: emailController,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      prefixIcon: Icon(Icons.person),
                                      border: InputBorder.none
                                  ),
                                ),*/

  Widget getTextFile(
  {required String hint,required TextEditingController Controller,required Icon Icon})
    {
    return TextField(
      controller: Controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon,
        border: InputBorder.none
      ),


    );
  }
}
