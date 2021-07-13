// import 'dart:typed_data';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_app/constants/iconList.dart';
// import 'package:flutter_app/ui/styles/chaliar_color.dart';
// import 'package:flutter_app/ui/styles/text_style.dart';
// import 'package:flutter_app/ui/widgets/appBar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app/ui/widgets/button.dart';
// import 'package:flutter_app/ui/widgets/custom_botom_navigation_bar.dart';
// import 'package:flutter_app/ui/widgets/custom_header.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:timelines/timelines.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'dart:async';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'Dart:ui' as ui;
//
//
// class OrderTrackingScreen extends StatefulWidget {
//   FirebaseAuth _auth =FirebaseAuth.instance;
//   @override
//   _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
// }
//
// class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
//
//   void initState() {
//     super.initState();
//     /// origin marker
//     setState(() {
//       init();
//     });
//   }
//   void init(){
//     _addMarker(LatLng(_originLatitude, _originLongitude), "origin",
//         BitmapDescriptor.defaultMarker);
//     /// destination marker
//     _addMarker(LatLng(_destLatitude, _destLongitude), "destination",
//         BitmapDescriptor.defaultMarker);
//     _getPolyline();
//   }
//
//   Future initMarker()async{
//     await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/images/marker/clientMarker.png').then((value)async{
//       startMarker =value;
//       await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assets/images/marker/clientMarker.png').then((val){
//         endMarker =val;
//       });
//     });
//
//   }
//
//   Uint8List? startM;
//
//   Future<Uint8List> getMarker(String path) async {
//     ByteData byteData = await DefaultAssetBundle.of(context).load(path);
//     startM= byteData.buffer.asUint8List();
//     return byteData.buffer.asUint8List();
//   }
//
//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   Completer<GoogleMapController> _controller = Completer();
//
//   double _originLatitude = 48.87964, _originLongitude = 2.33231;
//   double _destLatitude = 48.87523, _destLongitude = 2.29767;
//   Map<MarkerId, Marker> markers = {};
//   Map<PolylineId, Polyline> polylines = {};
//   List<LatLng> polylineCoordinates = [];
//   PolylinePoints polylinePoints = PolylinePoints();
//   String googleAPiKey = "AIzaSyAQX7OqHR3keR8UQW02TyAWgqr6Co2OXWI";
//   BitmapDescriptor? startMarker;
//   BitmapDescriptor? endMarker;
//
//   static Future<Uint8List> getBytesFromAsset(String path, int width) async {
//     ByteData data = await rootBundle.load(path);
//     ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
//     ui.FrameInfo fi = await codec.getNextFrame();
//     return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
//   }
//
//   GoogleMapController? mapController;
//   final LatLng _center =  LatLng(48.87964, 2.33231);
//   void _onMapCreated(GoogleMapController controller) async{
//     mapController = controller;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return
//       Scaffold(
//         backgroundColor: Color(0xffF3F3F3),
//         body: Stack(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   height: 110,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(
//                     left: 10.0,
//                     right: 10.0,
//                   ),
//                   height: MediaQuery.of(context).size.height * 0.2,
//                   decoration: BoxDecoration(
//                     color: Color(0xffF3F3F3),
//                   ),
//                   child: ListView(
//                     children: [
//                       GestureDetector(
//                         onTap:()=>Navigator.pushNamed(context, '/commande_depart_form'),
//                         child: TimelineTile(
//                           nodeAlign: TimelineNodeAlign.start,
//                           contents: Card(
//                             child: Container(
//                               height: 44.1,
//                               width: MediaQuery.of(context).size.width,
//                               padding: EdgeInsets.all(10.0),
//                               child: Text('12 Avenue de Paris , 94220 Charenton le Pont',style: AppTextStyle.captionPreCommande(color:ChaliarColors.secondaryColors),),
//                             ),
//                           ),
//                           node: TimelineNode(
//                             indicator: DotIndicator(
//
//                             ),
//                             endConnector: DashedLineConnector(),
//                           ),
//                         ),
//                       ),
//                       GestureDetector(onTap:()=>Navigator.pushNamed(context, '/commande_depart_form'),child: Container(
//                         margin: EdgeInsets.only(
//                             left: 3.0
//                         ),
//                         child: TimelineTile(
//                           nodeAlign: TimelineNodeAlign.start,
//                           contents: Card(
//                             child: Container(
//                               color: ChaliarColors.whiteGreyColor,
//                               height: 44.10,
//                               width: MediaQuery.of(context).size.width,
//                               padding: EdgeInsets.all(12.0),
//                               child: Text('39 Rue de Wagram , 75017 Paris',style: AppTextStyle.captionPreCommande(color:ChaliarColors.secondaryColors),),
//                             ),
//                           ),
//                           node: TimelineNode(
//                             indicator: ContainerIndicator(
//                               child: Container(
//                                 height: 9.0,
//                                 width: 9.0,
//                                 color: Color(0xff3885DA),
//                               ),
//                             ),
//                             startConnector: DashedLineConnector(),
//                           ),
//                         ),
//                       ),)
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child:  Container(
//                     child: FutureBuilder<Uint8List>(
//                       future: getMarker("assets/images/marker/clientMarker.png"),
//                       builder: (context,value){
//                         if(value.connectionState!=ConnectionState.done){
//                           return CircularProgressIndicator();
//                         }
//                         if(value.data!=null){
//                           _addMarker(LatLng(_originLatitude, _originLongitude), "origin",
//                               BitmapDescriptor.fromBytes(value.data!));
//                         }
//
//                         return GoogleMap(
//                           onMapCreated: _onMapCreated,
//                           markers: Set<Marker>.of(markers.values),
//                           polylines: Set<Polyline>.of(polylines.values),
//                           myLocationEnabled: true,
//                           tiltGesturesEnabled: true,
//                           compassEnabled: true,
//                           scrollGesturesEnabled: true,
//                           zoomGesturesEnabled: true,
//                           initialCameraPosition: CameraPosition(
//                             target: _center,
//                             zoom: 15.0,
//                           ),
//                         );
//                       },
//                     ),
//
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 top: MediaQuery.of(context).size.height * 0.68,
//               ),
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(10.0),
//                   ),
//                 ),
//                 elevation: 1,
//                 child: Container(
//                   color: Color(0xffffffff),
//                   height: 250,
//                   width: MediaQuery.of(context).size.width,
//                   padding: EdgeInsets.only(
//                   ),
//                   margin: EdgeInsets.only(
//                       left: 20,
//                       right: 20
//                   ),
//                   child: ListView(
//                     padding: EdgeInsets.only(
//                         top: 10
//                     ),
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Votre livreur arrive dans 5 min',style: AppTextStyle.appBarHeader(
//                               color: Color(0xff222B45),
//                               size: 9.8,
//                               fontWeight: FontWeight.w400
//                           ),),
//                           Text('Annnuler la course',style: AppTextStyle.appBarHeader(
//                               color: Color(0xff222B45),
//                               size: 9.8,
//                               fontWeight: FontWeight.w400
//                           ),),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         height: 2,
//                         color: ChaliarColors.whiteGreyColor,
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Container(
//                         height: 95,
//                         width: MediaQuery.of(context).size.width,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   height: 52,
//                                   width: 52,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage("assets/images/profil_tracking.png"),
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 15,
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     Text('Evan Guzman',style: AppTextStyle.appBarHeader(
//                                       color: Color(0xff222B45),
//                                       size: 10.8,
//                                       fontWeight: FontWeight.w400,
//                                     ),),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         SvgPicture.asset(
//                                           SvgIcons.start,
//                                           height: 13,
//                                           width: 12,
//                                         ),
//                                         SizedBox(
//                                           width: 5,
//                                         ),
//                                         Text('Evan Guzman',style: AppTextStyle.appBarHeader(
//                                           color: Color(0xff222B45),
//                                           size: 7.92,
//                                           fontWeight: FontWeight.w400,
//                                         ),),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         SvgPicture.asset(
//                                           SvgIcons.pin,
//                                           height: 13,
//                                           width: 12,
//                                         ),
//                                         SizedBox(
//                                           width: 5,
//                                         ),
//                                         Text('8 courses',style: AppTextStyle.appBarHeader(
//                                           color: Color(0xff222B45),
//                                           size: 7.92,
//                                           fontWeight: FontWeight.w400,
//                                         ),),
//                                         SizedBox(
//                                           width: 11,
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     SvgPicture.asset(
//                                       SvgIcons.white_visa,
//                                       height: 13,
//                                       width: 12,
//                                     ),
//                                     SizedBox(
//                                       width: 5,
//                                     ),
//                                     Text('**** **** **** 7539',style: AppTextStyle.appBarHeader(
//                                       color: Color(0xff222B45),
//                                       size: 7.92,
//                                       fontWeight: FontWeight.w400,
//                                     ),),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 Center(
//                                   child: SvgPicture.asset(
//                                     SvgIcons.scooter,
//                                     height: 36,
//                                     width: 59,
//                                     color: Color(0xff042C5C),
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: 2,
//                         color: ChaliarColors.whiteGreyColor,
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Center(
//                             child: ButtonChaliar(
//                                 onTap: () {
//                                   Navigator.pushNamed(context, '/order_message');
//                                 },
//                                 buttonText: 'Message',
//                                 height:49,
//                                 mediaQueryWidth: 0.25,
//                                 borderRaduis: 10,
//                                 backgroundcolor: Color(0xff042C5C),
//                                 bordercolor:  Color(0xff042C5C),
//                                 textStyle: AppTextStyle.appBarHeader(
//                                     size: 8.64,
//                                     color: ChaliarColors.whiteColor)),
//                           ),
//                           Center(
//                             child: ButtonChaliar(
//                                 onTap: ()=>launch("tel://21213123123"),
//                                 buttonText: 'APPELER',
//                                 height:49,
//                                 mediaQueryWidth: 0.15,
//                                 borderRaduis: 10,
//                                 backgroundcolor: Color(0xffffffff),
//                                 bordercolor:  Color(0xff042C5C),
//                                 textStyle: AppTextStyle.appBarHeader(
//                                     size: 8.64,
//                                     color: Color(0xff042C5C))),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//               ),
//               child: CustomHearder(
//                 title: 'Commande',
//                 description: '',
//               ),
//             ),
//           ],
//         ),
//       );
//   }
//
//   _addMarker(LatLng position, String id, BitmapDescriptor descriptor)async {
//     setState(() {
//       MarkerId markerId = MarkerId(id);
//       Marker marker =
//       Marker(markerId: markerId, icon: descriptor, position: position);
//       markers[markerId] = marker;
//     });
//   }
//
//   _addPolyLine() {
//     PolylineId id = PolylineId("poly");
//     Polyline polyline = Polyline(
//         polylineId: id, color: Color(0xff2E9EE5), points: polylineCoordinates);
//     polylines[id] = polyline;
//     setState(() {});
//   }
//
//   _getPolyline() async {
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       googleAPiKey,
//       PointLatLng(_originLatitude, _originLongitude),
//       PointLatLng(_destLatitude, _destLongitude),
//       travelMode: TravelMode.bicycling,);
//     // print('result ${result.points}');
//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     }
//     _addPolyLine();
//   }
// }
//
//
//
//
//
