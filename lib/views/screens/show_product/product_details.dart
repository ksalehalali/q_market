import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:q_market/Assistants/globals.dart';
import 'package:q_market/models/product_model.dart';

import '../../../controllers/product_controller.dart';
import '../home/search_area_des.dart';



class ProductDetails extends StatefulWidget {
  final ProductModel? product;
  const ProductDetails({Key? key, this.product}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductsController productController = Get.find();
  List<Color> _colorSize = [myHexColor3,];
  List<Color> _colorSizeBorder = [myHexColor3,];
  var currentSize;
  @override
  Widget build(BuildContext context) {
    final screenSize = Get.size;
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(

        body: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(
                height: 6.0,
              ),
              Row(
                children:  [
                  Expanded(child: SearchAreaDesign()),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey[800],size: 36,))
                ],
              ),
              SizedBox(height: 4,),
              SizedBox(
                height: 360.0,
                width: double.infinity,
                child: Carousel(
                  dotSize: 4.0,
                  dotSpacing: 15.0,
                  autoplay: false,
                  autoplayDuration: 4.seconds,
                  animationDuration: 500.milliseconds,
                  dotBgColor: Colors.transparent.withOpacity(0.1),
                  dotColor: Colors.white,
                  dotIncreasedColor: Colors.red,
                  dotPosition: DotPosition.bottomLeft,
                  images: [
                    Image.network(
                        widget.product!.imageUrl!,
                        fit: BoxFit.cover),
                    Image.network(
                        widget.product!.imageUrl!,
                        fit: BoxFit.cover),
                    Image.network(
                        widget.product!.imageUrl!,
                        fit: BoxFit.cover),
                  ],
                ),
              ),
              SizedBox(height: 8.0,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.0,),
                    Text('${widget.product!.brand}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: myHexColor1),),
                    SizedBox(height: screenSize.height*0.1 -70,),
                    Text('${widget.product!.en_name}',style:  TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Colors.black),),
                    SizedBox(height: screenSize.height*0.1 -60,),
                     Text('Size',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Colors.black),),

                    _buildSizesOptions(),
                    SizedBox(height: 22.0,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(width: 1,   color: Colors.grey[500]!,
                        )
                      ),
                      width: screenSize.width ,
                      height: screenSize.height *0.1 -30,
                      child: Row(
                        children: [
                          SizedBox(width: 10.0,),

                          SvgPicture.asset(
                              'assets/icons/shipping.svg',
                              color: Colors.grey[600],
                              height: 18.00,
                              width: 18.0,
                              semanticsLabel: 'A red up arrow'
                          ),
                          SizedBox(width: 10.0,),

                          Text('Delivery time :'),
                          Spacer(),
                          Text(' Jan 28 - Jan 30'),
                          SizedBox(width: screenSize.width *0.1-12,)

                        ],
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
        bottomSheet:  buildAddCartPrice(),
      ),
    );
  }

  Widget _buildSizesOptions(){
    return  SizedBox(
      width: 300,
      height: 40,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    _colorSize.add(Colors.grey[800]!);
                    _colorSizeBorder.add(Colors.grey[400]!);

                    return InkWell(
                  onTap:() {
                    currentSize = widget.product!.sizes![index];
                    setState(() {
                      print('${widget.product!.sizes![index]}');
                      for (var i = 0; i<_colorSize.length; i++) {
                        if(i==index){
                          _colorSize[i] = myHexColor3;
                          _colorSizeBorder[i] =myHexColor3;
                        }else{
                          _colorSize[i] = Colors.grey[800]!;
                          _colorSizeBorder[i] = Colors.grey[400]!;

                        }
                      }
                    });
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(right: 8.0),
                    child: Container(
                      height: 24,
                      width: 78,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.2,color:_colorSizeBorder[index])
                      ),
                      child: Center(child: Text(widget.product!.sizes![index],style: TextStyle(color:_colorSize[index],fontWeight: FontWeight.bold,fontSize: 13),),),
                    ),
                  ),
                );
              },
              childCount:widget.product!.sizes!.length ,
              semanticIndexOffset:0,
            ),
          )
        ],
      ),
    );

  }

  Widget buildAddCartPrice(){
    return Card(
      child: Row(
        children: [
          Expanded(child: Container(
            height: 44,
            color: myHexColor1,
            child: Center(child: Text('Add to Cart',style: TextStyle(color: Colors.white),),),
          )),
          Container(
            height: 44,
            width: 130,
            color: Colors.white,
            child: Center(child: Text('Add to Cart',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
          )
        ],
      ),
    );
  }
}
