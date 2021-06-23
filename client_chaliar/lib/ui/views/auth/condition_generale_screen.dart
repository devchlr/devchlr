import 'dart:ui';
import 'package:client_chaliar/business_logic/models/model_user.dart';
import 'package:client_chaliar/business_logic/view_model/auth/condition_term_view_model.dart';
import 'package:client_chaliar/business_logic/view_model/auth/singin_view_model.dart';
import 'package:client_chaliar/services/auth_service.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/chaliar_font.dart';
import 'package:client_chaliar/ui/styles/chaliar_font_size.dart';
import 'package:client_chaliar/ui/styles/chaliar_icon_size.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:client_chaliar/ui/widgets/input_field.dart';
import 'package:client_chaliar/ui/widgets/svg_button.dart';
import 'package:client_chaliar/constants/iconList.dart';
import 'package:client_chaliar/ui/widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';


class ConditionGeneraleScreen extends StatefulWidget {
  UserChaliar user;
  ConditionGeneraleScreen({this.user});
  @override
  _ConditionGeneraleScreenState createState() => _ConditionGeneraleScreenState();
}

class _ConditionGeneraleScreenState extends State<ConditionGeneraleScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.user.phone);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ConditionnalTermViewModel>(
      create: (context) => ConditionnalTermViewModel(),
      child: Consumer<ConditionnalTermViewModel>(
        builder: (context, model, child) =>
            Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ChaliarColors.whiteColor,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.69,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/blueGrad.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ChaliarColors.whiteColor,
                          ),
                        ),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 35.0,
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
                            Text.rich(
                              TextSpan(
                                text: "Bienvenue ${widget.user.surname},",
                                style: AppTextStyle.headerApp1(color: ChaliarColors.whiteColor),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.132,
                                  right: MediaQuery.of(context).size.width * 0.132),
                              child: Text(
                                "Faites-vous livrer vos colis dans toute la France en temps réel, ou sur rdv",
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
                                          print('Condition text typed');
                                        },
                                        child: Text(
                                          'Vous acceptez nos conditions générales\nd’utilisations',
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
                              child: ButtonChaliar(
                                onTap: () => Navigator.pushReplacementNamed(
                                    context, '/pre_commande'),
                                buttonText: 'C\'est parti',
                                height: MediaQuery.of(context).size.height * 0.06,
                                mediaQueryWidth: 0.25,
                                borderRaduis: 40,
                                backgroundcolor: ChaliarColors.primaryColors,
                                bordercolor: ChaliarColors.primaryColors,
                                textStyle: AppTextStyle.button(
                                    color: ChaliarColors.whiteColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
      ),);
  }
}

