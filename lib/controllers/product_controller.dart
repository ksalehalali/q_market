import 'package:get/get.dart';
import 'package:q_market/models/product_model.dart';

class ProductsController extends GetxController {
var latestProducts = <ProductModel>[].obs;





Future getLatestProducts()async{
  latestProducts.value = [
    ProductModel('1', 'iphone 12', 'آيفون١٢', 'a1', 'https://media.istockphoto.com/photos/newly-released-iphone-12-purple-color-mockup-set-with-different-picture-id1313990743', 3000.000,2900.000,'256 GB' ,'Apple',['128 GB','256 GB','512 GB']),
    ProductModel('2', 'airpods', 'اير بودز', 'a٢', 'https://media.istockphoto.com/photos/apple-airpods-in-a-charging-case-on-a-wooden-surface-picture-id1091870804',500.000,440.000,'normal' ,'Apple',[]),
    ProductModel('3', "Galalxy S22", 'جالاكسي اس ٢٢', 'a٢', 'https://media.istockphoto.com/photos/new-samsung-galaxy-s22-ultra-smartphone-picture-id1369578441',5000.000,4400.000,'128 GB' ,'Samsung',['128 GB','256 GB',]),


  ];
  update();
}
}