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
        children: [
          Container(
            decoration: BoxDecoration(color: ChaliarColors.primaryColors),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 250, top: 50),
            child: Center(
              child: SvgPicture.asset(
                "assets/images/courier.svg",
                height: 490,
                width: 490,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.4,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: ChaliarColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: ChaliarColors.secondaryColors,
                    offset: Offset(0.0, 01.0), //(x,y)
                    blurRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(360, 50),
                    topRight: Radius.elliptical(360, 50)),
              ),
            ),
          ),
          Column(children: [
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
                style: AppTextStyle.header3(color: ChaliarColors.whiteColor),
              ),
            ),
            SizedBox(
              height: 150.0,
            ),
            Text.rich(
              TextSpan(
                text: "Bienvenue sur Chaliar",
                style: AppTextStyle.header3(color: ChaliarColors.blackColor),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(color: ChaliarColors.whiteGreyColor),
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomRadioListTile(
                radioColor: ChaliarColors.primaryColors,
                width: 0.55,
                heigth: 0.13,
                raduis: 5.0,
                title: 'Je suis un particuier',
                subtile: 'je veux me faire livrer des colis personnellement',
                group: 'pro_particulier',
                value: 'particulier',
                onChange: (value) {
                  print(value);
                }),
            SizedBox(
              height: 5.0,
            ),
            CustomRadioListTile(
                radioColor: ChaliarColors.primaryColors,
                width: 0.55,
                heigth: 0.13,
                raduis: 5.0,
                title: 'Je suis un profesionnel',
                subtile: 'je veux me faire livrer des colis pour ma société',
                group: 'pro_particulier',
                value: 'professionnel',
                onChange: (value) {
                  print(value);
                }),
            SizedBox(
              height: 30.0,
            ),
            ButtonChaliar(
                onTap: () {},
                buttonText: 'Suivant',
                height: 40.0,
                mediaQueryWidth: 0.25,
                borderRaduis: 50,
                backgroundcolor: ChaliarColors.primaryColors,
                bordercolor: ChaliarColors.primaryColors,
                textStyle: AppTextStyle.button(color: ChaliarColors.whiteColor))
          ]),
        ],
      ),
    );
  }
}
