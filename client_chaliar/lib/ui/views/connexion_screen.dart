import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/chaliar_icon_size.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:client_chaliar/ui/widgets/button.dart';

class ConnexionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ChaliarColors.primaryColors,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.65,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: ChaliarColors.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.elliptical(100, 8),
                    topRight: Radius.elliptical(100, 8)),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  style: AppTextStyle.header3(color: ChaliarColors.whiteColor),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Commandez un \ntransporteur",
                textAlign: TextAlign.center,
                style: AppTextStyle.header1(color: ChaliarColors.whiteColor),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Ouvert entre 06h00 et 23h00",
                textAlign: TextAlign.center,
                style: AppTextStyle.body(color: ChaliarColors.whiteColor),
              ),
              SizedBox(
                height: 1.0,
              ),
              Center(
                child: SvgPicture.asset(
                  "assets/images/courier.svg",
                  height: 250,
                  width: 160,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: ButtonChaliar(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, '/pro_particulier');
                    },
                    buttonText: 'Inscription',
                    height: 40.0,
                    mediaQueryWidth: 0.48,
                    borderRaduis: 50,
                    backgroundcolor: ChaliarColors.primaryColors,
                    bordercolor: ChaliarColors.primaryColors,
                    textStyle:
                        AppTextStyle.button(color: ChaliarColors.whiteColor)),
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: ButtonChaliar(
                    onTap: () {},
                    buttonText: 'Connexion',
                    height: 40.0,
                    mediaQueryWidth: 0.48,
                    borderRaduis: 50,
                    backgroundcolor: ChaliarColors.whiteColor,
                    bordercolor: ChaliarColors.primaryColors,
                    textStyle: AppTextStyle.button(
                        color: ChaliarColors.primaryColors)),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Devenir Chaliar",
                textAlign: TextAlign.center,
                style: AppTextStyle.body(color: ChaliarColors.blackColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
