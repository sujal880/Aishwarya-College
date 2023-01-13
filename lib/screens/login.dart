import 'package:aishwarya_college/models/usermodel.dart';
import 'package:aishwarya_college/screens/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottomnavigationbar.dart';
class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _SignUpState();
}

class _SignUpState extends State<LogIn> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  void CheckValues()async{
    String email=emailController.text.trim();
    String password=passwordController.text.trim();
    if(email=="" || password==""){
      showDialog(context: context, builder:(BuildContext context){
        return AlertDialog(
         title: Text("Enter Valid Details"),
         actions: [
           TextButton(onPressed: (){
             Navigator.pop(context);
           }, child: Text("Ok"))
         ],
        );
      });
    }
    else{
      UserCredential ? userCredential;
      try{
        userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
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
        DocumentSnapshot userData=await FirebaseFirestore.instance.collection("students").doc(email).get();
        UserModel userModel=UserModel.fromMap(userData.data() as Map<String,dynamic>);
        print("logged In");
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Bottom(userModel: userModel, firebaseuser: userCredential!.user!)));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.white,
                    Color(0xff90e8de)
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,

              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child:Stack(
                    children:[
                      Card(
                        elevation:16,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Container(
                          height: 350.h,
                          width: 500.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color:Colors.white
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top:60),
                        child: Container(
                            alignment: Alignment.center,
                            child: Text('Sign In',style: TextStyle(fontSize: 22))),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top:120),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 45,
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.black12
                              ),
                              child: TextField(
                                controller: emailController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    prefixIcon: Icon(Icons.person),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top:180),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 45,
                              width: 300,
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
                        padding: const EdgeInsetsDirectional.only(top:250),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 20),
                              SizedBox(
                                  height: 40,
                                  width: 130,
                                  child: ElevatedButton(onPressed: ()async{
                                    CheckValues();
                                  }, child: Text('Sign In'),style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),backgroundColor: Colors.blue),)),
                              SizedBox(width: 4),
                              TextButton(onPressed: (){}, child: Text("Forgot Password?",style: TextStyle(fontSize: 16),))
                            ]
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top:320),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't Have an Account?",style: TextStyle(fontSize: 16,color: Colors.black54),),
                            TextButton(onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
                            }, child: Text("Sign Up",style: TextStyle(fontSize: 17))),
                          ],
                        ),
                      )
                    ]
                ),
              )
            ],
          ),
        )
    );
  }
}

/**/