import 'dart:async';
import 'package:q_market/views/screens/home/home.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:q_market/controllers/address_location_controller.dart';

import '../../Assistants/assistantMethods.dart';

class AddressOnMap extends StatefulWidget {
  @override
  State<AddressOnMap> createState() => AddressOnMapState();
}

class AddressOnMapState extends State<AddressOnMap> {
  Completer<GoogleMapController> _controller = Completer();
  PanelController panelController = PanelController();

  var assistantMethods = AssistantMethods();
  LatLng myCurrentLoc = LatLng(0.0,0.0 );
  static  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng( 29.2556835, 47.9234983),
    zoom: 14.4746,
  );
  double? currentLat =0.0;
     CameraPosition _kLake =  CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng( 29.2556835,  47.9234983),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  final AddressController addressController = Get.find();


  updateCurrentLocMarker(LatLng latLng){
    assistantMethods.searchCoordinateAddress(latLng, context, false);
   addressController.updateCurrentLoc(latLng);
  }
  @override
  Widget build(BuildContext context) {
    final screenSize = Get.size;
    print('object');
    return Scaffold(
       body:SlidingUpPanel(
         controller: panelController,
         maxHeight: screenSize.height * 0.1 ,
         minHeight: screenSize.height * 0.1 ,
           panelBuilder: (scrollContainer) =>AnimatedSize(duration: 200.milliseconds,
             curve: Curves.bounceIn,
             child:Column(
               children: [
                 Center(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Obx(()=> Text(addressController.pinAddress.value,
                       maxLines: 1,
                       textAlign: TextAlign.center,
                       overflow: TextOverflow.ellipsis,
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 18
                       ),),
                     ),
                   ),
                 ),
               ],
             ) ,
           ),body:
         Stack(
           fit: StackFit.expand,
           children: [
             Obx(()=> GoogleMap(
                 markers: {
                   Marker(markerId: MarkerId('a'),position: addressController.myCurrentLoc.value,onTap: (){
                     print('object');
                   })
                 },
               padding: EdgeInsets.only(bottom: 66),
                 mapType: MapType.satellite,
                 mapToolbarEnabled: true,
                 myLocationEnabled: true,
               myLocationButtonEnabled: true,
                 initialCameraPosition: _kGooglePlex,
               onCameraIdle: (){
                   print('onCameraIdle');
               },

                 onCameraMove: (camera){
                   updateCurrentLocMarker(camera.target);

                   print(camera.target.latitude);
                 },

                 onMapCreated: (GoogleMapController controller) {
                   _controller.complete(controller);
                 },
               ),
             ),
             Positioned(
               top: 35.0,
               left: 22.0,
               child: InkWell(
                 onTap: () {

                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));

                 },
                 child: Container(
                   //height: 300.0,
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(22.0),
                       boxShadow: const [
                         BoxShadow(
                           color: Colors.black,
                           blurRadius: 6.0,
                           spreadRadius: 0.5,
                           offset: Offset(0.7, 0.7),
                         ),
                       ]),
                   child: CircleAvatar(
                     backgroundColor: Colors.white,
                     child:  Icon(
                       Icons.close,
                       color: Colors.black,
                     ),
                     ),
                   ),
                 ),
               ),

           ],
         ),
       ),

      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}