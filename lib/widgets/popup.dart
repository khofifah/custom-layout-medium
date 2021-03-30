import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Popup {
  static void showFlushbar(BuildContext context, int status, String value) {
    IconData icon;
    Color color = Colors.blueAccent;
    if (status == 1) {
      icon = Icons.check;
      color = Colors.greenAccent;
    } else if (status == 0) {
      icon = Icons.warning;
      color = Colors.orangeAccent;
    }
    Flushbar(
      message: value,
      flushbarPosition: FlushbarPosition.TOP,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      duration: Duration(seconds: 3),
      icon: Icon(
        icon,
        color: color,
      ),
    )..show(context);
  }
}
