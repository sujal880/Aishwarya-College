import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UiHelper {
  static ShowIndicator(context) {
    return showDialog(
        context: context,
        builder: (_) => Lottie.asset("assets/animation/94379-loading-animation.json"));
  }
}
