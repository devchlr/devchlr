import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/appBar.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
class FaqScreen extends StatefulWidget {

  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: ChaliarMenu.topBar(
      //     leading: Icon(Icons.arrow_back_ios),
      //     title: 'Faq',
      //     bgColor: ChaliarColors.whiteColor,
      //     imageBackground: 'assets/images/header.png'
      // ),
      body:
          Stack(
           children: [
             StreamBuilder(
               stream: FirebaseFirestore.instance.collection('faq').snapshots(),
               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                 if(snapshot.hasError){
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                 }
                 if(snapshot.data==null){
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                 }
                 return Stack(
                   children: [
                     Column(
                       children: [
                         Container(
                           height: MediaQuery.of(context).size.height*0.18,
                         ),
                         Container(
                           height: 40,
                           decoration: BoxDecoration(
                             color: ChaliarColors.whiteColor,
                           ),
                           child: Center(
                             child: Text('Comment pouvons nous vous aider ?'),
                           ),
                         ),
                         Expanded(
                           flex: 1,
                           child: Container(
                             padding: EdgeInsets.only(
                                 left:20.0,
                                 right: 20.0
                             ),
                             child: ListView(
                               children: snapshot.data!.docs.map((document){
                                 return Card(
                                   elevation: 2.0,
                                   child: ExpansionTile(
                                     trailing: Text(''),
                                     title: Text(document['title'],style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors),),
                                     children: [
                                       Padding(padding: EdgeInsets.all(5),
                                         child:  Text(document['description'],textAlign:TextAlign.left,style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors),),
                                       ),
                                     ],
                                   ),
                                 );
                               }).toList(),
                               //   Card(
                               //     elevation: 2.0,
                               //     child: ExpansionTile(
                               //       trailing: Text(''),
                               //       title: Text("Quelles sont les différentes étapes de ma candidature ?",style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors),),
                               //       children: [
                               //       ],
                               //     ),
                               //   ),
                               //   SizedBox(height: 13.0,),
                               //   Card(
                               //     elevation: 2.0,
                               //     child: ExpansionTile(
                               //       trailing: Text(''),
                               //       title: Text("Comment fonctionne le contrôle d'identité ?",style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors),),
                               //       children: [
                               //       ],
                               //     ),
                               //   ),
                               //   Padding(
                               //     padding: EdgeInsets.only(
                               //       top: MediaQuery.of(context).size.height * 0.05,
                               //     ),
                               //     child: Center(
                               //       child: ButtonChaliar(
                               //           onTap: () {
                               //           },
                               //           buttonText: 'Contacter le support',
                               //           height: MediaQuery.of(context).size.height * 0.07,
                               //           mediaQueryWidth: 0.30,
                               //           borderRaduis: 50,
                               //           backgroundcolor: ChaliarColors.primaryColors,
                               //           bordercolor: ChaliarColors.primaryColors,
                               //           textStyle: AppTextStyle.button(
                               //               color: ChaliarColors.whiteColor)),
                               //     ),
                               //   )
                               // ],
                             ),
                           ),
                         ),
                         Container(
                           height: 150,
                           child:  Padding(
                             padding: EdgeInsets.only(
                               top: MediaQuery.of(context).size.height * 0.05,
                             ),
                             child: Center(
                               child: ButtonChaliar(
                                   onTap: () {
                                   },
                                   buttonText: 'Contacter le support',
                                   height: MediaQuery.of(context).size.height * 0.07,
                                   mediaQueryWidth: 0.30,
                                   borderRaduis: 50,
                                   backgroundcolor: ChaliarColors.primaryColors,
                                   bordercolor: ChaliarColors.primaryColors,
                                   textStyle: AppTextStyle.button(
                                       color: ChaliarColors.whiteColor)),
                             ),
                           ),
                         )
                       ],
                     ),
                   ],
                 );
               },
             ),
             Padding(
               padding: EdgeInsets.only(
                   top: 0
               ),
               child: CustomHearder(
                 title: "Faq",
               ),
             ),
           ],
          ),


    );
  }
}

