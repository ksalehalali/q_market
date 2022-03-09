import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Widget addressHomeScreen(MediaQueryData screenSize) {
  final box = GetStorage();

  return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
           SvgPicture.asset(
      'assets/icons/shipping.svg',
          color: Colors.grey[600],
          height: 22.00,
          width: 22.0,
          semanticsLabel: 'A red up arrow'
      ),
          SizedBox(width: screenSize.size.width *0.1 -30,),
          Row(
            children: [
              SizedBox(
                width: Get.size.width -80,
                height: 16,
                child: RichText(text:  TextSpan(
                  children: [
                    TextSpan(
                      text: 'Delivery Address ',
                      style: TextStyle(fontSize: 12,color: Colors.black)
                    ),
                    TextSpan(
                        text: box.read('address') ??'Qatar Doha - arrian',
                        style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black,overflow: TextOverflow.ellipsis)
                    ),
                  ]
                )),
              ),
               Padding(
                 padding:  EdgeInsets.zero,
                 child: Icon(FontAwesomeIcons.angleRight,color: Colors.blue[900],size: 16,),
               ),

            ],
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