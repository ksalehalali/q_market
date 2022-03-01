import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_market/views/screens/home/search_area_des.dart';
import '../../address/address_on_map.dart';
import '../../widgets/departments_shpe.dart';
import 'address_area.dart';
import 'head_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map> deps = [
    {
      'title': "AAAA AAAA",
      "url":
          'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "BBBB BBB",
      "url":
          'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "CCCCC CCC",
      "url":
          'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "AAAA AAAA",
      "url":
          'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "BBBB BBB",
      "url":
          'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "CCCCC CCC",
      "url":
          'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = Get.size;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 46.0,
          ),
          headHomeScreen(MediaQuery.of(context)),
          const SizedBox(
            height: 8.0,
          ),
          const SearchAreaDesign(),
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            height: screenSize.height - 222,
            width: screenSize.width,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddressOnMap()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: addressHomeScreen(MediaQuery.of(context)),
                    )),
                SizedBox(
                  height: 246.0,
                  width: double.infinity,
                  child: Carousel(
                    dotSize: 6.0,
                    dotSpacing: 15.0,
                    autoplayDuration: 4.seconds,
                    animationDuration: 500.milliseconds,
                    dotBgColor: Colors.transparent.withOpacity(0.2),
                    dotColor: Colors.white,
                    dotIncreasedColor: Colors.red,
                    dotPosition: DotPosition.bottomCenter,
                    images: [
                      Image.asset(
                          'assets/images/digital-marketing-courses-in-qatar-featured-image.jpeg',
                          fit: BoxFit.cover),
                      Image.asset('assets/images/Ecommerce-in-Qatar.jpeg',
                          fit: BoxFit.cover),
                      Image.asset(
                          'assets/images/Qatar-Online-Marketing-Profile.jpeg',
                          fit: BoxFit.cover),
                      Image.asset(
                          'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg',
                          fit: BoxFit.cover),
                    ],
                  ),
                ),
                SizedBox(height: 300, child: _buildCategoriesList())
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesList() {
    return  Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GridView.builder(
        itemCount: deps.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        semanticChildCount: 1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
           mainAxisSpacing: 0,
           crossAxisSpacing: 0.5,
          childAspectRatio: 1.3
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.zero,
            child: DepartmentShapeTile(assetPath: deps[index]['url'],title: deps[index]['title'],)
          );
        },
      ),
    );
  }
}
