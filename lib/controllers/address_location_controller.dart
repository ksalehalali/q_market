import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressController extends GetxController{
var myCurrentLoc = LatLng(0.0, 0.0).obs;
var pinAddress =''.obs;

updatePinAddress(String address){
  pinAddress.value = address;
  update();
}


updateCurrentLoc(LatLng latLng){
  myCurrentLoc.value = latLng;
  print(myCurrentLoc.value.latitude);
  update();
}
}