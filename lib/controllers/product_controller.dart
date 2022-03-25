import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:q_market/Assistants/globals.dart';
import 'package:q_market/models/product_model.dart';

import '../Data/current_data.dart';

class ProductsController extends GetxController {
var latestProducts = <ProductModel>[].obs;
var product = ProductModel().obs;
ProductModel productDetails = ProductModel();
var imagesList=[].obs;

Future getLatestProducts()async{

  var headers = {
    'Authorization': 'bearer ${user.accessToken}',
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse('$baseURL/api/ListProduct'));
  request.body = json.encode({
    "PageNumber": 0,
    "PageSize": 50
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    latestProducts.value = [];
    var json = jsonDecode(await response.stream.bytesToString());
    var data = json['description'];

    for(int i=0; i<data.length; i++){
      latestProducts.add(ProductModel(
          id:data[i]['id'],
         en_name: data[i]['name_EN'],
        ar_name: data[i]['name_AR'],
        price: double.parse(data[i]['price'].toString()),
        offer: data[i]['offer'],
        imageUrl:data[i]['image'],
        catId: data[i]['catID'],
        categoryNameEN: data[i]['categoryName_EN'],
        categoryNameAR: data[i]['categoryName_AR'],
        modelName: data[i]['modelName'],
        modelId:data[i]['modelID'],
        userId: data[i]['userID'],
        userName: data[i]['userName'],

      ));
    }
    print('latest products count :: ${latestProducts.length}');
  }else{
    print(response.reasonPhrase);
  }
  update();
}

Future getOneProductDetails(String id)async{
  print('get prod id :: $id');
  var headers = {
    'Authorization': 'bearer ${user.accessToken}',
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse('$baseURL/api/GetProduct'));
  request.body = json.encode({
    'id':id
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    latestProducts.value = [];
    var json = jsonDecode(await response.stream.bytesToString());
    var data = json['description'];
    product.value = ProductModel(
      id:data['id'],
      en_name: data['name_EN'],
      ar_name: data['name_AR'],
      price: double.parse(data['price'].toString()),
      offer: data['offer'],
      imageUrl:data['primaryImage'],
      catId: data['catID'],
      categoryNameEN: data['categoryName_EN'],
      categoryNameAR: data['categoryName_AR'],
      modelName: data['modelName'],
      modelId:data['modelID'],
      userId: data['userID'],
      userName: data['userName'],
      general: data['general'],
      special: data['spical'],
      images: data['image'],
    );
    productDetails =ProductModel(
      id:data['id'],
      en_name: data['name_EN'],
      ar_name: data['name_AR'],
      price: double.parse(data['price'].toString()),
      offer: data['offer'],
      imageUrl:data['primaryImage'],
      catId: data['catID'],
      categoryNameEN: data['categoryName_EN'],
      categoryNameAR: data['categoryName_AR'],
      modelName: data['modelName'],
      modelId:data['modelID'],
      userId: data['userID'],
      userName: data['userName'],
      general: data['general'],
      special: data['spical'],
      images: data['image'],
    );
    createImages();
    print(product);
  }
}
createImages(){
  for(int i =0; i<productDetails.images!.length;i++){
    imagesList.add(
      Image.network(
          '$baseURL/${productDetails.images![i]['image']}',
          fit: BoxFit.cover),
    );
  }
}
}