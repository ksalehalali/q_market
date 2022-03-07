import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      margin: EdgeInsets.only(
        left:5,
        //top: kDefaultPadding / 2,
        right: 5,
        //bottom: kDefaultPadding,
      ),
      width: size.width * 0.4-10,
      child: Column(
        children: <Widget>[
          InkWell(
              onTap: () {

              },
              child: Image.asset(
                image!,
                fit: BoxFit.contain,
                height: 120,
                width: size.width / 2,
              )),
          Container(
              height: 180,
              //width: 240,
              width: size.width / 2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(0.23),
                  ),
                ],
              ),
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
                                    style:TextStyle(fontSize: 16)),
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
                                    color: Colors.yellowAccent.withOpacity(0.5),
                                    fontSize: 12),
                              ),
                            ),
                            Text(
                              "$date".toUpperCase(),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: 'Montserrat-Arabic Regular',
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 11),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                '\$$price'.toUpperCase(),
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: 'Montserrat-Arabic Regular',
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          if (likesList.length > 1) {
                            for (int i = 0; i < likesList.length; i++) {
                              if (likesList[i] == id) {
                                isLike = true;
                                break;
                              } else {
                                isLike = false;
                              }
                            }
                            if (isLike!) {
                            } else {

                            }
                          } else {

                          }
                        },
                        child: Column(
                          children: [
                            Icon(
                              like
                                  ? FontAwesomeIcons.heart
                                  : FontAwesomeIcons.heart,
                              size: 23,
                              color: Colors.orange,
                            ),
                           Text(
                                'لايك : 2',
                                style: TextStyle(
                                    fontFamily: 'Montserrat-Arabic Regular',
                                    fontSize: 13,
                                    color: Colors.orange),
                              ),

                          ],
                        ),
                      ),
                      Spacer(),

                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}