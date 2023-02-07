import 'dart:developer';

import 'package:aishwarya_college/screens/attendancescreen.dart';
import 'package:aishwarya_college/screens/lecture.dart';
import 'package:aishwarya_college/screens/login.dart';
import 'package:aishwarya_college/screens/profile_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Image.network('https://assets.telegraphindia.com/telegraph/2022/Mar/1646209810_science-scholarship1.jpg',
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
                      children: [
                        SizedBox(width: 20,),
                        //For AboutUs
                        Container(
                          height: 70,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                                colors: [Colors.lightBlue, Colors.white]),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Image.network("https://github.com/sujal880/College_App/blob/master/assets/images/info.png?raw=true",height: 40)
                              ),
                              SizedBox(width: 12),
                              Text('About Us',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 22))
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        //For Lecture
                        Container(
                          height: 70,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient:  LinearGradient(
                                colors: [Colors.purpleAccent, Colors.white]),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: CircleAvatar(
                                  child: Icon(Icons.tv, size: 35, color: Colors.black),
                                  backgroundColor: Colors.black12,
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
                        //For E-Libray
                        Container(
                          height: 70,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                                colors: [Colors.yellowAccent, Colors.white]),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: CircleAvatar(
                                  child: Icon(Icons.menu_book_sharp,
                                      color: Colors.black, size: 35),
                                  backgroundColor: Colors.black12,
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
                          width: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                                colors: [Colors.greenAccent, Colors.white]),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 11),
                                child: CircleAvatar(
                                  radius: 25,
                                  child: Image.network('https://github.com/sujal880/College_App/blob/master/assets/images/external.png?raw=true',
                                      height: 34,color: Colors.black),
                                  backgroundColor: Colors.black12,
                                ),
                              ),
                              SizedBox(width: 5),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Lecture()));
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
                              child: Text('BCA Ist\nYear',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize:30)),
                            ),
                          ]),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 180, top: 19),
                            child: Stack(children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                height: 108,
                                width: 108,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                //child: Image.network("https://iotcdn.oss-ap-southeast-1.aliyuncs.com/subjects-in-arts.jpg",fit: BoxFit.cover,),
                                child:Image.network("https://m.media-amazon.com/images/I/717-4TXKe9L.png")
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 6.0, top: 98),
                                child: Stack(children: [
                                  Container(
                                    height: 20,
                                    width: 95,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.green),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 0, top: 2),
                                    child: Text('BCA Ist Year',
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
                          child: Text('BCA IInd\nYear',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 185, top: 20),
                          child: Stack(children: [
                            Container(
                                clipBehavior: Clip.antiAlias,
                                height: 105,
                                width: 105,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                //child:Image.network("https://www.edumilestones.com/blog/images/commerce-subjects-11th-class.png",fit: BoxFit.fill,)
                                child:Image.network("https://technoindiauniversity.ac.in/ComputerApplication/images/school-of-computer-application1.jpg",fit: BoxFit.fill,)
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 4, top: 95),
                              child: Stack(children: [
                                Container(
                                  height: 20,
                                  width: 97,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.green),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 0, top: 2),
                                  child: Text('BCA IInd Year',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                )
                              ]),
                            )
                          ]),
                        ),
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
                          child: Text('BCA IIIrd\nYear',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 185, top: 20),
                          child: Stack(children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              height: 105,
                              width: 105,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              //child: Image.network("https://img.freepik.com/free-vector/hand-drawn-science-education-background_23-2148499325.jpg?w=1060&t=st=1671340333~exp=1671340933~hmac=e2501597eaaa4d4405e7efef32182cad255abc47149c38b4940c7ee5c25ff79f",fit: BoxFit.fill,),
                              child: Image.network("https://assets.telegraphindia.com/telegraph/2022/Mar/1647929416_resized-pic25.jpg",fit: BoxFit.fill,),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 4, top: 93),
                              child: Stack(children: [
                                Container(
                                  height: 20,
                                  width: 95,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.green),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 0, top: 2),
                                  child: Text('BCA IIrd Year',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                )
                              ]),
                            )
                          ]),
                        ),
                        BottomDetail(),
                        BottomDetailPadding()
                      ]),
                    ),
                    /*SizedBox(width: 20),
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
                        //new Changes
                        BottomDetail(),
                        BottomDetailPadding(),
                      ]),
                    ),*/
                  ],
                ),
              ),
              SizedBox(height: 40),

              SizedBox(height: 30,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Text('Our College', style: TextStyle(fontSize: 26)),
                  SizedBox(width: 135.w),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 7),
                    child: Text('SEE ALL',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 7,start: 3),
                    child: Icon(Icons.arrow_circle_right,
                        color: Colors.blue, size: 20),
                  )
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20,),
                    OurCollegePerson(Post: "Principal's\nMessage", ImageUrl: "https://www.aishwaryacollege.edu.in/theme/RishiNepalia.jpg", Sheight: 25,Left: 162,
                        SirName: "Dr.Rishi Nepalia",
                        Message: "'It gives me great pleasure to invite\nyou to take initial peek into the heart that\nbeats behind the appealing facade of\nAishwarya College.I thank you for your\ninterest in this exceptional institution.",
                        TagName: "-Dr.Rishi Nepalia"),
                    SizedBox(width: 20,),
                    OurCollegePerson(Post:"HOD's\nMessage",Sheight: 43,Left: 120,
                        ImageUrl: "https://www.aishwaryacollege.edu.in/images/faculty/162685674518.jpg", SirName: "Mr.Naveen Joshi",
                        Message:'It gives me great pleasure to invite\nyou to take initial peek into the heart that\nbeats behind the appealing facade of\nAishwarya College.I thank you for your\ninterest in this exceptional institution.',
                        TagName: "-Mr.Naveen Dutt Joshi"),
                    SizedBox(width: 20,),
                    OurCollegePerson(Post: "Professor's\nMessage",Left: 125,
                        ImageUrl: 'https://www.aishwaryacollege.edu.in/images/faculty/162685684319.jpg', SirName: 'Dr.Shailendra Purohit',
                        Message: 'It gives me great pleasure to invite\nyou to take initial peek into the heart that\nbeats behind the appealing facade of\nAishwarya College.I thank you for your\ninterest in this exceptional institution.',
                        TagName: '-Dr.Shailendra Purohit', Sheight: 10)
                  ],
                ),
              ),
              SizedBox(height: 15,)
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

  Widget OurCollegePerson({required Post,required ImageUrl,required SirName, required Message , required TagName,required double Sheight,required double Left}){
    return Container(
      height: 260,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black12
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 17,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(Post,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30)),
                SizedBox(width: Sheight,),
                Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.network(ImageUrl,
                          fit: BoxFit.fill),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 88,left: 5),
                      child: Container(
                        height: 20,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.green),
                        child: Center(
                          child: Text(SirName,
                              style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12,),
            Text(
                Message,
                style: TextStyle(fontSize: 14)),
            SizedBox(height: 5,),
            Padding(
              padding: EdgeInsets.only(left: Left),
              child: Text(TagName,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}