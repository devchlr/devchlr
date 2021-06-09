import 'dart:ui';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/chaliar_font.dart';
import 'package:client_chaliar/ui/styles/chaliar_font_size.dart';
import 'package:client_chaliar/ui/styles/chaliar_icon_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:client_chaliar/ui/widgets/svg_button.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    ChaliarColors.primaryColors,
                    ChaliarColors.secondaryColors,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200.0,
                      ),
                      Center(
                        child: SvgPicture.asset(
                          "assets/images/logo.svg",
                          color: ChaliarColors.whiteColor,
                          height: AppIconSize.large,
                          width: AppIconSize.large,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text.rich(TextSpan(
                        text: "CHALIAR",
                        style: TextStyle(
                            fontFamily: AppFontFamilly.montserrat,
                            color: ChaliarColors.whiteColor,
                            fontSize: AppFontSize.largest,
                            fontWeight: FontWeight.w300),
                      ))
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'POWERED\n@LIKEWEB AGENCY',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppFontFamilly.avenirHeavy,
                        fontSize: AppFontSize.small,
                        fontWeight: FontWeight.w300,
                      ),
                    )
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
