import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_market/views/screens/home/search_area_des.dart';
import 'package:q_market/views/widgets/product_item.dart';
import '../../address/address_on_map.dart';
import '../../address/search_address_screen.dart';
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
      'title': "Food",
      "url":
          'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "Baby",
      "url":
          'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "Mobiles",
      "url":
          'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "Laptops",
      "url":
          'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "Sports",
      "url":
          'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "Televisions",
      "url":
          'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "Watches",
      "url":
          'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "Furniture",
      "url":
          'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "Laptops",
      "url":
      'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "Sports",
      "url":
      'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "Televisions",
      "url":
      'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "Watches",
      "url":
      'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
    {
      'title': "Furniture",
      "url":
      'assets/images/villaggio-mall-shopping-center-in-doha-qatar-with--1433715784114_rs.jpeg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = Get.size;

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            headHomeScreen(MediaQuery.of(context)),
            const SizedBox(
              height: 8.0,
            ),
            const SearchAreaDesign(),
            Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              height: screenSize.height - 212,
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
                        padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 6.0),
                        child: addressHomeScreen(MediaQuery.of(context)),
                      )),
                  SizedBox(height: 6.0,),


                  SizedBox(
                    height: 160.0,
                    width: double.infinity,
                    child: Carousel(
                      dotSize: 6.0,
                      dotSpacing: 15.0,
                      autoplayDuration: 4.seconds,
                      animationDuration: 500.milliseconds,
                      dotBgColor: Colors.transparent.withOpacity(0.1),
                      dotColor: Colors.white,
                      dotIncreasedColor: Colors.red,
                      dotPosition: DotPosition.bottomLeft,
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
                  SizedBox(height: 22.0,),
                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text('Shop by category',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                  ),
                  SizedBox(
                      height: 230, width: 400, child: _buildDepartmentsList()),

                  SizedBox(height: 1.0,),
                  const Padding(
                    padding:  EdgeInsets.only(top: 0.0,left: 0),
                    child: Text('Latest Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                  ),
                  _buildHorizontalListOfProducts()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDepartmentsList() {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        color: Colors.grey[50],
        child: GridView.builder(
          itemCount: deps.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          semanticChildCount: 0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 0.1,
              childAspectRatio: 1.3),
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.zero,
                child: DepartmentShapeTile(
                  assetPath: deps[index]['url'],
                  title: deps[index]['title'],
                ));
          },
        ),
      ),
    );
  }

  Widget _buildHorizontalListOfProducts() {
    final screenSize =Get.size;
    return SizedBox(
      height: screenSize.height *0.4 -28,
      child: FutureBuilder(
          builder: (context, data) => data.connectionState ==
                  ConnectionState.waiting
              ? SizedBox(
                  width: 110,
                  height: 110,
                  child: FittedBox(
                    child: CircularProgressIndicator.adaptive(
                      strokeWidth: 0.9,
                    ),
                  ),
                )
              : CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return ProductItemCard(image: deps[index]['url'],date: '22/22/2222',views: 2,country: 'kuwait',title: 'shirt',);
                      }, childCount:4,semanticIndexOffset: 2,),
                    )
                  ],
                )),
    );
  }
}
