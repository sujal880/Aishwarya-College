import 'dart:developer';
import 'dart:io';
import 'package:aishwarya_college/screens/homescreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/usermodel.dart';
class UserDetails extends StatefulWidget {
  final UserModel userModel;
  final User firebaseuser;
  UserDetails({required this.userModel,required this.firebaseuser});
  @override
  State<UserDetails> createState() => _UserDeatilsState();
}

class _UserDeatilsState extends State<UserDetails>{
  TextEditingController nameController=TextEditingController();
  File ? pickedImage;

  void CheckValues()async{
    String name=nameController.text.trim();
    if(name=="" || pickedImage==""){
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
      UploadData();
    }
  }
  void UploadData()async{
    UploadTask uploadTask=FirebaseStorage.instance.ref("profilepictures").child(widget.userModel.email.toString()).putFile(pickedImage!);
    TaskSnapshot snapshot=await uploadTask;
    String ? imageUrl=await snapshot.ref.getDownloadURL();
    String ? name=nameController.text.trim();
    widget.userModel.profilepic=imageUrl;
    widget.userModel.fullname=name;
    log(name);
    FirebaseFirestore.instance.collection("students").doc(widget.userModel.email).set(widget.userModel.toMap()).then((value) => showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Profile Uploaded"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok"))
        ],
      );
    }));
    Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen(userModel: widget.userModel, firebaseuser: widget.firebaseuser)));
  }

  void SelectImage(){
    showDialog(context: context, builder:(BuildContext context){
      return AlertDialog(
        title: Text("Pick Image From"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: (){
                pickImage(ImageSource.camera);
              },
              leading: Icon(Icons.camera_alt),
              title: Text("Select From Camera"),
            ),
            ListTile(
              onTap: (){
                pickImage(ImageSource.gallery);
              },
              leading: Icon(Icons.image),
              title: Text("Select From Gallery"),
            )
          ],
        ),
      );
    });
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
                padding: const EdgeInsets.all(30.0),
                child: Stack(
                    children:[
                      Card(
                        elevation:16,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Container(
                          height: 400,
                          width: 400,
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
                            child: Text('Profile',style: TextStyle(fontSize: 22))),
                      ),
                      GestureDetector(
                        onTap:(){
                          SelectImage();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top:100),
                          alignment: Alignment.center,
                          child: pickedImage!=null?CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: FileImage(pickedImage!),
                            radius: 50,
                          ):Icon(Icons.person,size: 60)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top:220),
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
                                controller: nameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    hintText: 'Full Name',
                                    prefixIcon: Icon(Icons.person),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top:290),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 40,
                                  width: 130,
                                  child: ElevatedButton(onPressed: ()async{
                                    CheckValues();
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
  pickImage(ImageSource imagetype)async{
    try{
      final photo=await ImagePicker().pickImage(source: imagetype);
      if(photo==null)return;
      final tempimage=File(photo.path);
      setState(() {
        pickedImage=tempimage;
      });
    }catch(ex){
      log(ex.toString());
    }
  }
}
