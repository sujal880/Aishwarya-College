import 'dart:async';
import 'dart:math';

import 'package:aishwarya_college/services/location_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../models/usermodel.dart';
class AttendanceScreen extends StatefulWidget {
  final UserModel userModel;
  final User firebaseuser;
  AttendanceScreen({required this.userModel,required this.firebaseuser});
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  String CheckIn="--/--";
  String CheckOut="--/--";
  String location="";
  @override
  void initState() {
    super.initState();
    _getRecord();
    _startlocationService();
  }

  void _startlocationService()async{
    LocationService().initialize();
    LocationService().getLongitude().then((value){
      setState(() {
        UserModel.long=value!;
      });
    });

    LocationService().getLatitude().then((value){
      setState(() {
        UserModel.lat=value!;
      });
    });
  }

  void getLocation()async{
    List<Placemark> placemark=await placemarkFromCoordinates(UserModel.lat, UserModel.long);
    setState(() {
      location="${placemark[0].street},${placemark[0].administrativeArea},${placemark[0].postalCode},${placemark[0].country}";
    });
  }
  void _getRecord()async{
    try{
      QuerySnapshot snapshot=await FirebaseFirestore.instance.collection("students").where("${widget.userModel.uid}").get();
      DocumentSnapshot snap2=await FirebaseFirestore.instance.collection("students").doc(widget.userModel.email).collection("Time").doc(DateFormat('dd MMMM yyyy').format(DateTime.now())).get();
      setState(() {
        CheckIn=snap2['CheckIn'];
        CheckOut=snap2['CheckOut'];
      });
    }
    catch(e){
      setState(() {
        CheckIn="--/--";
        CheckOut="--/--";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(width: width/40),
                    Container(
                      margin: EdgeInsets.only(top:100),
                      child: Text('Welcome',style: TextStyle(color: Colors.black54,fontSize: width/20),),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: width/40),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("${widget.userModel.fullname}",style: TextStyle(color: Colors.black,fontSize: width/18,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top:40),
                  alignment: Alignment.center,
                  child: Text("Today's Task",style: TextStyle(color: Colors.black54,fontSize: width/18,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    margin: EdgeInsets.only(top:15,bottom: 32),
                    alignment: Alignment.centerLeft,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(2,2)
                          )
                        ],
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: [
                        Expanded(child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Check In",style: TextStyle(fontSize: width/20,color: Colors.black54),),
                              Text(CheckIn,style: TextStyle(fontSize: width/18,color: Colors.black54,fontWeight: FontWeight.bold))
                            ],
                          ),
                        )),
                        Expanded(child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Check Out",style: TextStyle(fontSize: width/20,color: Colors.black54)),
                              Text(CheckOut,style: TextStyle(fontSize: width/18,color: Colors.black54,fontWeight: FontWeight.bold))
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                          text: DateTime.now().day.toString(),
                          style: TextStyle(
                              fontSize: width/18,
                              color: Colors.blue
                          ),
                          children: [
                            TextSpan(
                                text: DateFormat(' MMMM yyyy').format(DateTime.now()),
                                style: TextStyle(fontSize: width/20,fontWeight: FontWeight.bold,color: Colors.black)
                            )
                          ]
                      ),
                    )
                ),
                StreamBuilder(
                    stream: Stream.periodic(const Duration(seconds: 1)),
                    builder: (context, snapshot) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(DateFormat('hh:mm:ss a').format(DateTime.now()),style: TextStyle(fontSize: width/20,color: Colors.black54),),
                      );
                    }
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)
                      ),
                      child: GestureDetector(
                        onTap: (){
                          checkIn();
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue
                          ),
                          child: Center(child: Text("Check In",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)
                      ),
                      child: GestureDetector(
                        onTap: (){
                          checkout();
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blue
                          ),
                          child: Center(child: Text("Check Out",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top:50),
                    child:Text('You have completed this day!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                ),
                location !="" ? Text("Location"+location) : SizedBox()
              ],
            ),
          ),
        )
    );
  }
  checkIn()async{
    print(DateFormat('hh:mm').format(DateTime.now()));
              if(UserModel.lat!=0){
                getLocation();
                QuerySnapshot snapshot=await FirebaseFirestore.instance.collection("students").where('id',isEqualTo: widget.userModel.email).get();
                DocumentSnapshot snap2=await FirebaseFirestore.instance.collection("students").doc(widget.userModel.email).collection("Time").doc(DateFormat('dd MMMM yyyy').format(DateTime.now())).get();
                try{
                  String CheckIn=snap2['CheckIn'];
                  setState(() {
                    CheckIn=DateFormat('hh:mm').format(DateTime.now());
                    //CheckOut=DateFormat('hh:mm').format(DateTime.now());
                  });
                  await FirebaseFirestore.instance.collection("students").doc(widget.userModel.email).collection("Time").doc(DateFormat(' dd MMMM yyyy').format(DateTime.now())).update(
                      {
                        'CheckIn':CheckIn,
                        //'CheckOut':CheckOut
                      });
                }catch(ex) {
                  setState(() {
                    CheckIn = DateFormat('hh:mm').format(DateTime.now());
                    //CheckOut = DateFormat('hh:mm').format(DateTime.now());
                  });
                  await FirebaseFirestore.instance.collection("students").doc(
                      widget.userModel.email).collection("Time").doc(
                      DateFormat(' dd MMMM yyyy').format(DateTime.now())).set(
                      {
                        'CheckIn': DateFormat('hh:mm').format(DateTime.now()),
                        'location':location
                        //'CheckOut': DateFormat('hh:mm').format(DateTime.now())
                      });
                }
              }
              else{
                Timer(Duration(seconds: 3), ()async{
                  getLocation();
                  QuerySnapshot snapshot=await FirebaseFirestore.instance.collection("students").where('id',isEqualTo: widget.userModel.email).get();
                  DocumentSnapshot snap2=await FirebaseFirestore.instance.collection("students").doc(widget.userModel.email).collection("Time").doc(DateFormat('dd MMMM yyyy').format(DateTime.now())).get();
                  try{
                    String CheckIn=snap2['CheckIn'];
                    setState(() {
                      CheckIn=DateFormat('hh:mm').format(DateTime.now());
                      //CheckOut=DateFormat('hh:mm').format(DateTime.now());
                    });
                    await FirebaseFirestore.instance.collection("students").doc(widget.userModel.email).collection("Time").doc(DateFormat(' dd MMMM yyyy').format(DateTime.now())).update(
                        {
                          'CheckIn':CheckIn,
                          //'CheckOut':CheckOut
                        });
                  }catch(ex) {
                    setState(() {
                      CheckIn = DateFormat('hh:mm').format(DateTime.now());
                      //CheckOut = DateFormat('hh:mm').format(DateTime.now());
                    });
                    await FirebaseFirestore.instance.collection("students").doc(
                        widget.userModel.email).collection("Time").doc(
                        DateFormat(' dd MMMM yyyy').format(DateTime.now())).set(
                        {
                          'CheckIn': DateFormat('hh:mm').format(DateTime.now()),
                          'location':location
                          //'CheckOut': DateFormat('hh:mm').format(DateTime.now())
                        });
                  }
                });
              }
  }

  checkout()async{
    print(DateFormat('hh:mm').format(DateTime.now()));
    if(UserModel.lat!=0){
      getLocation();
      QuerySnapshot snapshot=await FirebaseFirestore.instance.collection("students").where('id',isEqualTo: widget.userModel.email).get();
      DocumentSnapshot snap2=await FirebaseFirestore.instance.collection("students").doc(widget.userModel.email).collection("Time").doc(DateFormat('dd MMMM yyyy').format(DateTime.now())).get();
      try{
        String CheckOut=snap2['CheckIn'];
        setState(() {

          CheckOut=DateFormat('hh:mm').format(DateTime.now());
        });
        await FirebaseFirestore.instance.collection("students").doc(widget.userModel.email).collection("Time").doc(DateFormat(' dd MMMM yyyy').format(DateTime.now())).update(
            {
              //'CheckIn':CheckIn,
              'CheckOut':CheckOut
            });
      }catch(ex) {
        setState(() {
          //CheckIn = DateFormat('hh:mm').format(DateTime.now());
          CheckOut = DateFormat('hh:mm').format(DateTime.now());
        });
        await FirebaseFirestore.instance.collection("students").doc(
            widget.userModel.email).collection("Time").doc(
            DateFormat(' dd MMMM yyyy').format(DateTime.now())).set(
            {
              'CheckIn': DateFormat('hh:mm').format(DateTime.now()),
              'CheckOut': DateFormat('hh:mm').format(DateTime.now())
            });
      }
    }else{
      Timer(Duration(seconds: 3), ()async{
        getLocation();
        QuerySnapshot snapshot=await FirebaseFirestore.instance.collection("students").where('id',isEqualTo: widget.userModel.email).get();
        DocumentSnapshot snap2=await FirebaseFirestore.instance.collection("students").doc(widget.userModel.email).collection("Time").doc(DateFormat('dd MMMM yyyy').format(DateTime.now())).get();
        try{
          String CheckOut=snap2['CheckIn'];
          setState(() {

            CheckOut=DateFormat('hh:mm').format(DateTime.now());
          });
          await FirebaseFirestore.instance.collection("students").doc(widget.userModel.email).collection("Time").doc(DateFormat(' dd MMMM yyyy').format(DateTime.now())).update(
              {
                //'CheckIn':CheckIn,
                'CheckOut':CheckOut
              });
        }catch(ex) {
          setState(() {
            //CheckIn = DateFormat('hh:mm').format(DateTime.now());
            CheckOut = DateFormat('hh:mm').format(DateTime.now());
          });
          await FirebaseFirestore.instance.collection("students").doc(
              widget.userModel.email).collection("Time").doc(
              DateFormat(' dd MMMM yyyy').format(DateTime.now())).set(
              {
                'CheckIn': DateFormat('hh:mm').format(DateTime.now()),
                'CheckOut': DateFormat('hh:mm').format(DateTime.now())
              });
        }
      });
    }


  }
}
