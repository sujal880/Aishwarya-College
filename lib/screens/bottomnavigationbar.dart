import 'package:aishwarya_college/screens/profile_page.dart';
import 'package:aishwarya_college/screens/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

// optional, only if using provided badge style
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';

import '../models/usermodel.dart';
import 'attendancescreen.dart';
import 'homescreen.dart';

class Bottom extends StatefulWidget {
  final UserModel userModel;
  final User firebaseuser;
  Bottom({required this.userModel, required this.firebaseuser});

  @override
  State<Bottom> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<Bottom> {
  int currentIndex = 0;
  List<IconData> navigationIcons = [Icons.home,Icons.check, Icons.account_circle_outlined];
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context,child){
      return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: [HomeScreen(userModel: widget.userModel,firebaseuser: widget.firebaseuser),
            AttendanceScreen(userModel: widget.userModel,firebaseuser: widget.firebaseuser),
            ProfileScreen(userModel: widget.userModel,firebaseuser: widget.firebaseuser)],
        ),

        bottomNavigationBar: MotionTabBar(
          initialSelectedTab: "Home",
          labels: const ["Home", "Attendance", "profile"],
          icons: navigationIcons,
          tabSize: 45,
          tabBarHeight: 50,
          textStyle: const TextStyle(
            fontSize: 13.5,
            color: Colors.black,
            decorationColor: Colors.greenAccent,
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: Colors.blue[600],
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
          tabSelectedColor: Colors.cyan,
          tabIconSelectedColor: Colors.white,
          tabBarColor: Colors.white,
          onTabItemSelected: (int value) {
            setState(() {
              currentIndex = value;
            });
          },
        ),

        /*bottomNavigationBar: Container(

        height: 70,
        margin: EdgeInsets.only(left: 12, right: 12, bottom: 24),
        decoration: BoxDecoration(

            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [

              BoxShadow(
                  color: Colors.black26, blurRadius: 10, offset: Offset(2, 2))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < navigationIcons.length; i++) ...<Expanded>{
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = i;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(navigationIcons[i],
                              color: i == currentIndex
                                  ? Colors.blue
                                  : Colors.black54,
                              size: i == currentIndex ? 30 : 24),
                          i == currentIndex
                              ? Container(
                            margin: const EdgeInsets.only(top: 6),
                            height: 3,
                            width: 24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue),
                          )
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ),
                )
              }
            ],
          ),
        ),
      )*/
      );
    });
  }
}