import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model_views/authentification/pre_onboardingVM.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:provider/provider.dart';

class ConditionGeneraleScreen extends StatefulWidget {
  final String? userId;
  ConditionGeneraleScreen({this.userId});
  @override
  _ConditionGeneraleScreenState createState() => _ConditionGeneraleScreenState();
}

class _ConditionGeneraleScreenState extends State<ConditionGeneraleScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ConditionnalTermViewModel>(
      create: (context) => ConditionnalTermViewModel(),
      child: Consumer<ConditionnalTermViewModel>(
          builder: (context, model, child) =>
              Scaffold(
                backgroundColor: Colors.white,
                resizeToAvoidBottomInset: false,
                body: SingleChildScrollView(
                  child:  Stack(
                    children: [
                      Container(
                        height: 540,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/blueGrad.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 80.0,
                          ),
                          Center(
                            child: SvgPicture.asset(
                              "assets/images/logo.svg",
                              height: 120,
                              width: 120,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                                    FutureBuilder(future:model.getUserD(widget.userId!),
              builder: (context,AsyncSnapshot<DocumentSnapshot>snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return CircularProgressIndicator();
                }
                if (snapshot.data!=null){
                  Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                  var user=UserChaliar.fromData(data);
                  print(snapshot.data!.data());
                  return  Text.rich(
                    TextSpan(
                      text: "Bienvenue , ${user.surname}",
                      style: AppTextStyle.headerApp1(color: ChaliarColors.whiteColor),
                    ),
                  );
                } return CircularProgressIndicator();
                    }),


                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.132,
                                right: MediaQuery.of(context).size.width * 0.132),
                            child: Text(
                              "Faites-vous livrer vos colis dans toute la France en temps r??el, ou sur rdv",
                              textAlign: TextAlign.center,
                              style: AppTextStyle.bodyApp1(
                                  color: ChaliarColors.whiteColor),
                            ),
                          ),
                          Center(
                            child: SvgPicture.asset(
                              "assets/images/super_fast_delivery_man_fly.svg",
                              height: 300,
                              width: 150,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07),
                            child: Center(
                              child: ListTile(
                                  leading: Radio(
                                    activeColor: ChaliarColors.primaryColors,
                                    value: 'accepted',
                                    groupValue: 'accepted',
                                    onChanged: (value) {},
                                  ),
                                  title: Align(
                                    alignment: Alignment(- MediaQuery.of(context).size.width * 0.007, 0),
                                    child:GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(context, '/term_condition');
                                      },
                                      child: Text(
                                        'Vous acceptez nos conditions g??n??rales\nd\'utilisations',
                                        textAlign: TextAlign.left,
                                        style: AppTextStyle.bodyApp1(
                                            color: ChaliarColors.blackColor,isUnderlined:true),
                                      ),
                                    ),
                                  )),
                            ),),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Center(
                            child: FutureBuilder(future:model.getUserD(widget.userId!),
                                builder: (context,AsyncSnapshot<DocumentSnapshot>snapshot) {
                                  if (snapshot.connectionState != ConnectionState.done) {
                                    return CircularProgressIndicator();
                                  }
                                  if (snapshot.data!=null){
                                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                                    var user=UserChaliar.fromData(data);
                                    print(snapshot.data!.data());
                                    return  ButtonChaliar(
                                      onTap: () {
                                        model.getHomePage(context, user.email!, user.password!);
                                      },
                                      buttonText: 'C\'est parti',
                                      height: MediaQuery.of(context).size.height * 0.06,
                                      mediaQueryWidth: 0.25,
                                      borderRaduis: 40,
                                      backgroundcolor: ChaliarColors.primaryColors,
                                      bordercolor: ChaliarColors.primaryColors,
                                      textStyle: AppTextStyle.button(
                                          color: ChaliarColors.whiteColor),
                                    );
                                  } return CircularProgressIndicator();
                                }),
                          ),
                          SizedBox(
                            height:91,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

              )
      ),);
  }
}

