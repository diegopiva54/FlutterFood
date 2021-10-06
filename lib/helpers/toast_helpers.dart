import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterFoodToast {
  static void error(String message,
      {toastLength = Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void success(String message,
      {toastLength = Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
