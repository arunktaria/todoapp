import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:ffi';

import 'package:internet_connection_checker/internet_connection_checker.dart';

InputDecoration getEditFieldDecoration(String hint){
  return InputDecoration(hintText: hint,border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))));
}


   late String emailtxt;
  bool validateEmail(emailtxt){
    final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailtxt);
    return emailValid;
  }
   late String psswdTxt;
   bool validatePassword(psswdTxt){
     final bool psswdValid = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
         .hasMatch(psswdTxt);
     return psswdValid;
   }

   Future<bool> getInternetConnection() async {
     bool result = await InternetConnectionChecker().hasConnection;
     if(result == true) {
       return true;
       print('YAY! Free cute dog pics!');
     } else {
       return false;
     }
   }

   void showMessage(String msg,BuildContext context){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       content: Text(msg),
     ));
   }

   void showToast(String msg)
   {
     Fluttertoast.showToast(
         msg: msg,
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.CENTER,
         timeInSecForIosWeb: 1,
         textColor: Colors.white,
         fontSize: 16.0
     );
   }