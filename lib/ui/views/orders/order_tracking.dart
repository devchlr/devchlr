import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/model_views/order/trackingMV.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
import 'package:flutter_app/ui/widgets/loading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderTrackingScreen extends StatefulWidget {
  @override
  _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
TrackingMV trackingMV=TrackingMV();
  void initState() {
    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GoogleMapController? mapController;
  void _onMapCreated(GoogleMapController controller) async{
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider<TrackingMV>(
        create: (context) => TrackingMV(),
        child: Consumer<TrackingMV>(
            builder: (context, model, child) =>
                FutureBuilder<DocumentSnapshot>(
                    future: model.getOrderInformation(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Container(
                          color: Colors.white,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,),
                          ),
                        );
                      }

                      Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                      // print(data);
                      var oderId=snapshot.data!.id;
                      var order=Order.fromJson(data);
                      model.orderInformation=order;
                      var deliveryInformation=OrderDeliveryInformation.fromJson(order.deliveryInformation!);
                      var packageInfornation=OrderPackageInformation.fromJson(order.packageInformation!);
                      var recipientInformation=OrderRecipientInformation.fromJson(order.recipientInformation!);
                      return Scaffold(
                        backgroundColor: Color(0xffF3F3F3),
                        body: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 110,
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                  ),
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.2,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF3F3F3),
                                  ),
                                  child: ListView(
                                    children: [
                                      GestureDetector(
                                        onTap: () {

                                        },
                                        child: TimelineTile(
                                          nodeAlign: TimelineNodeAlign.start,
                                          contents: Card(
                                            child: Container(
                                              height: 44.1,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              padding: EdgeInsets.all(10.0),
                                              child: Text(
                                                '${deliveryInformation.departure_address!.description}',
                                                style: AppTextStyle
                                                    .captionPreCommande(
                                                    color: ChaliarColors
                                                        .secondaryColors),),
                                            ),
                                          ),
                                          node: TimelineNode(
                                            indicator: DotIndicator(

                                            ),
                                            endConnector: DashedLineConnector(),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(onTap: () {
                                      },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 3.0
                                          ),
                                          child: TimelineTile(
                                            nodeAlign: TimelineNodeAlign.start,
                                            contents: Card(
                                              child: Container(
                                                color: ChaliarColors
                                                    .whiteGreyColor,
                                                height: 44.10,
                                                width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.all(12.0),
                                                child: Text(
                                                  '${recipientInformation.arrival_address!.description}',
                                                  style: AppTextStyle
                                                      .captionPreCommande(
                                                      color: ChaliarColors
                                                          .secondaryColors),),
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
                                  child: Container(
                                    child:
                                    FutureBuilder(
                                      future: model.initMap(context),
                                      builder: (context,snap){
                                        if(snap.connectionState!=ConnectionState.done){
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                        return GoogleMap(
                                          onMapCreated: _onMapCreated,
                                          markers: Set<Marker>.of(model.markers.values),
                                          polylines: Set<Polyline>.of(
                                              model.polylines.values),
                                          myLocationEnabled: true,
                                          tiltGesturesEnabled: true,
                                          compassEnabled: true,
                                          scrollGesturesEnabled: true,
                                          zoomGesturesEnabled: true,
                                          initialCameraPosition: CameraPosition(
                                            target: model.center,
                                            zoom: 15.0,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.68,
                              ),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                elevation: 1,
                                child: Container(
                                  color: Color(0xffffffff),
                                  height: 250,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  padding: EdgeInsets.only(
                                  ),
                                  margin: EdgeInsets.only(
                                      left: 20,
                                      right: 20
                                  ),
                                  child:
                                      FutureBuilder(
                                        future: model.getUserInfo(order.delivery_id!),
    builder: (context,AsyncSnapshot<DocumentSnapshot>snapshotDeliver) {
      if (snapshotDeliver.connectionState != ConnectionState.done) {
        return Container(
          color: Colors.white,
          child: Center(
            child: LoadingForm(),
          ),
        );
      }

      Map<String, dynamic> senderData = snapshotDeliver.data!.data() as Map<
          String,
          dynamic>;
      var deliverInfo = UserChaliar.fromData(senderData);
    return  ListView(
        padding: EdgeInsets.only(
            top: 10
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween,
            children: [
              Text(
                'Votre livreur arrive dans 5 min',
                style: AppTextStyle.appBarHeader(
                    color: Color(0xff222B45),
                    size: 9.8,
                    fontWeight: FontWeight.w400
                ),),
              Text('Annnuler la course',
                style: AppTextStyle.appBarHeader(
                    color: Color(0xff222B45),
                    size: 9.8,
                    fontWeight: FontWeight.w400
                ),),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 2,
            color: ChaliarColors.whiteGreyColor,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 95,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "${deliverInfo.profile_url.toString()}"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly,
                      children: [
                        Text('${deliverInfo.surname}',
                          style: AppTextStyle
                              .appBarHeader(
                            color: Color(
                                0xff222B45),
                            size: 10.8,
                            fontWeight: FontWeight
                                .w400,
                          ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: [
                            SvgPicture.asset(
                              SvgIcons.start,
                              height: 13,
                              width: 12,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('${deliverInfo.name}',
                              style: AppTextStyle
                                  .appBarHeader(
                                color: Color(
                                    0xff222B45),
                                size: 7.92,
                                fontWeight: FontWeight
                                    .w400,
                              ),),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              SvgIcons.pin,
                              height: 13,
                              width: 12,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('8 courses',
                              style: AppTextStyle
                                  .appBarHeader(
                                color: Color(
                                    0xff222B45),
                                size: 7.92,
                                fontWeight: FontWeight
                                    .w400,
                              ),),
                            SizedBox(
                              width: 11,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment
                      .start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .start,
                      children: [
                        SvgPicture.asset(
                          SvgIcons.white_visa,
                          height: 13,
                          width: 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('**** **** **** 7539',
                          style: AppTextStyle
                              .appBarHeader(
                            color: Color(
                                0xff222B45),
                            size: 7.92,
                            fontWeight: FontWeight
                                .w400,
                          ),),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SvgPicture.asset(
                        'assets/icons/facture/${packageInfornation.package_size!
                            .toLowerCase()}.svg',
                        height: 36,
                        width: 59,
                        color: Color(0xff042C5C),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 2,
            color: ChaliarColors.whiteGreyColor,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween,
            children: [
              Center(
                child: ButtonChaliar(
                    onTap: () {
                      //add message call view function
                      // Navigator.pushNamed(context,
                      //     '/order_message');

                      model.getMessageScreen(oderId, context, order.delivery_id!);
                    },
                    buttonText: 'Message',
                    height: 49,
                    mediaQueryWidth: 0.25,
                    borderRaduis: 10,
                    backgroundcolor: Color(
                        0xff042C5C),
                    bordercolor: Color(0xff042C5C),
                    textStyle: AppTextStyle
                        .appBarHeader(
                        size: 8.64,
                        color: ChaliarColors
                            .whiteColor)),
              ),
              Center(
                child: ButtonChaliar(
                    onTap: () =>
                        launch("tel://21213123123"),
                    buttonText: 'APPELER',
                    height: 49,
                    mediaQueryWidth: 0.15,
                    borderRaduis: 10,
                    backgroundcolor: Color(
                        0xffffffff),
                    bordercolor: Color(0xff042C5C),
                    textStyle: AppTextStyle
                        .appBarHeader(
                        size: 8.64,
                        color: Color(0xff042C5C))),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      )
      ;

    })),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                              ),
                              child: CustomHearder(
                                title: 'Commande',
                                description: '',
                              ),
                            ),
                          ],
                        ),
                      );
                    }),),);
  }

}





