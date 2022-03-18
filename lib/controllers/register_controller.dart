
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Assistants/globals.dart';

class RegisterController extends GetxController {
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final signUpUsernameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final signUpConfirmPasswordController = TextEditingController();


  Future<void> makeLoginRequest () async{
    var head = {
      "Accept": "application/json",
      "content-type":"application/json"
    };

    var response = await http.post(Uri.parse(baseURL + "/api/Login"), body: jsonEncode(
      {
        "UserName": loginEmailController.text,
        "Password": loginPasswordController.text
      },
    ), headers: head
    ).timeout(const Duration(seconds: 20), onTimeout:(){
      Fluttertoast.showToast(
          msg: "The connection has timed out, Please try again!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white70,
          textColor: Colors.black,
          fontSize: 16.0
      );
      throw TimeoutException('The connection has timed out, Please try again!');
    });

    if(response.statusCode == 500) {
      Fluttertoast.showToast(
          msg: "Error 500",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white70,
          textColor: Colors.black,
          fontSize: 16.0);
    }
    else if (response.statusCode == 200){
      var jsonResponse = json.decode(response.body);
      if(jsonResponse["status"]){
        print("AAAAAAAAAAHHHHHHHHHH");
        print(jsonResponse["description"]);
        storeUserLoginPreference(jsonResponse["description"]["token"], jsonResponse["description"]["userName"], loginPasswordController.text, jsonResponse["description"]["id"]);
//        user.accessToken = jsonResponse["description"]["token"];
        print(jsonResponse["description"]["token"]);
//        Get.offAll(MainScreen(indexOfScreen: 0,));
//        Get.to(MainScreen(indexOfScreen: 0,));

      } else {
        Fluttertoast.showToast(
            msg: "Username and password do not match!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.white70,
            textColor: Colors.black,
            fontSize: 16.0);
      }
    }


  }

  Future<void> storeUserLoginPreference(token, username, password, id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', token);
    await prefs.setString('username', username);
    await prefs.setString('password', password);
    await prefs.setString('id', id);
  }


}