
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartController extends GetxController {
  var isCartEmpty = true.obs;

  var cartItems = <Widget>[].obs;

  Column buildCartItem() {
    // this list will be filled form the API
    cartItems.add(
      Container(
        child: Column(
          children: [
            Row(),
            Text(
              "128"
            ),
            Text(
              "seller "
            ),
            Row()
          ],
        ),
      ),
    );

    return Column(
      children: [
        ...cartItems
      ],
    );
  }

}
