import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

Widget showMessageOK(BuildContext context,String title, String information) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.FLOATING,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor: Colors.red,
    backgroundGradient: LinearGradient(colors: [Colors.greenAccent[400]!, Colors.green]),
    isDismissible: false,
    duration: const Duration(seconds: 4),
    icon: const Icon(
      Icons.tag_faces_sharp,
      color: Colors.white,
      size: 35,
    ),
    showProgressIndicator: true,
    progressIndicatorBackgroundColor: Colors.greenAccent,
    titleText: Text(title,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
    messageText: Text(information,
      style: const TextStyle(
          fontSize: 18.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
  )..show(context);
}

Widget showMessageError(BuildContext context,String title, String information) {
  return Flushbar(
    flushbarPosition: FlushbarPosition.BOTTOM,
    flushbarStyle: FlushbarStyle.FLOATING,
    reverseAnimationCurve: Curves.decelerate,
    forwardAnimationCurve: Curves.elasticOut,
    backgroundColor: Colors.red,
    backgroundGradient: LinearGradient(colors: [Colors.redAccent[400]!, Colors.red]),
    isDismissible: false,
    duration: const Duration(seconds: 4),
    icon: const Icon(
      Icons.mood_bad,
      color: Colors.white,
      size: 35,
    ),
    showProgressIndicator: true,
    progressIndicatorBackgroundColor: Colors.redAccent,
    titleText: Text(title,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
    messageText: Text(information,
      style: const TextStyle(
          fontSize: 18.0,
          color: Colors.white,
          fontFamily: "ShadowsIntoLightTwo"),
    ),
  )..show(context);
}
