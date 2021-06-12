import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:client_chaliar/ui/styles/chaliar_icon_size.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/widgets/custom_radio_listTile.dart';
import 'package:client_chaliar/ui/widgets/button.dart';

class ProParticulierScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bgBlueHmVelo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ChaliarColors.whiteColor,
                    ),
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 45),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/images/logo.svg",
                            height: AppIconSize.large,
                            width: AppIconSize.large,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "CHALIAR",
                          style: AppTextStyle.header3(
                              color: ChaliarColors.whiteColor),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Bienvenue sur Chaliar",
                          style: AppTextStyle.header3(
                              color: ChaliarColors.blackColor),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.height * 0.1,
                        decoration:
                            BoxDecoration(color: ChaliarColors.whiteGreyColor),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.12,
                      ),
                      CustomRadioListTile(
                          radioColor: ChaliarColors.primaryColors,
                          width: 0.55,
                          heigth: 0.13,
                          raduis: 5.0,
                          title: 'Je suis un particuier',
                          subtile:
                              'je veux me faire livrer des colis personnellement',
                          group: 'professionnel',
                          value: 'particulier',
                          onChange: (value) {
                            print(value);
                          }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      CustomRadioListTile(
                          radioColor: ChaliarColors.primaryColors,
                          width: 0.55,
                          heigth: 0.13,
                          raduis: 5.0,
                          title: 'Je suis un profesionnel',
                          subtile:
                              'je veux me faire livrer des colis pour ma société',
                          group: 'professionnel',
                          value: 'professionnel',
                          onChange: (value) {
                            print(value);
                          }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      ButtonChaliar(
                          onTap: () => Navigator.pushReplacementNamed(
                              context, '/inscription'),
                          buttonText: 'Suivant',
                          height: 60.0,
                          mediaQueryWidth: 0.25,
                          borderRaduis: 50,
                          backgroundcolor: ChaliarColors.primaryColors,
                          bordercolor: ChaliarColors.primaryColors,
                          textStyle: AppTextStyle.button(
                              color: ChaliarColors.whiteColor))
                    ],
                  ))
            ]),
          )
        ],
      ),
    );
  }
}
