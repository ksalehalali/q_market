
// ignore_for_file: sized_box_for_whitespace, prefer_final_fields, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Assistants/globals.dart';
import '../../../controllers/register_controller.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final registerController = Get.put(RegisterController());

  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final signUpUsernameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUpPasswordController = TextEditingController();
  final signUpConfirmPasswordController = TextEditingController();


  RxBool showSignUp = false.obs;
  bool moveWidgets = false;
  bool instantlyTransitionedWidgets = false;
  bool disabilitySwitch = false; // When false, login text fields are not disabled, sign up text fields are.
  double stackHeight = Get.size.height * 0.8;

  double opacity = 1.0;

  List<Widget> stackItems = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stackItems = [
//       TOGGLE SIGN UP
      Obx(() =>  AnimatedOpacity(
        opacity: showSignUp.value ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 0),
        child: Column(
          children: [
            const SizedBox(height: 32,),
            // WELCOME
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Create A New Account",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),
              ),
            ),
            const SizedBox(height: 32,),
            // USERNAME TEXT FIELD
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Username",
                  style: TextStyle(
                    color: myHexColor2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Theme(
                  data: ThemeData.from(
                    colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColorSwatch),
                  ),
                  child: TextField(
                    controller: registerController.signUpUsernameController,
                    enabled: showSignUp.value,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            // EMAIL TEXT FIELD
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: TextStyle(
                    color: myHexColor2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Theme(
                  data: ThemeData.from(
                    colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColorSwatch),
                  ),
                  child: TextField(
                    controller: registerController.signUpEmailController,
                    enabled: showSignUp.value,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            // PASSWORD TEXT FIELD
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Password",
                  style: TextStyle(
                    color: myHexColor2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Theme(
                  data: ThemeData.from(
                    colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColorSwatch),
                  ),
                  child: TextField(
                    controller: registerController.signUpPasswordController,
                    enabled: showSignUp.value,
                    obscureText: true,
                    decoration: InputDecoration(
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            // PASSWORD CONFIRM TEXT FIELD
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Confirm Password",
                  style: TextStyle(
                    color: myHexColor2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Theme(
                  data: ThemeData.from(
                    colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColorSwatch),
                  ),
                  child: TextField(
                    controller: registerController.signUpConfirmPasswordController,
                    enabled: showSignUp.value,
                    obscureText: true,
                    decoration: InputDecoration(
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32,),
          ],
        ),
      ),),

//       TOGGLE LOGIN
    Obx(() =>  AnimatedOpacity(
        opacity: !showSignUp.value ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Column(
          children: [
            const SizedBox(height: 32,),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Welcome again !",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),
              ),
            ),
            const SizedBox(height: 32,),
            // EMAIL TEXT FIELD
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: TextStyle(
                    color: myHexColor2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Theme(
                  data: ThemeData.from(
                    colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColorSwatch),
                  ),
                  child: TextField(
                    controller: registerController.loginEmailController,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            // PASSWORD TEXT FIELD
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Password",
                  style: TextStyle(
                    color: myHexColor2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Theme(
                  data: ThemeData.from(
                    colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColorSwatch),
                  ),
                  child: TextField(
                    controller: registerController.loginPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                    ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            // FORGOT PASSWORD?
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.topRight,
                child: const Text(
                  "Forgot Password ?",
                ),
              ),
            ),
            const SizedBox(height: 32,),
          ],
        ),
      ),),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            width: Get.size.width,
            height: Get.size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16,),
                  // CLOSE
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  // LOGIN / SIGN UP SWITCH
                  Container(
                    width: Get.size.width,
                    height: stackHeight,
                    child: Stack(
                      children: [
                        stackItems[0],
                        stackItems[1],
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: moveWidgets ? 450 : 300,
                          child: Column(
                            children: [
                              // LOGIN / SIGN UP BUTTON
                              Container(
                                height: 60,
                                width: Get.size.width,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(myHexColor2),
                                  ),
                                  onPressed: () async{
                                    if(!instantlyTransitionedWidgets){
                                      print("ssss");
                                      await registerController.makeLoginRequest();
                                    }
                                  },
                                  child: Text(
                                    !instantlyTransitionedWidgets ? "Login": "Create A New Account",
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32,),
                              // LOGIN OPTION TEXT
                              const Text(
                                "Or login via social media account",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(height: 32,),
                              // SOCIAL MEDIA OPTIONS
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // FACEBOOK
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black12,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    child: SvgPicture.asset("${assetsDir}facebook.svg", width: 25,),
                                  ),
                                  const SizedBox(width: 32,),
                                  // GOOGLE
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black12,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    child: SvgPicture.asset("${assetsDir}google.svg", width: 25,),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16,),
                              // NEW USER / ALREADY HAVE AN ACCOUNT
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "New User?  ",
                                    style: TextStyle(

                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        registerController.loginEmailController.text = "";
                                        registerController.loginPasswordController.text = "";
                                        registerController.signUpUsernameController.text = "";
                                        registerController.signUpEmailController.text = "";
                                        registerController.signUpPasswordController.text = "";
                                        registerController.signUpConfirmPasswordController.text = "";

                                        Widget temp = stackItems[0];
                                        stackItems[0] = stackItems[1];
                                        stackItems[1] = temp;

                                        instantlyTransitionedWidgets = !instantlyTransitionedWidgets;
                                        if(!moveWidgets){
                                          opacity = 1.0;
                                          stackHeight = Get.size.height * 1.0;
                                          moveWidgets = !moveWidgets;
                                          Future.delayed(const Duration(milliseconds: 500), () {
                                            setState(() {
                                              showSignUp.value = !showSignUp.value;
                                              print("moveWidgets: ${moveWidgets} showSignUp: ${showSignUp.value}");
                                            });
                                          });
                                        } else {
                                          opacity = 1.0;
                                          showSignUp.value = !showSignUp.value;
                                          print("moveWidgets: ${moveWidgets} showSignUp: ${showSignUp.value}");
                                          Future.delayed(const Duration(milliseconds: 500), () {
                                            setState(() {
                                              moveWidgets = !moveWidgets;
                                              Future.delayed(const Duration(milliseconds: 500), () {
                                                setState(() {
                                                  stackHeight = Get.size.height * 0.80;
                                                });
                                              });
                                            });
                                          });
                                        }

                                      });
                                    },
                                    child: Text(
                                      "Create a new account",
                                      style: TextStyle(
                                        color: myHexColor2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40,),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
