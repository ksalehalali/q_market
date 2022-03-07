import 'package:flutter/material.dart';
import 'package:q_market/Assistants/globals.dart';

Widget headHomeScreen(MediaQueryData screenSize) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // const Icon(Icons.shopping_cart),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello!', style: TextStyle(fontSize: 12,color: myHexColor,fontWeight: FontWeight.w500,),),
                SizedBox(height: 4,),
                Text('Khaled Ali',style: TextStyle(fontSize: 14,color: myHexColor,fontWeight: FontWeight.bold))
              ],
            ),
            // Image.asset(
            //   'assets/images/logo.png',
            //   height: screenSize.size.height *0.1-25,
            //   width: screenSize.size.width *0.2+5,
            //   fit: BoxFit.fill,
            // )
          ],
        )),
  );
}