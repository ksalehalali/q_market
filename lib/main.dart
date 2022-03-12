import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:q_market/controllers/product_controller.dart';
import 'package:q_market/models/product_model.dart';
import 'package:q_market/views/screens/home/home.dart';
import 'package:q_market/views/screens/main_screen.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'Assistants/assistantMethods.dart';
import 'controllers/address_location_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final addressController =Get.putAsync(() async => AddressController(),permanent: true);
  final productController =Get.putAsync(() async => ProductsController(),permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AddressController addressController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locatePosition();
  }

var geoLocator = geo.Geolocator();
geo.Position? currentPos;
  void locatePosition()async{
geo.Position position = await geo.Geolocator.getCurrentPosition(desiredAccuracy: geo.LocationAccuracy.high);
addressController.areaLoc.value = LatLng(position.latitude, position.longitude);

print(position);

  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
