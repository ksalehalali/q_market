import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:q_market/Assistants/globals.dart';
import 'package:q_market/models/product_model.dart';
import 'package:q_market/views/screens/show_product/product_details.dart';

List likesList = [''];

bool like = false;

class ProductItemCard extends StatelessWidget {

  final ProductModel product;
  const ProductItemCard({
    Key? key,
   required this.product
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool? isLike = false;
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(product: product,)));
      },
      child: Container(
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(product: product,)));
                },
                child: Image.network(
                  product.imageUrl!,
                  fit: BoxFit.fill,
                  height: 180,
                  width: size.width / 2,
                )),
            Positioned(
                top: 8.0,
                left: 10.0,
                child: InkWell(
                  onTap: (){
                    print('like');
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[50]
                    ),
              child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: SvgPicture.asset(
                      'assets/icons/13585919901586786441.svg',
                      color: Colors.grey[400],
                      height: 12.00,
                      width: 12.0,
                      semanticsLabel: 'A red up arrow'
                  ),
              ),
            ),
                )),
            Positioned(
              top:size.height *0.3 -56,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(product: product,)));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
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
                                child: Text("${product.en_name}".toUpperCase(),textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:TextStyle(fontSize: 13,color: Colors.grey)),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.3,
                              child: Text(
                                "${product.size}".toUpperCase(),
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
                                '${product.offer}'.toUpperCase(),
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: 'Montserrat-Arabic Regular',
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 14,fontWeight: FontWeight.bold),
                              ),
                            ),

                            SizedBox(
                              width: size.width * 0.4-10,
                              child: Row(
                                children: [
                                  Text(
                                    "${product.price} QR".toUpperCase(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                        fontFamily: 'Montserrat-Arabic Regular',
                                        color: Colors.grey,
                                        fontSize: 11),
                                  ),
                                  SizedBox(width: 7.0,),
                                  Text(
                                    "Discount 30%",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,

                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontFamily: 'Montserrat-Arabic Regular',
                                        color: myHexColor3,
                                        fontSize: 11),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}