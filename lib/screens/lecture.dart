//Wap in Flutter To Design A Computer Science Page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Lecture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var H=MediaQuery.of(context).size.height;
    var W=MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Stack(children: [
                      Container(
                        height: 300,
                        width: W,
                        child: Image.network('https://prod-discovery.edx-cdn.org/media/programs/card_images/e0de6882-c5d1-43f3-99e0-17e386489dca-9c3bda2df48f.jpg',
                            fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 230),
                        child: Stack(children: [
                          Container(
                            height: 200,
                            width: W,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 20, top: 20),
                            child: Text('Aishwarya College',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 50, start: 20),
                            child: Text('Faculty of Computer Science',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 90, start: 20),
                                    child: Text('4.5',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 18)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 90),
                                    child:
                                    Icon(Icons.star, color: Colors.yellow),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 70),
                                    child: Text('.',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40,
                                            color: Colors.grey)),
                                  ),
                                  SizedBox(width: 4),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        top: 95),
                                    child: Text('48K learners',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                            fontSize: 18)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width:W,
                                height: 50,
                                color: Colors.blue,
                                child: TabBar(
                                  tabs: [
                                    Tab(
                                      child: Text('Overview',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Tab(
                                      child: Text('Curriculum',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),

                                  ],
                                ),
                              ),
                              Container(
                                width: W,
                                height:600,
                                color: Colors.greenAccent,
                                child: TabBarView(
                                  children: [One(), Two(), ],
                                ),
                              )
                            ],
                          ),
                        ]),
                      ),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class One extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 20),
                  Image.network('https://cdn-icons-png.flaticon.com/512/3885/3885250.png',height:50),
                  SizedBox(width: 20),
                  Text('Completion certificate',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 20),
                  Icon(Icons.calendar_month,size: 50,color: Colors.black38),
                  SizedBox(width: 20),
                  Text('1 Year of Free Access',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 20),
                  Image.network('https://static.thenounproject.com/png/463940-200.png',height: 50,color: Colors.black38),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text('Graduation Level Course',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: 180),
                        child: Text('(1 Year)',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 20),
                  Image.network('https://cdn-icons-png.flaticon.com/512/806/806129.png',height: 50),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text('Enroll Now',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 20,
                width: double.infinity,
                color: Colors.black12,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 14),
                  Text('What will I learn?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 10),
                  Text('1.Bachelor of Computer Applications (B.C.A)',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  Text('          The BCA subjects cover programming languages\n          like C++ and JAVA, Networking, Fundamentals of\n          Computers, Multimedia Systems,Data Structure,\n          Web-Based Application Development, Web\n          Designing, and Software Engineering amongst\n          others.',style: TextStyle(fontSize: 15),),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
class Two extends StatelessWidget {
  var Curriculum=[
    {'tag':'Latest Updates'},
    {'tag':'Online Admission'},
    {'tag':'Examination Forms'},
    {'tag':'Results'},
    {'tag':'Syllabus'},
    {'tag':'College Notice Board'},
  ];

  @override
  Widget build(BuildContext context) {
    var H=MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
        body:  AnimationLimiter(
          child: ListView.builder(
            padding: EdgeInsets.all(_w / 30),
            physics:
            BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: Curriculum.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                delay: Duration(milliseconds: 100),
                child: SlideAnimation(
                  duration: Duration(milliseconds: 2500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  verticalOffset: -250,
                  child: ScaleAnimation(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: Container(
                      margin: EdgeInsets.only(bottom: _w / 20),
                      height: _w / 4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 20,),
                          CircleAvatar(
                            radius:30,
                            backgroundColor: Colors.greenAccent,
                          ),
                          SizedBox(width: 10,),
                          Text(Curriculum[index]['tag']!,style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
    );
  }
}

