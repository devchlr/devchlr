import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/model_views/order/order_scanning.dart';
import 'package:flutter_app/models/adress.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/custom_botom_navigation_bar.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
import 'package:flutter_app/ui/widgets/loading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:timelines/timelines.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/scheduler.dart';


class OrderScanScreen extends StatefulWidget {
  String? orderId;
  OrderScanScreen({this.orderId});
  FirebaseAuth _auth =FirebaseAuth.instance;
  @override
  _OrderScanScreenState createState() => _OrderScanScreenState();
}

class _OrderScanScreenState extends State<OrderScanScreen> {

  void initState() {
    super.initState();
  }
  void nextScreen()async{
      Timer(Duration(seconds: 10),
              () => Navigator.pushReplacementNamed(context, '/order_tracking'));
  }
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Completer<GoogleMapController> _controller = Completer();

  GoogleMapController? mapController;
  final LatLng _center = const LatLng(48.85341, 2.3488);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderScanningVM>(
        create: (context) => OrderScanningVM(),
        child: Consumer<OrderScanningVM>(
            builder: (context, model, child) =>
        StreamBuilder<DocumentSnapshot>(
        stream: model.getOrderInformation(widget.orderId!),
    builder: (context, snapshot){
    // if(snapshot.connectionState!=ConnectionState.done){
    // return Container(
    // child: Center(
    // child: CircularProgressIndicator(color: Colors.blue,),
    // ),
    // );
    // }
    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
    // print(data);
    var order=Order.fromJson(data);
    var deliveryInformation=OrderDeliveryInformation.fromJson(order.deliveryInformation!);
    var packageInfornation=OrderPackageInformation.fromJson(order.packageInformation!);
    var recipientInformation=OrderRecipientInformation.fromJson(order.recipientInformation!);
    AdressLocalisation departAdress=deliveryInformation.departure_address!;
    AdressLocalisation arrivalAdress=recipientInformation.arrival_address!;
    print('order id :${order.orderId}');
    if(order.isValidate!=true){
      return  Scaffold(
        backgroundColor: Color(0xffF3F3F3),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 90,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      top: 10.0
                  ),
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Color(0xffF3F3F3),
                  ),
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap:() {
                        },
                        child: TimelineTile(
                          nodeAlign: TimelineNodeAlign.start,
                          contents: Card(
                            child: Container(
                              height: 44.1,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(10.0),
                              child: Text('${departAdress.description}',style: AppTextStyle.captionPreCommande(color:ChaliarColors.secondaryColors),),
                            ),
                          ),
                          node: TimelineNode(
                            indicator: DotIndicator(

                            ),
                            endConnector: DashedLineConnector(),
                          ),
                        ),
                      ),
                      GestureDetector(onTap:(){

                         },child: Container(
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
                              padding: EdgeInsets.all(12.0),
                              child: Text('${arrivalAdress.description}',style: AppTextStyle.captionPreCommande(color:ChaliarColors.secondaryColors),),
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
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _center,
                        zoom: 11.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 90,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      top: 10.0
                  ),
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Expanded(
                  flex: 1,
                  child:  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/scan_map_bg.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.1,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      SvgIcons.radar_chaliar,
                      height: 129,
                      width: 128,
                    ),
                  ),SizedBox(
                    height: 25,
                  ),
                  Text('Recherche d’un chaliar …',style: AppTextStyle.appBarHeader(
                      size: 16,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w400
                  ),)
                ],
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
    }

     return IntitContainer();

    })));
  }
}



class IntitContainer extends StatefulWidget {
 IntitContainer({Key? key,}) : super(key: key);

  @override
  _IntitContainerState createState() => _IntitContainerState();
}

class _IntitContainerState extends State<IntitContainer> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Navigator.of(context).pushNamed('/order_tracking');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: LoadingForm(),
    );
  }
}


