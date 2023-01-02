import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CourseSelect extends StatefulWidget {
  final selectedCourse;
  CourseSelect({required this.selectedCourse});
  @override
  State<CourseSelect> createState() => CourseSelectList();

}

class CourseSelectList extends State<CourseSelect> {
  final List<String> course = ['B.C.A', 'M.C.A', 'B.A', 'B.COM', 'M.COM'];
  var checkCourse = TextEditingController();
  void Select(){
    checkCourse=widget.selectedCourse;
    String select=checkCourse.text.trim();
    if(select=='B.C.A'){
      print(select);
    }
  }
  @override

  void dispose() {
    checkCourse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Select();
      },
      child: CustomDropdown(
        items: course,
        selectedStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        hintText: "Select Course",
        hintStyle: TextStyle(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
        controller: checkCourse,
        fieldSuffixIcon: Icon(Icons.school,size: 25,),
        excludeSelected: false,
         fillColor: Colors.black12,

      ),
    );
  }
}
