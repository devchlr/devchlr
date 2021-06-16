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

class SingInScreen extends StatefulWidget {
  @override
  _SingInScreenState createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/blueGrad.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Center(
                        child: SvgPicture.asset(
                          "assets/images/logo.svg",
                          height: 120,
                          width: 120,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Contents de vous revoir",
                          style: AppTextStyle.headerApp1(color: ChaliarColors.whiteColor),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 3,
                child: ListView(children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.1),
                    child: InputField(
                      prefixIcon: SvgIconButton(
                          iconAsset: SvgIcons.profile,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      fieldSize: 20,
                      label: "Email,Telephone",
                      placeholder: "Prénom",
                      textFillColor: ChaliarColors.whiteColor,
                      borderColor: ChaliarColors.whiteColor,
                      isBorder: true,
                      raduis: 50,
                      // controller: model.email,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.1),
                    child: InputField(
                      prefixIcon: SvgIconButton(
                          iconAsset: SvgIcons.padlock,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      suffixIcon: SvgIconButton(
                          iconAsset: SvgIcons.eye_close,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      fieldSize: 20,
                      label: "Mot de passe",
                      placeholder: "Prénom",
                      textFillColor: ChaliarColors.whiteColor,
                      borderColor: ChaliarColors.whiteColor,
                      isBorder: true,
                      raduis: 50,
                      // controller: model.email,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                          right: MediaQuery.of(context).size.width * 0.1),
                      child: Center(
                        child: Text(
                          'Mot de passe oublié ?',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.bodyApp1(
                              color: ChaliarColors.whiteColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.25,
                        right: MediaQuery.of(context).size.width * 0.25),
                    child: ButtonChaliar(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, '/condition_generale'),
                      buttonText: 'Suivant',
                      height: MediaQuery.of(context).size.height * 0.065,
                      mediaQueryWidth: 0.25,
                      borderRaduis: 40,
                      backgroundcolor: ChaliarColors.secondaryColors,
                      bordercolor: ChaliarColors.secondaryColors,
                      textStyle:
                          AppTextStyle.button(color: ChaliarColors.whiteColor),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Center(
                        child: Text(
                          'Vous acceptez nos conditions générales d’utilisations',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.caption(
                              color: ChaliarColors.whiteColor),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
