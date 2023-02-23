import 'package:aishwarya_college/Widgets/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController=TextEditingController();

  Forgot()async{
    String email=emailController.text.trim();
    emailController.clear();
    if(email==""){
      showDialog(context: context, builder:(BuildContext context){
        return AlertDialog(
          title: Text("Enter Required Details"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Ok"))
          ],
        );
      });
    }
    else{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value){
        showDialog(context: context, builder:(BuildContext context){
          return AlertDialog(
            title: Text("We Have Sent You A Mail To Reset Password!!"),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Ok"))
            ],
          );
        });
      }).onError((error, stackTrace){
        showDialog(context: context, builder:(BuildContext context){
          return AlertDialog(
            title: Text(error.toString()),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Ok"))
            ],
          );
        });
      });
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
                          height: 300.h,
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
                            child: Text('Forgot Password?',style: TextStyle(fontSize: 22.sp))),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top:160),
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
                                   KeyboardType: TextInputType.emailAddress,
                                  Controller: emailController,
                                 Icon: Icon(Icons.email)),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsetsDirectional.only(top:290),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 20.h),
                              SizedBox(
                                  height: 35.h,
                                  width: 150.w,
                                  child: ElevatedButton(onPressed: ()async{
                                    Forgot();
                                  }, child: Text('Submit'),style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),backgroundColor: Colors.blue),)),
                            ]
                        ),

                      ),
                    ]
                ),
              )
            ],
          ),
        )
    );
  }
  Widget getTextFile(
      {required String hint,required TextEditingController Controller,required Icon Icon,sIcon,required KeyboardType })
  {
    return TextField(
      controller: Controller,
      keyboardType: KeyboardType,
      decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.only(top: 12.sp,),
          prefixIcon: Icon,
          border: InputBorder.none,
          suffixIcon: sIcon
      ),


    );
  }
}
