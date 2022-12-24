import 'dart:developer';

import 'package:aishwarya_college/screens/attendancescreen.dart';
import 'package:aishwarya_college/screens/login.dart';
import 'package:aishwarya_college/screens/profile_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/usermodel.dart';
class HomeScreen extends StatefulWidget {
  final UserModel userModel;
  final User firebaseuser;
  HomeScreen({required this.userModel,required this.firebaseuser});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  var Thorphy ="https://cdn-icons-png.flaticon.com/512/806/806129.png";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${widget.userModel.fullname}"),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.notification_add))
          ],
        ),
        drawer: Drawer(
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8)),
          ),
          width: MediaQuery.of(context).size.width/1.5,
          child: ListView(
            children: [
              DrawerHeader(
                curve: Curves.bounceIn,
                padding: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.white
                    ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomRight
                    )
                ), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.transparent
                  ),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    child: Text("${widget.userModel.fullname![0].toUpperCase()}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                    backgroundColor: Colors.blue,
                  ),

                  accountName: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text("${widget.userModel.fullname}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),

                  accountEmail: Text("${widget.userModel.email}"),
                  //circleAvatar
                ), //UserAccountDrawerHeader
              ), //DrawerHeader
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(' My Profile '),
                onTap: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>ProfileScreen(userModel: widget.userModel,firebaseuser: widget.firebaseuser)));
                },
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomeScreen(userModel: widget.userModel, firebaseuser: widget.firebaseuser)));
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_month),
                title: const Text('Attendance'),
                onTap: () {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>AttendanceScreen(userModel: widget.userModel, firebaseuser: widget.firebaseuser)));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  logOut();
                },
              ),
            ],
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              CarouselSlider(
                items: [
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      height: 170,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Image.network('https://scontent.fjai2-3.fna.fbcdn.net/v/t1.6435-9/107800325_100688835066344_5964871429207518037_n.png?_nc_cat=106&ccb=1-7&_nc_sid=e3f864&_nc_ohc=ikMDYVu-KiIAX-CqldT&_nc_ht=scontent.fjai2-3.fna&oh=00_AfA2Nxx2jqn7naQEe8ury8pKr_C6yxpvTnCjMf1XLndJdA&oe=63C62F4D',
                          fit: BoxFit.fill),
                    ),
                  ),
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: Container(
                        clipBehavior: Clip.antiAlias,
                        height: 170,
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14)),
                        child: Image.network('https://img.etimg.com/thumb/msid-88607879,width-300,imgsize-55812,,resizemode-4,quality-100/education.jpg',
                            fit: BoxFit.cover)),
                  ),
                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Container(
                        clipBehavior: Clip.antiAlias,
                        height: 170,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Image.network('https://leverageedublog.s3.ap-south-1.amazonaws.com/blog/wp-content/uploads/2019/11/23171737/Modern-Education.png',
                            fit: BoxFit.cover)),
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(milliseconds: 100),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text('Top Categories', style: TextStyle(fontSize: 26)),

                    ],
                  ),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,

                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 20,),
                        //For Lectures
                        Container(
                          height: 70,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient:  LinearGradient(
                                colors: [Colors.lightBlueAccent, Colors.white]),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: CircleAvatar(
                                  child: Icon(Icons.tv, size: 35, color: Colors.white),
                                  backgroundColor: Colors.white12,
                                  radius: 25,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text('Lectures',
                                  style: TextStyle(
                                      fontSize: 22, fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        //For AboutUs
                        Container(
                          height: 70,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                                colors: [Color(0xff7fc9b1), Colors.white]),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: CircleAvatar(
                                  child: FaIcon(FontAwesomeIcons.info,color: Colors.white,size: 35,),
                                  radius: 27,
                                  backgroundColor: Colors.white10,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text('About Us',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 22))
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        //For E-Libray
                        Container(
                          height: 70,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                                colors: [Colors.greenAccent, Colors.white]),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: CircleAvatar(
                                  child: Icon(Icons.menu_book_sharp,
                                      color: Colors.white, size: 35),
                                  backgroundColor: Colors.white24,
                                  radius: 25,
                                ),

                              ),
                              SizedBox(width: 8),
                              Text('E-Library',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 22))
                            ],
                          ),
                        ),
                        //For Extenal Links
                        SizedBox(width: 20,),
                        Container(
                          height: 70,
                          width: 217,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                                colors: [Colors.purpleAccent, Colors.white]),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: CircleAvatar(
                                  child: Image.network('https://user-images.githubusercontent.com/23284276/89722341-f8d5db80-d9be-11ea-9fa5-17f372b04859.png',
                                      height: 35),
                                  backgroundColor: Colors.black12,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text('External Links',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 22))
                            ],
                          ),
                        ),
                        SizedBox(width: 15,)

                      ],
                    ),
                  )
                ],
              ),
              //old code
              /*SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 24),
                    Stack(children: [
                      Container(
                        height: 70,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                              colors: [Colors.lightBlueAccent, Colors.white]),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.only(top: 15, start: 30),
                        child: Row(
                          children: [
                            CircleAvatar(
                              child: Image.asset('assets/images/info.png'),
                              radius: 20,
                            ),
                            SizedBox(width: 5),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 5),
                              child: Text('About Us',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 22)),
                            )
                          ],
                        ),
                      )
                    ]),
                    SizedBox(width: 20),
                    Stack(children: [
                      Container(
                        height: 70,
                        width: 210,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                                colors: [Colors.purpleAccent, Colors.white])),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.only(top: 15, start: 15),
                        child: Row(
                          children: [
                            CircleAvatar(
                              child: Image.asset('assets/images/external.png',
                                  height: 35),
                              backgroundColor: Colors.black12,
                            ),
                            SizedBox(width: 5),
                            InkWell(onTap:(){
                              //Navigator.push(context,MaterialPageRoute(builder:(context)=>ExternalLinks()));
                            },
                              child: Text('External Links',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 22)),
                            )
                          ],
                        ),
                      )
                    ]),
                    SizedBox(width: 25),
                    Stack(children: [
                      Container(
                        height: 70,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                                colors: [Colors.yellowAccent, Colors.white])),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.only(start: 20, top: 15),
                        child: Row(
                          children: [
                            CircleAvatar(
                              child:
                              Icon(Icons.tv, size: 35, color: Colors.black),
                              backgroundColor: Colors.black12,
                              radius: 20,
                            ),
                            SizedBox(width: 15),
                            Text('Lectures',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    ]),
                    SizedBox(width: 20),
                    Stack(children: [
                      Container(
                        height: 70,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                                colors: [Colors.greenAccent, Colors.white])),
                      ),
                      Padding(
                        padding:
                        const EdgeInsetsDirectional.only(top: 15, start: 20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              child: Icon(Icons.menu_book_sharp,
                                  color: Colors.black, size: 35),
                              backgroundColor: Colors.black12,
                              radius: 20,
                            ),
                            SizedBox(width: 15),
                            InkWell(onTap:(){
                              //Navigator.push(context,MaterialPageRoute(builder:(context)=>E_Library()));
                            },
                              child: Text('E-Library',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 22)),
                            )
                          ],
                        ),
                      )
                    ])
                  ],
                ),
              ),*/
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 15,
                      width: 400,
                      color: Colors.black12,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text('Our Courses', style: TextStyle(fontSize: 26)),
                  SizedBox(width: 130),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 7),
                        child: Text('SEE ALL',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.blue)),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 7),
                        child: Icon(Icons.arrow_circle_right,
                            color: Colors.blue, size: 20),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Arts()));
                            },
                            child: Container(
                              height: 260,
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black12),
                            ),
                          ),
                          Row(children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  top: 20, start: 20),
                              child: Text('Arts',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 30)),
                            ),
                          ]),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 180, top: 19),
                            child: Stack(children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.network("https://iotcdn.oss-ap-southeast-1.aliyuncs.com/subjects-in-arts.jpg",fit: BoxFit.cover,),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 20, top: 90),
                                child: Stack(children: [
                                  Container(
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.green),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 15, top: 2),
                                    child: Text('Arts',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  )
                                ]),
                              )
                            ]),
                          ),
                          BottomDetail(),
                          BottomDetailPadding(),
                          /*Row(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    top: 115, start: 20),
                                child: Text('4.5',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: 16)),
                              ),
                              SizedBox(width: 3),
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.only(top: 112),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                              ),
                              SizedBox(width: 3),
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.only(top: 117),
                                child: Text('48K learners',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey)),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 145, start: 20),
                            child: Stack(children: [
                              Container(
                                height: 20,
                                width: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.blueAccent),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    top: 2, start: 4),
                                child: Text('Video Lessons',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.only(top: 40),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                        child: Image.asset(
                                            'assets/images/trophy.png')),
                                    SizedBox(width: 6),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          top: 2),
                                      child: Text('Enroll Now',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 16)),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          )*/
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Stack(children: [
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Commerce()));
                          },
                          child: Container(
                            height: 260,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 20, start: 20),
                          child: Text('Commerce',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 185, top: 20),
                          child: Stack(children: [
                            Container(
                                clipBehavior: Clip.antiAlias,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child:Image.network("https://www.edumilestones.com/blog/images/commerce-subjects-11th-class.png",fit: BoxFit.fill,)
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 23, top: 90),
                              child: Stack(children: [
                                Container(
                                  height: 20,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.green),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 5, top: 4),
                                  child: Text('Commerce',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                )
                              ]),
                            )
                          ]),
                        ),
                        //old code
                        /*Row(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      top: 115, start: 20),
                                  child: Text('4.3K',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey)),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.only(top: 110),
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                SizedBox(width: 3),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.only(top: 95),
                                  child: Text('.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          color: Colors.grey)),
                                ),
                                SizedBox(width: 3),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.only(top: 115),
                                  child: Text('40K learners',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 145, start: 20),
                          child: Stack(children: [
                            Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.blue),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 3, top: 2),
                              child: Text(
                                'Video Lessons',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ]),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  top: 180, start: 20),
                              child: CircleAvatar(
                                child: Image.asset('assets/images/trophy.png'),
                              ),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 180),
                              child: Text('Enroll Now',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 16)),
                            )
                          ],
                        )*/
                        BottomDetail(),
                        BottomDetailPadding(),
                      ]),
                    ),
                    SizedBox(width: 20),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Stack(children: [
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Science()));
                          },
                          child: Container(
                            height: 260,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 20, start: 20),
                          child: Text('Science',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 185, top: 20),
                          child: Stack(children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.network("https://img.freepik.com/free-vector/hand-drawn-science-education-background_23-2148499325.jpg?w=1060&t=st=1671340333~exp=1671340933~hmac=e2501597eaaa4d4405e7efef32182cad255abc47149c38b4940c7ee5c25ff79f"
                                ,fit: BoxFit.fill,),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 23, top: 90),
                              child: Stack(children: [
                                Container(
                                  height: 20,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.green),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 13, top: 5),
                                  child: Text('Science',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                )
                              ]),
                            )
                          ]),
                        ),
                        //Old Code
                        /*Row(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      top: 115, start: 20),
                                  child: Text('4.3K',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey)),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.only(top: 110),
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                SizedBox(width: 3),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.only(top: 95),
                                  child: Text('.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          color: Colors.grey)),
                                ),
                                SizedBox(width: 3),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.only(top: 115),
                                  child: Text('40K learners',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 145, start: 20),
                          child: Stack(children: [
                            Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.blue),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 3, top: 2),
                              child: Text(
                                'Video Lessons',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ]),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  top: 180, start: 20),
                              child: CircleAvatar(
                                child: Image.asset('assets/images/trophy.png'),
                              ),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 180),
                              child: Text('Enroll Now',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 16)),
                            )
                          ],
                        )*/
                        BottomDetail(),
                        BottomDetailPadding()
                      ]),
                    ),
                    SizedBox(width: 20),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Stack(children: [
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => CScience()));
                          },
                          child: Container(
                            height: 260,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 20, start: 20),
                          child: Text('Computer\nScience',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 185, top: 20),
                          child: Stack(children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.network('https://tryengineering.org/wp-content/uploads/bigstock-Future-Artificial-Intelligence-366858865-1536x864.jpg',
                                  fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 23, top: 90),
                              child: Stack(children: [
                                Container(
                                  height: 20,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.green),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 10, top: 5),
                                  child: Text('CScience',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                )
                              ]),
                            )
                          ]),
                        ),
                        //Old Code
                        /*Row(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      top: 115, start: 20),
                                  child: Text('4.3K',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey)),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.only(top: 110),
                                  child: Icon(Icons.star, color: Colors.yellow),
                                ),
                                SizedBox(width: 3),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.only(top: 95),
                                  child: Text('.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          color: Colors.grey)),
                                ),
                                SizedBox(width: 3),
                                Padding(
                                  padding:
                                  const EdgeInsetsDirectional.only(top: 115),
                                  child: Text('40K learners',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 145, start: 20),
                          child: Stack(children: [
                            Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.blue),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 3, top: 2),
                              child: Text(
                                'Video Lessons',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ]),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  top: 180, start: 20),
                              child: CircleAvatar(
                                child: Image.asset('assets/images/trophy.png'),
                              ),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(top: 180),
                              child: Text('Enroll Now',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 16)),
                            )
                          ],
                        )*/

                        //new Changes
                        BottomDetail(),
                        BottomDetailPadding(),
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),

              SizedBox(height: 30,),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text('Our College', style: TextStyle(fontSize: 26)),
                  SizedBox(width: 140),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 7),
                    child: Text('SEE ALL',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 7),
                    child: Icon(Icons.arrow_circle_right,
                        color: Colors.blue, size: 20),
                  )
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Stack(children: [
                        Container(
                          height: 260,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black12),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 20, start: 20),
                          child: Text("Principal's\nMessage",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 185, top: 20),
                          child: Stack(children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset('assets/images/principal.jpg',
                                  fit: BoxFit.fill),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 23, top: 90),
                              child: Stack(children: [
                                Container(
                                  height: 20,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.green),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 5, top: 7),
                                  child: Text('Dr.Rishi Nepalia',
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                )
                              ]),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 140, start: 20),
                          child: Text(
                              'It gives me great pleasure to invite\nyou to take initial peek into the heart that\nbeats behind the appealing facade of\nAishwarya College.I thank you for your\ninterest in this exceptional institution.',
                              style: TextStyle(fontSize: 14)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 230, start: 180),
                          child: Text('-Dr.Rishi Nepalia',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ]),
                    ),
                    SizedBox(width: 20),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Stack(children: [
                        Container(
                          height: 260,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black12),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 20, start: 20),
                          child: Text("HOD's\nMessage",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 185, top: 20),
                          child: Stack(children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset('assets/images/naveensir.jpg',
                                  fit: BoxFit.fill),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 23, top: 90),
                              child: Stack(children: [
                                Container(
                                  height: 20,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.green),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 5, top: 7),
                                  child: Text('Mr.Naveen Joshi',
                                      style: TextStyle(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                )
                              ]),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 140, start: 20),
                          child: Text(
                              'It gives me great pleasure to invite\nyou to take initial peek into the heart that\nbeats behind the appealing facade of\nAishwarya College.I thank you for your\ninterest in this exceptional institution.',
                              style: TextStyle(fontSize: 14)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 230, start: 150),
                          child: Text('-Mr.Naveen Dutt Joshi',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ]),
                    ),
                    SizedBox(width: 20),
                    Card(
                      elevation: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Stack(children: [
                        Container(
                          height: 260,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black12),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 20, start: 20),
                          child: Text("Professor's\nMessage",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 185, top: 20),
                          child: Stack(children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(
                                  'assets/images/shailendrasir.jpg',
                                  fit: BoxFit.fill),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 16, top: 90),
                              child: Stack(children: [
                                Container(
                                  height: 20,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.green),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 7, top: 7),
                                  child: Text('Dr.Shailendra Purohit',
                                      style: TextStyle(
                                          fontSize: 6,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                )
                              ]),
                            ),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 140, start: 20),
                          child: Text(
                              'It gives me great pleasure to invite\nyou to take initial peek into the heart that\nbeats behind the appealing facade of\nAishwarya College.I thank you for your\ninterest in this exceptional institution.',
                              style: TextStyle(fontSize: 14)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 230, start: 150),
                          child: Text('-Dr.Shailendra Purohit',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width:20),
                  Text('Top Courses',style:TextStyle(fontSize:26)),
                  SizedBox(
                      width:130
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top:7),
                    child: Text('SEE ALL',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.blue)),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top:7),
                    child: Icon(Icons.arrow_circle_right,size:20,color:Colors.blue),
                  )
                ],
              ),
              SizedBox(height:30),
              Padding(
                padding: const EdgeInsetsDirectional.only(start:20),
                child: Column(
                  children: [
                    SizedBox(width:20),
                    Stack(
                        children:[
                          Card(
                            elevation:15,
                            shape:RoundedRectangleBorder(
                                borderRadius:BorderRadius.circular(12)
                            ),
                            child: Container(
                                height:180,
                                width:350,
                                decoration:BoxDecoration(
                                    borderRadius:BorderRadius.circular(12),
                                    color:Colors.black12
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top:30,start:20),
                            child: Text('Introduction to C',style:TextStyle(fontWeight:FontWeight.bold,fontSize:26)),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(top:74,start:20),
                                child: Text('4.6',style:TextStyle(fontWeight:FontWeight.bold,fontSize:16,color:Colors.grey)),
                              ),
                              SizedBox(width:5),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(top:70),
                                child: Icon(Icons.star,color:Colors.yellow),
                              ),
                              //SizedBox(width:5),
                              // Text('.',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.grey,fontSize:40)),
                              SizedBox(width:7),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(top:74),
                                child: Text('196K learners',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.grey)),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top:105,start:20),
                            child: Stack(
                                children:[
                                  Container(
                                      height:20,
                                      width:110,
                                      decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(6),
                                          color:Colors.blue
                                      )
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(top:2,start:4),
                                    child: Text('Video Lessons',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white)),
                                  )
                                ]
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(top:140,start:20),
                                child: Image.network(Thorphy,height:30),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(top:140,start:6),
                                child: Text('Enroll Now',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.grey,fontSize:16)),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start:230,top:35),
                            child: Stack(
                                children:[
                                  Container(
                                      clipBehavior: Clip.antiAlias,
                                      height:100,
                                      width:100,
                                      decoration:BoxDecoration(
                                        borderRadius:BorderRadius.circular(12),
                                      ),
                                      child:Image.network('https://yuvacourses.com/wp-content/uploads/2021/03/logo.png',fit:BoxFit.cover)
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(top:90,start:10),
                                    child: Stack(
                                        children:[
                                          Container(
                                              height:20,
                                              width:80,
                                              decoration:BoxDecoration(
                                                  borderRadius:BorderRadius.circular(12),
                                                  color:Colors.green
                                              )
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.only(start:5,top:2),
                                            child: Text('C language',style:TextStyle(fontWeight:FontWeight.bold,fontSize:14,color:Colors.white)),
                                          )
                                        ]
                                    ),
                                  )
                                ]
                            ),
                          )
                        ]
                    ),
                    SizedBox(height:20),
                    Stack(
                        children:[
                          Card(
                            elevation:15,
                            shape:RoundedRectangleBorder(
                                borderRadius:BorderRadius.circular(12)
                            ),
                            child: Container(
                                height:180,
                                width:350,
                                decoration:BoxDecoration(
                                    borderRadius:BorderRadius.circular(12),
                                    color:Colors.black12
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top:30,start:18),
                            child: Text('Introduction to C++',style:TextStyle(fontWeight:FontWeight.bold,fontSize:23)),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(top:74,start:20),
                                child: Text('4.6',style:TextStyle(fontWeight:FontWeight.bold,fontSize:16,color:Colors.grey)),
                              ),
                              SizedBox(width:5),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(top:70),
                                child: Icon(Icons.star,color:Colors.yellow),
                              ),
                              SizedBox(width:7),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(top:74),
                                child: Text('196K learners',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.grey)),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top:105,start:20),
                            child: Stack(
                                children:[
                                  Container(
                                      height:20,
                                      width:110,
                                      decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(6),
                                          color:Colors.blue
                                      )
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(top:2,start:4),
                                    child: Text('Video Lessons',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white)),
                                  )
                                ]
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(top:140,start:20),
                                child: Image.network(Thorphy,height:30),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(top:140,start:6),
                                child: Text('Enroll Now',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.grey,fontSize:16)),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start:230,top:35),
                            child: Stack(
                                children:[
                                  Container(
                                      clipBehavior: Clip.antiAlias,
                                      height:100,
                                      width:100,
                                      decoration:BoxDecoration(
                                        borderRadius:BorderRadius.circular(12),
                                      ),
                                      child:Image.network('https://w7.pngwing.com/pngs/46/626/png-transparent-c-logo-the-c-programming-language-computer-icons-computer-programming-source-code-programming-miscellaneous-template-blue.png',fit:BoxFit.cover)
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(top:90,start:10),
                                    child: Stack(
                                        children:[
                                          Container(
                                              height:20,
                                              width:80,
                                              decoration:BoxDecoration(
                                                  borderRadius:BorderRadius.circular(12),
                                                  color:Colors.green
                                              )
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.only(start:5,top:3),
                                            child: Text('C++ language',style:TextStyle(fontWeight:FontWeight.bold,fontSize:12,color:Colors.white)),
                                          )
                                        ]
                                    ),
                                  )
                                ]
                            ),
                          )
                        ]
                    ),
                    SizedBox(height:20),
                    Stack(
                        children:[
                          Card(
                            elevation:15,
                            shape:RoundedRectangleBorder(
                                borderRadius:BorderRadius.circular(12)
                            ),
                            child: Container(
                                height:180,
                                width:350,
                                decoration:BoxDecoration(
                                    borderRadius:BorderRadius.circular(12),
                                    color:Colors.black12
                                )
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top:30,start:20),
                            child: Text('DBMS',style:TextStyle(fontWeight:FontWeight.bold,fontSize:23)),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(top:74,start:20),
                                child: Text('4.6',style:TextStyle(fontWeight:FontWeight.bold,fontSize:16,color:Colors.grey)),
                              ),
                              SizedBox(width:5),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(top:70),
                                child: Icon(Icons.star,color:Colors.yellow),
                              ),
                              SizedBox(width:7),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(top:74),
                                child: Text('196K learners',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.grey)),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(top:105,start:20),
                            child: Stack(
                                children:[
                                  Container(
                                      height:20,
                                      width:110,
                                      decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(6),
                                          color:Colors.blue
                                      )
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(top:2,start:4),
                                    child: Text('Video Lessons',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white)),
                                  )
                                ]
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(top:140,start:20),
                                child: Image.network(Thorphy,height:30),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(top:140,start:6),
                                child: Text('Enroll Now',style:TextStyle(fontWeight:FontWeight.bold,color:Colors.grey,fontSize:16)),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start:230,top:35),
                            child: Stack(
                                children:[
                                  Container(
                                      clipBehavior: Clip.antiAlias,
                                      height:100,
                                      width:100,
                                      decoration:BoxDecoration(
                                        borderRadius:BorderRadius.circular(12),
                                      ),
                                      child:Image.network('https://katatechinfo.com/wp-content/uploads/2022/10/DBMS.jpg',fit:BoxFit.cover)
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(top:90,start:10),
                                    child: Stack(
                                        children:[
                                          Container(
                                              height:20,
                                              width:80,
                                              decoration:BoxDecoration(
                                                  borderRadius:BorderRadius.circular(12),
                                                  color:Colors.green
                                              )
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.only(start:25,top:3),
                                            child: Text('DBMS',style:TextStyle(fontWeight:FontWeight.bold,fontSize:12,color:Colors.white)),
                                          )
                                        ]
                                    ),
                                  )
                                ]
                            ),
                          )
                        ]
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

            ],
          ),

        ),


      ),
    );

  }
  Widget BottomDetail(){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
              top: 115, start: 20),
          child: Text('4.5',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 16)),
        ),
        SizedBox(width: 3),
        Padding(
          padding:
          const EdgeInsetsDirectional.only(top: 112),
          child: Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        ),
        SizedBox(width: 3),
        Padding(
          padding:
          const EdgeInsetsDirectional.only(top: 117),
          child: Text('48K learners',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
        )
      ],
    );
  }
  Widget BottomDetailPadding(){
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          top: 145, start: 20),
      child: Stack(children: [
        Container(
          height: 20,
          width: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.blueAccent),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
              top: 2, start: 4),
          child: Text('Video Lessons',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        Padding(
          padding:
          const EdgeInsetsDirectional.only(top: 40),
          child: Row(
            children: [
              CircleAvatar(
                  child: Image.network(
                      Thorphy)),
              SizedBox(width: 6),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 2),
                child: Text('Enroll Now',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 16)),
              ),
            ],
          ),
        )
      ]),
    );
  }
  Future logOut()async{
    await FirebaseAuth.instance.signOut().then((value) => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LogIn())));
    log("Log Out");
  }
}
/* */