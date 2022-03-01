import 'package:flutter/material.dart';

Widget headHomeScreen(MediaQueryData screenSize) {
  return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          SizedBox(
            width: screenSize.size.width *0.1 -30,
          ),
          const Icon(Icons.shopping_cart),
          SizedBox(width:           screenSize.size.width *0.1 -30,),
          const Text(
            'Your Market ...',
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr ,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Montserrat-Arabic Regular',
              height: 1,
            ),
          ),
          const SizedBox(width: 10.0,),
          // Image.asset(
          //   'assets/images/logo.png',
          //   height: screenSize.size.height *0.1-25,
          //   width: screenSize.size.width *0.2+5,
          //   fit: BoxFit.fill,
          // )
        ],
      ));
}