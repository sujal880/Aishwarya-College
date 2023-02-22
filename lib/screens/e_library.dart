import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class E_Library extends StatelessWidget {
  var ElArr=[
    {'tag':'Best open Acceess Resources'},
    {'tag':'International E-Book Platforms'},
    {'tag':'DELNET - Developing Library\nNetwork'},
  ];
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Library"),
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(_w / 30),
          physics:
          BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: ElArr.length,
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
                        Text(ElArr[index]['tag']!,style: TextStyle(
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