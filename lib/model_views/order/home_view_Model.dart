import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model_views/base_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';


class HomeViewModel extends BaseModel{
  Completer<GoogleMapController> _controller = Completer();
  //initialisation map controller
  GoogleMapController? mapController;
  //initialisation start position map
  LatLng center = const LatLng(48.85341, 2.3488);
  //initialisation map
  void onMapCreated(GoogleMapController controller) {
    mapController=controller;
  }

  getScreen(BuildContext context){
     Navigator.pushNamed(context, '/commande_depart_form');
  }


}