import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/widgets/button.dart';
import 'package:client_chaliar/ui/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:timelines/timelines.dart';

import 'package:flutter_svg/flutter_svg.dart';

class TestShape extends StatefulWidget {


  @override
  _TestShapeState createState() => _TestShapeState();
}

class _TestShapeState extends State<TestShape> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
              child: Material(
                child:
                CustomScrollView(
                  slivers: [
              //   SliverAppBar(
              //     centerTitle: true,
              //   title: Text(
              //   'Inscription',
              //     style: AppTextStyle.appBarHeader(color: ChaliarColors.whiteColor),
              //   ),
              //   backgroundColor: Colors.blue,
              // ),
                    SliverPersistentHeader(
                      delegate: CustomAppBar(height: 100),
                      pinned: true,
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate(
                        [
                          Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width*0.07,
                              right: MediaQuery.of(context).size.width*0.07
                            ),
                            child: GestureDetector(
                              onTap:()=>Navigator.pushNamed(context, '/commande_depart_form'),
                              child: TimelineTile(
                                nodeAlign: TimelineNodeAlign.start,
                                contents: Card(
                                  child: Container(
                                    height: 45,
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
                          ),
                          Padding(
                          padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width*0.07,
                          right: MediaQuery.of(context).size.width*0.07
                          ),
                            child: GestureDetector(onTap:()=>Navigator.pushNamed(context, '/commande_depart_form'),child: Container(
                            margin: EdgeInsets.only(
                                left: 3.0
                            ),
                            child: TimelineTile(
                              nodeAlign: TimelineNodeAlign.start,
                              contents: Card(
                                child: Container(
                                  color: ChaliarColors.whiteGreyColor,
                                  height: 45,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text('Position de d\'arrive du colis',style: AppTextStyle.captionPreCommande(color:ChaliarColors.secondaryColors),),
                                ),
                              ),
                              node: TimelineNode(
                                overlap: true,
                                position: 50.0,
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
                          ),
                          ),)
                        ]
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.5,
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
                          ]
                      ),
                    ),

                  ],
                ),
              ),
    );
  }
}


class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint_0.shader = ui.Gradient.linear(Offset(size.width*0.50,size.height*0.04),Offset(size.width*0.50,size.height*0.55),[Color(0xff1083f0),Color(
        0xff379fcb),Color(0xff379fcb),Color(0xff188deb)],[0.00,0.30,0.61,1.00]);

    Path path_0 = Path();
    path_0.moveTo(size.width*0.0051724,size.height*0.0434783);
    path_0.lineTo(size.width*0.0051724,size.height*0.4836957);
    path_0.quadraticBezierTo(size.width*0.0111897,size.height*0.4819565,size.width*0.1715517,size.height*0.5108696);
    path_0.cubicTo(size.width*0.2759397,size.height*0.5250000,size.width*0.2691810,size.height*0.5230978,size.width*0.3017241,size.height*0.5271739);
    path_0.quadraticBezierTo(size.width*0.4977672,size.height*0.5413768,size.width*0.5066983,size.height*0.5406522);
    path_0.quadraticBezierTo(size.width*0.4781552,size.height*0.5462319,size.width*0.6008017,size.height*0.5420652);
    path_0.cubicTo(size.width*0.7438879,size.height*0.5337681,size.width*0.6206897,size.height*0.5432971,size.width*0.7987241,size.height*0.5349638);
    path_0.quadraticBezierTo(size.width*0.8368190,size.height*0.5301993,size.width*0.9931034,size.height*0.4855072);
    path_0.lineTo(size.width*0.9931034,size.height*0.3623188);
    path_0.lineTo(size.width*0.9931034,size.height*0.2735507);
    path_0.lineTo(size.width*0.9931034,size.height*0.1811594);
    path_0.lineTo(size.width*0.9922414,size.height*0.0851449);
    path_0.lineTo(size.width*0.9939655,size.height*0.0452899);
    path_0.lineTo(size.width*0.6905172,size.height*0.0434783);
    path_0.lineTo(size.width*0.3448276,size.height*0.0489130);
    path_0.lineTo(size.width*0.0663793,size.height*0.0434783);
    path_0.lineTo(size.width*0.0051724,size.height*0.0434783);
    path_0.close();

    canvas.drawPath(path_0, paint_0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}




// return SafeArea(
// child: Material(
// child: CustomScrollView(
// slivers: [
// SliverPersistentHeader(
// delegate: CustomAppBar(height: 100),
// pinned: true,
// ),
// Stack(
// children: [
// Column(
// children: [
// Expanded(
// flex: 1,
// child: Container(
// decoration: BoxDecoration(
// color: ChaliarColors.whiteColor,
// image: DecorationImage(
// image: AssetImage("assets/images/bgPageBohomme.png"),
// fit: BoxFit.fill,
// ),
// ),
// ),
// ),
// Container(
// height: MediaQuery.of(context).size.height * 0.2,
// decoration: BoxDecoration(
// color: ChaliarColors.whiteColor,
// ),
// ),
// ],
// ),
// Column(
// children: [
// SizedBox(
// height: MediaQuery.of(context).size.height *0.15,
// ),
// Center(
// child: Text(
// 'Vous Aurez deux fois plus de chances\nde trouver un chaliar si vous ajoutez\ndes photos de votre annonce.',
// style: AppTextStyle.addPhotodesc(color: ChaliarColors.whiteColor),
// textAlign: TextAlign.center,
// ),
// ),
// SizedBox(
// height: MediaQuery.of(context).size.height *0.03,
// ),
// Center(
// child:GestureDetector(
// onTap:(){} ,
// child:Container(
// height: 60,
// width: MediaQuery.of(context).size.height * 0.3,
// decoration:BoxDecoration(
// color: ChaliarColors.secondaryColors,
// borderRadius: BorderRadius.circular(100.0),
// ),
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Expanded(
// flex: 1,
// child: Center(
// child: Icon(Icons.camera_alt,color: ChaliarColors.whiteColor,),
// ),
// ),
// Expanded(
// flex: 3,
// child: Padding(
// padding: EdgeInsets.only(
// top:20.0
// ),
// child:Text('Prendre la photo',style: AppTextStyle.addPhotoBtn(color: ChaliarColors.whiteColor)
// ),),
// ),
// ],
// ),
// ),
// )
// ,
// ),
// SizedBox(
// height: MediaQuery.of(context).size.height *0.02,
// ),
// Center(
// child: Text(
// 'passer cette étape',
// style: AppTextStyle.addPhotoCaption(color: ChaliarColors.whiteColor),
// textAlign: TextAlign.center,
// ),
// ),
// ],
// ),
// Positioned(
// bottom: 10.0,
// right: 20.0,
// child: SvgPicture.asset(
// "assets/images/bonhomme.svg",
// height: 325,
// width: 297,
// ),
// ),
// Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: EdgeInsets.only(
// left:MediaQuery.of(context).size.width * 0.43,
// right:MediaQuery.of(context).size.width * 0.43,
// ),
// child:CircleAvatar(
// radius: 27.0,
// backgroundColor: ChaliarColors.whiteColor,
// child: Icon(Icons.close_outlined,color: ChaliarColors.primaryColors,),
// )
// )
// ],
// )
// ],
// ),
// ],
// ),
// ),
// );
