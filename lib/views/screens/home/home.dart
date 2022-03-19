import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_market/Assistants/globals.dart';
import 'package:q_market/controllers/address_location_controller.dart';
import 'package:q_market/controllers/product_controller.dart';
import 'package:q_market/views/screens/home/search_area_des.dart';
import 'package:q_market/views/screens/show_product/product_item.dart';
import '../../address/address_on_map.dart';
import '../../address/search_address_screen.dart';
import '../../widgets/departments_shpe.dart';
import '../../widgets/horizontal_listOfProducts.dart';
import 'address_area.dart';
import 'head_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductsController productController = Get.find();
  final AddressController addressController = Get.find();

  ScrollController? scrollController;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
    scrollController!.addListener(listenBottom);
  }
  void listenBottom() {
    print('scroll 200');
    //final direction = controller.position.userScrollDirection;
    if (scrollController!.position.pixels >= 200) {
      addressController.showHideAddress(false);

    } else {
      addressController.showHideAddress(true);
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController!.removeListener(listenBottom);
    scrollController!.dispose();
  }
  @override

  Widget build(BuildContext context) {
    final screenSize = Get.size;

    return Container(
      color: myHexColor5,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                headHomeScreen(MediaQuery.of(context)),
                const SizedBox(
                  height: 6.0,
                ),
                const SearchAreaDesign(),
                const SizedBox(
                  height: 4.0,
                ),
                Obx(()=> AnimatedContainer(
                  duration: 400.milliseconds,
                  height: addressController.addressWidgetSize.value,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddressOnMap()));
                    },
                    child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 6.0),
                          child: addressHomeScreen(MediaQuery.of(context)),
                        ),
                      ),
                    )),
                Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  height: screenSize.height - 212,
                  width: screenSize.width,
                  child: ListView(
                    controller: scrollController,
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(
                        height: 16.0,
                      ),
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
                      SizedBox(
                        height: 22.0,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          'Shop by category',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      SizedBox(
                          height: 230, width: 400, child: _buildDepartmentsList()),
                      SizedBox(
                        height: 1.0,
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 0.0,
                              left: 12,
                            ),
                            child: Text(
                              'Latest Products',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 0.0, left: 12, right: 5.0),
                            child: Text(
                              'View all',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.grey[700]),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14,
                            color: Colors.grey[700],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      buildHorizontalListOfProducts(false),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 0.0, left: 12),
                            child: Text(
                              'Recommended for you',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 0.0, left: 12, right: 5.0),
                            child: Text(
                              'View all',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.grey[700]),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14,
                            color: Colors.grey[700],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      _buildHorizontalListOfRecommendedProducts(),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 0.0, left: 12),
                            child: Text(
                              'Offers',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding:
                                EdgeInsets.only(top: 0.0, left: 12, right: 5.0),
                            child: Text(
                              'View all',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.grey[700]),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 14,
                            color: Colors.grey[700],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      _buildHorizontalListOfOffersProducts(),
                      SizedBox(
                        height: 22,
                      ),
                      _buildOfferArea()
                    ],
                  ),
                ),
              ],
            ),
          ),
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



  Widget _buildHorizontalListOfRecommendedProducts() {
    final screenSize = Get.size;
    return SizedBox(
      height: screenSize.height * 0.4 - 28,
      child: FutureBuilder(
        future: productController.getLatestProducts(),
          builder: (context, data) =>
              data.connectionState == ConnectionState.waiting
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
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return ProductItemCard(
                                  product: productController.latestProducts[index],fromDetails: false,);
                            },
                            childCount: 3,
                            semanticIndexOffset: 2,
                          ),
                        )
                      ],
                    )),
    );
  }

  Widget _buildHorizontalListOfOffersProducts() {
    final screenSize = Get.size;
    return SizedBox(
      height: screenSize.height * 0.4 - 28,
      child: FutureBuilder(
        future: productController.getLatestProducts(),
          builder: (context, data) =>
              data.connectionState == ConnectionState.waiting
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
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return ProductItemCard(
                                  product: productController.latestProducts[index],fromDetails: false,
                              );
                            },
                            childCount: 3,
                            semanticIndexOffset: 2,
                          ),
                        )
                      ],
                    )),
    );
  }

  Widget _buildOfferArea() {
    final screenSize = Get.size;
    return InkWell(
      onTap: (){
        print('tap');
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 22.0),
        child: Stack(
          children: [

            FittedBox(
              child: SizedBox(
                height: screenSize.height * 0.2,
                width: screenSize.width,
                child: FutureBuilder(
                  future: productController.getLatestProducts(),
                    builder: (context, data) =>
                        data.connectionState == ConnectionState.waiting
                            ? const SizedBox(
                                width: 110,
                                height: 110,
                                child: FittedBox(
                                  child: CircularProgressIndicator.adaptive(
                                    strokeWidth: 0.9,
                                  ),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  boxShadow: [
                                    BoxShadow(color: Colors.black ),
                                    BoxShadow(color: myHexColor1),

                                  ],
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: AssetImage(
                                        'assets/images/Expo-2020-dubai-1.jpeg',),
                                  ),
                                ),
                                )),
              ),
            ),
            Positioned(
              top: 0.0,
              child: Container(color: Colors.black.withOpacity(0.4),height: 200,
                width: screenSize.width,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                SizedBox(
                  height: screenSize.height *0.1,
                ),
                Text('Offers and Promotions',style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(height: screenSize.height *0.1 -70,),
                Text('On all men\'s suits from the most famous world',style: TextStyle(fontSize: 16,color: Colors.grey[50],fontWeight: FontWeight.bold),)

              ],
            )
          ],
        ),
      ),
    );
  }
}
