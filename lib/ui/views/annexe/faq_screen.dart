import 'package:flutter/material.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/appBar.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timelines/timelines.dart';

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
      appBar: ChaliarMenu.topBar(
          leading: Icon(Icons.arrow_back_ios),
          title: 'Faq',
          bgColor: ChaliarColors.whiteColor,
          imageBackground: 'assets/images/header.png'
      ),


      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
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
                    children: [
                      Card(
                        elevation: 2.0,
                        child: ExpansionTile(
                          trailing: Text(''),
                          title: Text("Livraison programme",style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors),),
                          children: [
                          ],
                        ),
                      ),
                      SizedBox(height: 13.0,),
                      Card(
                        elevation: 2.0,
                        child: ExpansionTile(
                          trailing: Text(''),
                          title: Text("Livraison programme",style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors),),
                          children: [
                          ],
                        ),
                      ),
                      SizedBox(height: 13.0,),
                      Card(
                        elevation: 2.0,
                        child: ExpansionTile(
                          trailing: Text(''),
                          title: Text("Livraison programme",style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors),),
                          children: [
                          ],
                        ),
                      ),
                      Padding(
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
                      )
                    ],
                  ),
                ),),
            ],
          ),
        ],
      ),
    );
  }
}

