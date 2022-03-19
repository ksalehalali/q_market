import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:q_market/views/screens/auth/register.dart';
import 'package:q_market/views/screens/home/home.dart';

import '../../Assistants/assistantMethods.dart';
import '../../Assistants/globals.dart';
import '../../controllers/address_location_controller.dart';
import 'categories/categories_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final AddressController addressController = Get.find();

  final List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const Register(),
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
                          MaterialStateProperty.all(TextStyle(fontSize: 11,fontWeight: FontWeight.bold))),
                  child: NavigationDestination(
                    icon:  SvgPicture.asset(
                        'assets/icons/home-fill.svg',
                        color: Colors.grey[600],
                        height: 22.00,
                        width: 22.0,
                        semanticsLabel: 'A red up arrow'
                    ),
                    label: 'Home',
                    selectedIcon:  SvgPicture.asset(
                        'assets/icons/home-fill.svg',
                        height: 22.00,
                        width: 22.0,
                        color:myHexColor3,
                        semanticsLabel: 'A red up arrow'
                    ),

                  )),
              NavigationBarTheme(
                  data: NavigationBarThemeData(
                    indicatorColor: Colors.grey.shade200,
                    labelTextStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 11,fontWeight: FontWeight.bold),
                    ),
                  ),
                  child: NavigationDestination(
                    icon:
                    SvgPicture.asset(
                        'assets/icons/categories-outline.svg',
                        color: Colors.grey[600],
                        height: 22.00,
                        width: 22.0,
                        semanticsLabel: 'A red up arrow'
                    ),
                    label: 'Categories',
                    selectedIcon: SvgPicture.asset(
                        'assets/icons/categories-fill.svg',
                        color: myHexColor3,
                        height: 22.00,
                        width: 22.0,
                        semanticsLabel: 'A red up arrow'
                    ),
                  )),
              NavigationBarTheme(
                  data: NavigationBarThemeData(
                      indicatorColor: Colors.grey.shade200,
                      labelTextStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 11,fontWeight: FontWeight.bold))),
                  child: NavigationDestination(
                    icon: SvgPicture.asset(
                        'assets/icons/offers-outline.svg',
                        color: Colors.grey[600],
                        height: 22.00,
                        width: 22.0,
                        semanticsLabel: 'A red up arrow'
                    ),
                    label: 'Clearance',
                    selectedIcon:
                    SvgPicture.asset(
                        'assets/icons/offers-fill.svg',
                        color: Colors.red,
                        height: 22.00,
                        width: 22.0,
                        semanticsLabel: 'A red up arrow'
                    ),
                  )),
              NavigationBarTheme(
                  data: NavigationBarThemeData(
                      indicatorColor: Colors.grey.shade200,
                      labelTextStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 11,fontWeight: FontWeight.bold))),
                  child: NavigationDestination(
                    icon: SvgPicture.asset(
                        'assets/icons/cart-outline.svg',
                        color: Colors.grey[600],
                        height: 22.00,
                        width: 22.0,
                        semanticsLabel: 'A red up arrow'
                    ),
                    label: 'Cart',
                    selectedIcon:
                    SvgPicture.asset(
                        'assets/icons/cart-fill.svg',
                        height: 22.00,
                        width: 22.0,
                        color: Colors.red,
                        semanticsLabel: 'A red up arrow'
                    ),
                  )),
              NavigationBarTheme(
                  data: NavigationBarThemeData(
                      indicatorColor: Colors.grey.shade200,
                      labelTextStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 11, fontWeight: FontWeight.bold))),
                  child: NavigationDestination(
                    icon: SvgPicture.asset(
                        'assets/icons/account-outline.svg',
                        height: 22.00,
                        width: 22.0,
                        color: Colors.grey[600],
                        semanticsLabel: 'A red up arrow'
                    ),
                    label: 'My Account',
                    selectedIcon:
                    SvgPicture.asset(
                        'assets/icons/account-fill.svg',
                        height: 22.00,
                        width: 22.0,
                        color: Colors.red,
                        semanticsLabel: 'A red up arrow'
                    ),
                  )),
            ]));
  }
}
