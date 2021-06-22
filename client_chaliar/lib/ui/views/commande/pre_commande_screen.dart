import 'package:client_chaliar/constants/iconList.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/widgets/appBar.dart';
import 'package:client_chaliar/ui/widgets/button.dart';
import 'package:client_chaliar/ui/widgets/svg_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timelines/timelines.dart';



class PreCommandeScreen extends StatefulWidget {


  @override
  _PreCommandeScreenState createState() => _PreCommandeScreenState();
}

class _PreCommandeScreenState extends State<PreCommandeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                  _scaffoldKey.currentState.openDrawer();
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
                child: Column(
                  children: [
                    TimelineTile(
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
                        indicator: DotIndicator(),
                        endConnector: DashedLineConnector(),
                      ),
                    ),
                    Container(
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
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // child: GoogleMap(
                  //   onMapCreated: _onMapCreated,
                  //   initialCameraPosition: CameraPosition(
                  //     target: _center,
                  //     zoom: 11.0,
                  //   ),
                  // ),
                ),),
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
                  height: MediaQuery.of(context).size.height * 0.07,
                  mediaQueryWidth: 0.30,
                  borderRaduis: 50,
                  backgroundcolor: ChaliarColors.primaryColors,
                  bordercolor: ChaliarColors.primaryColors,
                  textStyle: AppTextStyle.button(
                      color: ChaliarColors.whiteColor)),
            ),
          )
        ],
      ),
    );
  }
}

