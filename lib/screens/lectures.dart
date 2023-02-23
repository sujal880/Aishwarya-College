import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
class Lectures extends StatefulWidget {
  const Lectures({Key? key}) : super(key: key);

  @override
  State<Lectures> createState() => _LecturesState();
}

class _LecturesState extends State<Lectures> {
  var AceArr=[
    {'tag':'BCA 1st : C Programming'},
    {'tag':'BCA 1st : FOC'},
    {'tag':'BCA 1st : Digital Electronics'},
    {'tag':'BCA 1st : Internet Technology'},
    {'tag':'BCA 2nd : C++'},
    {'tag':'BCA 2nd : CSA'},
    {'tag':'BCA 3rd : JAVA'},
    {'tag':'BCA 3rd : ASP.NET'},
    {'tag':'BCA 3rd : SAD'}

  ];
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lectures"),
          centerTitle: true,
          brightness: Brightness.dark,
        ),
        body: AnimationLimiter(
          child: ListView.builder(
            padding: EdgeInsets.all(_w / 30),
            physics:
            BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemCount: AceArr.length,
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
                          Text(AceArr[index]['tag']!,style: TextStyle(
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
      ),
    );
  }
}
