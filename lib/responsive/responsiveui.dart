import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget_mobile;
  final  Widget_tablet;
  final  Widget_Desktop;
  const Responsive(
      {Key? key, @required this.Widget_mobile, @required this.Widget_Desktop, this.Widget_tablet})
      : super(key: key);
  static bool isMoblie(BuildContext context)=>MediaQuery.of(context).size.width<800;
  static bool isTablet(BuildContext context){
    return MediaQuery.of(context).size.width>=800 && MediaQuery.of(context).size.width<1200;
  }
  static bool isDesktop(BuildContext context){
    return MediaQuery.of(context).size.width>=1200;
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.maxWidth>=1200) {
        return Widget_Desktop;
      }
      else if(constraints.maxWidth>=800){
        return Widget_tablet??Widget_mobile;
      }else{
        return Widget_mobile;
      }
    });
  }
}
