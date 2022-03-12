import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final screenSize = Get.size;
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(

        body: ListView(
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
                dotSize: 6.0,
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
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('${widget.product!.brand}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: myHexColor1),)
                    ],
                  ),
                  SizedBox(height: screenSize.height*0.1 -70,),
                  Text('${widget.product!.en_name}',style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Colors.black),),
                  SizedBox(height: screenSize.height*0.1 -60,),
                  const Text('Size',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: Colors.black),),
                  SizedBox(height: screenSize.height*0.1 -80,),

                  _buildSizesOptions()

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSizesOptions(){
    int? sizeSelected = 0;
    return  SizedBox(
      width: 300,
      height: 40,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    _colorSize.add(Colors.black54);
                    _colorSizeBorder.add(Colors.black54);

                    return InkWell(
                  onTap:() {
                    print('object');
                    setState(() {
                      for (var i = 0; i<_colorSize.length; i++) {
                        if(i==index){
                          _colorSize[i] = myHexColor3;
                          _colorSizeBorder[i] =myHexColor3;
                        }else{
                          _colorSize[i] = Colors.grey[900]!;
                          _colorSizeBorder[i] = Colors.grey[500]!;

                        }
                      }
                    });
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(right: 8.0),
                    child: Container(
                      height: 28,
                      width: 66,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.3,color:_colorSizeBorder[index])
                      ),
                      child: Center(child: Text(widget.product!.sizes![index],style: TextStyle(color:_colorSize[index],fontWeight: FontWeight.bold),),),
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
}
