import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_market/Assistants/globals.dart';

import '../../widgets/departments_list_r.dart';
import '../home/search_area_des.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Widget> categoriesButtons = [];
  List<Widget> brandsWidgets = [];

  List<Map<String,String>> categories =[
     {'catName': 'Women\'s Fashion','imagePath':'assets/images/agelesspix-PlcByunJ78c-unsplash.jpg'},
     {'catName': 'Men\'s Fashion','imagePath':'assets/images/austin-wade-d2s8NQ6WD24-unsplash.jpg'},
     {'catName': 'Kids, Baby & Toys','imagePath':'assets/images/robo-wunderkind-3EuPcI31MQU-unsplash.jpg'},
     {'catName': 'Accessories and gifts','imagePath':'assets/images/freestocks-PxM8aeJbzvk-unsplash.jpg'},
     {'catName': 'beauty supplies','imagePath':'assets/images/laura-chouette-RkINI2JZwss-unsplash.jpg'},
     {'catName': 'Men\'s stuff','imagePath':'assets/images/aniket-narula-XjNI-C5G6mI-unsplash.jpg'},
     {'catName': 'Mobiles & Accessories','imagePath':'assets/images/mehrshad-rajabi-cLrcbfSwBxU-unsplash.jpg'},
     {'catName': 'Home & Kitchen','imagePath':'assets/images/ryan-christodoulou-68CDDj03rks-unsplash.jpg'},
     {'catName': 'Brands','imagePath':'assets/images/zara-outlet.png'},
     {'catName': 'Watches & Bags','imagePath':'assets/images/aniket-narula-XjNI-C5G6mI-unsplash.jpg'},
   ];

  List<Map<String,String>> brands =[
    {'catName': 'Women\'s Fashion','imagePath':'assets/images/agelesspix-PlcByunJ78c-unsplash.jpg'},
    {'catName': 'Men\'s Fashion','imagePath':'assets/images/austin-wade-d2s8NQ6WD24-unsplash.jpg'},
    {'catName': 'Kids, Baby & Toys','imagePath':'assets/images/robo-wunderkind-3EuPcI31MQU-unsplash.jpg'},
    {'catName': 'Accessories and gifts','imagePath':'assets/images/freestocks-PxM8aeJbzvk-unsplash.jpg'},
    {'catName': 'beauty supplies','imagePath':'assets/images/laura-chouette-RkINI2JZwss-unsplash.jpg'},
    {'catName': 'Men\'s stuff','imagePath':'assets/images/aniket-narula-XjNI-C5G6mI-unsplash.jpg'},
    {'catName': 'Mobiles & Accessories','imagePath':'assets/images/mehrshad-rajabi-cLrcbfSwBxU-unsplash.jpg'},
    {'catName': 'Home & Kitchen','imagePath':'assets/images/ryan-christodoulou-68CDDj03rks-unsplash.jpg'},
    {'catName': 'Brands','imagePath':'assets/images/zara-outlet.png'},
    {'catName': 'Watches & Bags','imagePath':'assets/images/aniket-narula-XjNI-C5G6mI-unsplash.jpg'},
  ];
  List<Map<String,String>> handbags_wallets =[
    {'catName': 'Women\'s Fashion','imagePath':'assets/images/agelesspix-PlcByunJ78c-unsplash.jpg'},
    {'catName': 'Men\'s Fashion','imagePath':'assets/images/austin-wade-d2s8NQ6WD24-unsplash.jpg'},
    {'catName': 'Kids, Baby & Toys','imagePath':'assets/images/robo-wunderkind-3EuPcI31MQU-unsplash.jpg'},
    {'catName': 'Accessories and gifts','imagePath':'assets/images/freestocks-PxM8aeJbzvk-unsplash.jpg'},
    {'catName': 'beauty supplies','imagePath':'assets/images/laura-chouette-RkINI2JZwss-unsplash.jpg'},
    {'catName': 'Men\'s stuff','imagePath':'assets/images/aniket-narula-XjNI-C5G6mI-unsplash.jpg'},
    {'catName': 'Mobiles & Accessories','imagePath':'assets/images/mehrshad-rajabi-cLrcbfSwBxU-unsplash.jpg'},
    {'catName': 'Home & Kitchen','imagePath':'assets/images/ryan-christodoulou-68CDDj03rks-unsplash.jpg'},
    {'catName': 'Brands','imagePath':'assets/images/zara-outlet.png'},
    {'catName': 'Watches & Bags','imagePath':'assets/images/aniket-narula-XjNI-C5G6mI-unsplash.jpg'},
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createCategoriesButtons();
    createBrandsList();
  }
  createCategoriesButtons(){
    for(int i =0; i<categories.length;i++){
      categoriesButtons.add(Container(

        height: 80,
        width: 82,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(categories[i]['imagePath'].toString(),),fit: BoxFit.fill)
        ),
        child: Container(
            color: Colors.black.withOpacity(0.7),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(categories[i]['catName'].toString(),maxLines: 2,textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),)),
            )),
      ));
    }
  }
  createBrandsList(){
    for(int i =0; i<categories.length;i++){
      brandsWidgets.add(Padding(
          padding: EdgeInsets.zero,
          child: Column(
            children: <Widget>[
              Container(
                height: 59,
                width: 59,
                //padding:  EdgeInsets.all(0.1),
                decoration:  BoxDecoration(
                  color: myHexColor,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: Image.asset(
                    brands[i]['imagePath'].toString(),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(brands[i]['catName'].toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
            ],
          )));
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final screenSize = Get.size;
    return Container(
      color: myHexColor5,
      child: SafeArea(child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            const SizedBox(
              height: 6.0,
            ),
            SearchAreaDesign(),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: screenSize.height-150,
                  child: ListView(
                    children: [
                ...categoriesButtons,
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height-150,
                  width: screenSize.width -101,
                  child:  CustomScrollView(
                    slivers:<Widget> [
                      _buildTitle('Category'),
                     _buildListOfpartments(categories),
                      _buildTitle('Brands'),
                      _buildListOfpartments(brands),
                      _buildTitle('Handbags & Wallets'),
                      _buildListOfpartments(brands),

                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
            Spacer(),
          ],
        ),

      ),),
    );
  }
  Widget _buildTitle(String title){
    return  SliverAppBar(
        floating: false,
        expandedHeight: 22,
        titleSpacing: 6.0,
        foregroundColor: Colors.transparent.withOpacity(0.0),
    backgroundColor: Colors.white.withOpacity(0.0),
    title: Text(title,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black)));
    // flexibleSpace: FlexibleSpaceBar(
    //   title: Text('AAAAAAAA',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),),
    // ),
  }
  Widget _buildListOfpartments(categories){
    return  SliverGrid(
      delegate: SliverChildBuilderDelegate(
              (context,index){
            return Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 82,
                      width: 88,
                      //padding:  EdgeInsets.all(0.1),
                      decoration:  BoxDecoration(
                        color: myHexColor,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        child: Image.asset(
                          categories[index]['imagePath'].toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(categories[index]['catName'].toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                  ],
                ));

          },childCount: categories.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          childAspectRatio: 0.8,
          crossAxisCount: 3),);

  }
}
