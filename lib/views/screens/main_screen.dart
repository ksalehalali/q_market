import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:q_market/views/screens/home/home.dart';

import '../../Assistants/assistantMethods.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();
  var location = Location();
  LatLng myCurrentLoc = LatLng(0.0,0.0 );
  var assistantMethods = AssistantMethods();

  void locatePosition() async {
    var currentLocation = await location.getLocation();
    myCurrentLoc = LatLng(currentLocation.latitude!, currentLocation.longitude!);
    print(currentLocation);
    assistantMethods.searchCoordinateAddress(LatLng(myCurrentLoc.latitude, myCurrentLoc.longitude), context, false);


  }
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
            height: 62.0,
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
                          MaterialStateProperty.all(TextStyle(fontSize: 13))),
                  child: NavigationDestination(
                    icon: Icon(Icons.home_outlined, color: Colors.blue[900]),
                    label: 'Home',
                    selectedIcon: Icon(
                      Icons.home,
                      color: Colors.blue[900],

                    ),

                  )),
              NavigationBarTheme(
                  data: NavigationBarThemeData(
                    indicatorColor: Colors.grey.shade200,
                    labelTextStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 13),
                    ),
                  ),
                  child: NavigationDestination(
                    icon:
                        Icon(Icons.category_outlined, color: Colors.blue[900]),
                    label: 'Categories',
                    selectedIcon: Icon(Icons.category, color: Colors.blue[900]),
                  )),
              NavigationBarTheme(
                  data: NavigationBarThemeData(
                      indicatorColor: Colors.grey.shade200,
                      labelTextStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 13))),
                  child: NavigationDestination(
                    icon: Icon(Icons.card_giftcard_outlined,
                        color: Colors.blue[900]),
                    label: 'clearance',
                    selectedIcon:
                        Icon(Icons.card_giftcard, color: Colors.blue[900]),
                  )),
              NavigationBarTheme(
                  data: NavigationBarThemeData(
                      indicatorColor: Colors.grey.shade200,
                      labelTextStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 13))),
                  child: NavigationDestination(
                    icon: Icon(Icons.person_pin_outlined,
                        color: Colors.blue[900]),
                    label: 'My Account',
                    selectedIcon:
                        Icon(Icons.person_pin_rounded, color: Colors.blue[900]),
                  )),
              NavigationBarTheme(
                  data: NavigationBarThemeData(
                      indicatorColor: Colors.grey.shade200,
                      labelTextStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 13))),
                  child: NavigationDestination(
                    icon: Icon(Icons.shopping_cart_checkout_outlined,
                        color: Colors.blue[900]),
                    label: 'Cart',
                    selectedIcon:
                        Icon(Icons.shopping_cart, color: Colors.blue[900]),
                  )),
            ]));
  }
}
