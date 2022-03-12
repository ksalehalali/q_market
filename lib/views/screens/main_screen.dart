import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:q_market/views/screens/auth/register.dart';
import 'package:q_market/views/screens/home/home.dart';

import '../../Assistants/assistantMethods.dart';
import '../../Assistants/globals.dart';
import '../../controllers/address_location_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final AddressController addressController = Get.find();

  final List<Widget> screens = [
    const HomeScreen(),
    Register(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  int? currentTp = 0;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: NavigationBar(
            height: 55.0,
            backgroundColor: Colors.white,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            selectedIndex: currentTp!,
            onDestinationSelected: (index) {
              setState(() {
                currentScreen = screens[index];
                currentTp = index;
              });
            },
            animationDuration: Duration(milliseconds: 1),
            destinations: [
              NavigationBarTheme(
                  data: NavigationBarThemeData(
                      indicatorColor: Colors.grey.shade200,
                      labelTextStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 12,fontWeight: FontWeight.bold))),
                  child: NavigationDestination(
                    icon: Icon(Icons.home_outlined, color: myHexColor3),
                    label: 'Home',
                    selectedIcon: Icon(
                      Icons.home,
                      color: myHexColor,

                    ),

                  )),
              NavigationBarTheme(
                  data: NavigationBarThemeData(
                    indicatorColor: Colors.grey.shade200,
                    labelTextStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                    ),
                  ),
                  child: NavigationDestination(
                    icon:
                        Icon(Icons.category_outlined, color: myHexColor3),
                    label: 'Categories',
                    selectedIcon: Icon(Icons.category, color: myHexColor),
                  )),
              NavigationBarTheme(
                  data: NavigationBarThemeData(
                      indicatorColor: Colors.grey.shade200,
                      labelTextStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 12,fontWeight: FontWeight.bold))),
                  child: NavigationDestination(
                    icon: Icon(Icons.card_giftcard_outlined,
                        color: myHexColor3),
                    label: 'Clearance',
                    selectedIcon:
                        Icon(Icons.card_giftcard, color: myHexColor),
                  )),
              NavigationBarTheme(
                  data: NavigationBarThemeData(
                      indicatorColor: Colors.grey.shade200,
                      labelTextStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 12,fontWeight: FontWeight.bold))),
                  child: NavigationDestination(
                    icon: Icon(Icons.person_pin_outlined,
                        color: myHexColor3),
                    label: 'My Account',
                    selectedIcon:
                        Icon(Icons.person_pin_rounded, color: myHexColor),
                  )),
              NavigationBarTheme(
                  data: NavigationBarThemeData(
                      indicatorColor: Colors.grey.shade200,
                      labelTextStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
                  child: NavigationDestination(
                    icon: Icon(Icons.shopping_cart_checkout_outlined,
                        color: myHexColor3),
                    label: 'Cart',
                    selectedIcon:
                        Icon(Icons.shopping_cart, color: myHexColor),
                  )),
            ]));
  }
}
