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
               Container(
                  height: MediaQuery.of(context).size.height * 0.52,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bgBlueHmVelo.png"),
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
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

              Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.115),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/images/logo.svg",
                            height: 129,
                            width: 128,
                          ),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Bienvenue sur Chaliar",
                          style: AppTextStyle.headerApp1(
                              color: ChaliarColors.blackColor),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        height: 3,
                        width: MediaQuery.of(context).size.height * 0.1,
                        decoration:
                            BoxDecoration(color: ChaliarColors.whiteGreyColor),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      CustomRadioListTile(
                          radioColor: ChaliarColors.secondaryColors,
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
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      CustomRadioListTile(
                          radioColor: ChaliarColors.secondaryColors,
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
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      ButtonChaliar(
                          onTap: () => Navigator.pushReplacementNamed(
                              context, '/inscription'),
                          buttonText: 'Suivant',
                          height: MediaQuery.of(context).size.height * 0.07,
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