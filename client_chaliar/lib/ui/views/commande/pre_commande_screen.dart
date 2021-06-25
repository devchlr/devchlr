import 'package:client_chaliar/constants/iconList.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/views/commande/map/main.dart';
import 'package:client_chaliar/ui/widgets/appBar.dart';
import 'package:client_chaliar/ui/widgets/button.dart';
import 'package:client_chaliar/ui/widgets/svg_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timelines/timelines.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';


class PreCommandeScreen extends StatefulWidget {
  final Key _mapKey = UniqueKey();
  @override
  _PreCommandeScreenState createState() => _PreCommandeScreenState();
}

class _PreCommandeScreenState extends State<PreCommandeScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: ChaliarMenu.topBar(
        title: 'Commande',
        bgColor: ChaliarColors.whiteColor,
        imageBackground: 'assets/images/header.png'
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage("assets/images/menuFooter.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height*0.02
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap:(){

        },
                child: Center(
                  child: SvgPicture.asset(
                    SvgIcons.chaliar,
                    height: 30,
                    width: 20,
                    color: ChaliarColors.whiteGreyColor,
                  ),
                ),
              ),
              GestureDetector(
                child: Center(
                  child: SvgPicture.asset(
                    SvgIcons.commande,
                    height: 70,
                    width: 50,
                  ),
                ),
              ),
              GestureDetector(
                child: Center(
                  child: SvgPicture.asset(
                    SvgIcons.scooter,
                    height: 30,
                    width: 20,
                    color: ChaliarColors.whiteGreyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    top: 10.0
                ),
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: ChaliarColors.whiteColor,
                ),
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap:()=>Navigator.pushNamed(context, '/commande_depart_form'),
                      child: TimelineTile(
                        nodeAlign: TimelineNodeAlign.start,
                        contents: Card(
                          child: Container(
                            height: 44.1,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10.0),
                            child: Text('Position de départ du colis',style: AppTextStyle.captionPreCommande(color:ChaliarColors.secondaryColors),),
                          ),
                        ),
                        node: TimelineNode(
                          indicator: DotIndicator(
                            size: 9.0,
                          ),
                          endConnector: DashedLineConnector(),
                        ),
                      ),
                    ),
                    GestureDetector(onTap:()=>Navigator.pushNamed(context, '/commande_depart_form'),child: Container(
                      margin: EdgeInsets.only(
                          left: 3.0
                      ),
                      child: TimelineTile(
                        nodeAlign: TimelineNodeAlign.start,
                        contents: Card(
                          child: Container(
                            color: ChaliarColors.whiteGreyColor,
                            height: 44.10,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10.0),
                            child: Text('Position de d\'arrive du colis',style: AppTextStyle.captionPreCommande(color:ChaliarColors.secondaryColors),),
                          ),
                        ),
                        node: TimelineNode(
                          indicator: ContainerIndicator(
                            child: Container(
                              height: 9.0,
                              width: 9.0,
                              color: Color(0xff3885DA),
                            ),
                          ),
                          startConnector: DashedLineConnector(),
                        ),
                      ),
                    ),)
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child:  Container(
                  child:  GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.6,
            ),
            child: Center(
              child: ButtonChaliar(
                  onTap: () {
                    Navigator.pushNamed(context, '/commande_depart_form');
                  },
                  buttonText: 'Commander',
                  height:49,
                  mediaQueryWidth: 0.30,
                  borderRaduis: 30,
                  backgroundcolor: ChaliarColors.primaryColors,
                  bordercolor: ChaliarColors.primaryColors,
                  textStyle: AppTextStyle.button(
                      color: ChaliarColors.whiteColor)),
            ),
          ),
        ],
      ),
    );
  }
}


// Stack(
// children: [
// Column(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// Container(
// margin: EdgeInsets.only(
// left: 10.0,
// right: 10.0,
// top: 10.0
// ),
// height: MediaQuery.of(context).size.height * 0.15,
// decoration: BoxDecoration(
// color: ChaliarColors.whiteColor,
// ),
// child: ListView(
// children: [
// GestureDetector(
// onTap:()=>Navigator.pushNamed(context, '/commande_depart_form'),
// child: TimelineTile(
// nodeAlign: TimelineNodeAlign.start,
// contents: Card(
// child: Container(
// height: 44.1,
// width: MediaQuery.of(context).size.width,
// padding: EdgeInsets.all(10.0),
// child: Text('Position de départ du colis',style: AppTextStyle.captionPreCommande(color:ChaliarColors.secondaryColors),),
// ),
// ),
// node: TimelineNode(
// indicator: DotIndicator(
// size: 9.0,
// ),
// endConnector: DashedLineConnector(),
// ),
// ),
// ),
// GestureDetector(onTap:()=>Navigator.pushNamed(context, '/commande_depart_form'),child: Container(
// margin: EdgeInsets.only(
// left: 3.0
// ),
// child: TimelineTile(
// nodeAlign: TimelineNodeAlign.start,
// contents: Card(
// child: Container(
// color: ChaliarColors.whiteGreyColor,
// height: 44.10,
// width: MediaQuery.of(context).size.width,
// padding: EdgeInsets.all(10.0),
// child: Text('Position de d\'arrive du colis',style: AppTextStyle.captionPreCommande(color:ChaliarColors.secondaryColors),),
// ),
// ),
// node: TimelineNode(
// indicator: ContainerIndicator(
// child: Container(
// height: 9.0,
// width: 9.0,
// color: Color(0xff3885DA),
// ),
// ),
// startConnector: DashedLineConnector(),
// ),
// ),
// ),)
// ],
// ),
// ),
// Expanded(
// flex: 1,
// child:  Container(
//
// ),
// ),
// ],
// ),
// Padding(
// padding: EdgeInsets.only(
// top: MediaQuery.of(context).size.height * 0.6,
// ),
// child: Center(
// child: ButtonChaliar(
// onTap: () {
// Navigator.pushNamed(context, '/commande_depart_form');
// },
// buttonText: 'Commander',
// height:49,
// mediaQueryWidth: 0.30,
// borderRaduis: 30,
// backgroundcolor: ChaliarColors.primaryColors,
// bordercolor: ChaliarColors.primaryColors,
// textStyle: AppTextStyle.button(
// color: ChaliarColors.whiteColor)),
// ),
// ),
// ],
// ),

