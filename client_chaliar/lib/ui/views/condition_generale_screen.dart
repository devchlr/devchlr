import 'dart:ui';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/chaliar_font.dart';
import 'package:client_chaliar/ui/styles/chaliar_font_size.dart';
import 'package:client_chaliar/ui/styles/chaliar_icon_size.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:client_chaliar/ui/widgets/input_field.dart';
import 'package:client_chaliar/ui/widgets/svg_button.dart';
import 'package:client_chaliar/constants/iconList.dart';
import 'package:client_chaliar/ui/widgets/button.dart';

class ConditionGeneraleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/blueGrad.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: ChaliarColors.whiteColor,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35.0,
                    ),
                    Center(
                      child: SvgPicture.asset(
                        "assets/images/logo.svg",
                        height: AppIconSize.medium,
                        width: AppIconSize.medium,
                      ),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text.rich(
                      TextSpan(
                        text: "CHALIAR",
                        style: TextStyle(
                            fontFamily: AppFontFamilly.montserrat,
                            color: ChaliarColors.whiteColor,
                            fontSize: AppFontSize.large2_1,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Bienvenue Jonathan,",
                        style: TextStyle(
                            fontFamily: AppFontFamilly.montserrat,
                            color: ChaliarColors.whiteColor,
                            fontSize: AppFontSize.large2_1_1,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.132,
                          right: MediaQuery.of(context).size.width * 0.132),
                      child: Text(
                        "Faites vous livrer vos colis dans toute la France en temps réel, ou sur rdv",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.caption(
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
                    SizedBox(
                      height: 1.0,
                    ),
                    Center(
                      child: ListTile(
                        leading: Radio(
                          activeColor: ChaliarColors.primaryColors,
                          value: 'accepted',
                          groupValue: 'accepted',
                          onChanged: (value) {},
                        ),
                        title: GestureDetector(
                          onTap: () {
                            print('Condition text typed');
                          },
                          child: Text(
                            'Vous acceptez nos conditions générales d’utilisations',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.caption(
                                color: ChaliarColors.blackColor),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: ButtonChaliar(
                        onTap: () => Navigator.pushReplacementNamed(
                            context, '/condition_generale'),
                        buttonText: 'C\'est parti',
                        height: 60.0,
                        mediaQueryWidth: 0.35,
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
    );
  }
}
