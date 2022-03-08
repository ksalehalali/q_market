import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:q_market/Assistants/globals.dart';

List likesList = [''];

bool like = false;

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    Key? key,
    this.kindLike,
    this.date,
    this.index,
    this.id,
    this.likes,
    this.views,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String? image, title, country, id, date, kindLike;
  final int? likes, views, index;
  final double? price;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool? isLike = false;
    return Container(
      height: 250,
      width: size.width *0.4 +10,
      decoration: BoxDecoration(
          border: Border.all(width: 0.3,color: Colors.grey.withOpacity(0.4))
      ),
      margin: EdgeInsets.only(
        left:5,
        right: 5,
      ),
      padding: EdgeInsets.only(top: 6,right: 6,left: 6,bottom: 0),
      child: Stack(
        children: <Widget>[
          InkWell(
              onTap: () {

              },
              child: Image.asset(
                image!,
                fit: BoxFit.fill,
                height: 180,
                width: size.width / 2,
              )),
          Positioned(
            top:size.height *0.3 -56,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(vertical: 8.0),
                            child: SizedBox(
                              width: size.width * 0.3,
                              child: Text("$title".toUpperCase(),textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:TextStyle(fontSize: 13,color: Colors.grey)),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.3,
                            child: Text(
                              "$country".toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Montserrat-Arabic Regular',
                                  color: Colors.grey,
                                  fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              '80.50'.toUpperCase(),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: 'Montserrat-Arabic Regular',
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 14,fontWeight: FontWeight.bold),
                            ),
                          ),

                          SizedBox(
                            width: size.width * 0.4-20,
                            child: Row(
                              children: [
                                Text(
                                  "122.50 QR".toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                      fontFamily: 'Montserrat-Arabic Regular',
                                      color: Colors.grey,
                                      fontSize: 11),
                                ),
                                SizedBox(width: 8.0,),
                                Text(
                                  "Discount 30%",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,

                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat-Arabic Regular',
                                      color: myHexColor,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}