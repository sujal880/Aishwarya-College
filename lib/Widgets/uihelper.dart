import 'package:flutter/material.dart';

class UiHelper {
  static ShowIndicator(context) {
    return showDialog(
        context: context,
        builder: (_) => Center(child: CircularProgressIndicator()));
  }
}
