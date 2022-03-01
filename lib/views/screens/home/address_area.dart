import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Widget addressHomeScreen(MediaQueryData screenSize) {
  final box = GetStorage();

  return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          SizedBox(
            width: screenSize.size.width *0.1 -30,
          ),
          const Icon(Icons.location_on_outlined),
          SizedBox(width:           screenSize.size.width *0.1 -30,),
          Row(
            children: [

              SizedBox(
                width: Get.size.width -90,
                height: 16,
                child: RichText(text:  TextSpan(
                  children: [
                    TextSpan(
                      text: 'Your Address : ',
                      style: TextStyle(fontSize: 11,color: Colors.black)
                    ),
                    TextSpan(
                        text: box.read('address') ??'Qatar Doha - arrian',
                        style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black,overflow: TextOverflow.ellipsis)
                    ),
                  ]
                )),
              ),
               Icon(FontAwesomeIcons.arrowAltCircleDown,color: Colors.blue[900],size: 16,),

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