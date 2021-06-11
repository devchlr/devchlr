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
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/blueGradCourbe.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: ChaliarColors.whiteColor,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.00,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/images/logo.svg",
                        height: AppIconSize.large,
                        width: AppIconSize.large,
                      ),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: "CHALIAR",
                      style:
                          AppTextStyle.header3(color: ChaliarColors.whiteColor),
                    ),
                  ),
                  Text(
                    "Commandez un \ntransporteur",
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyle.header1(color: ChaliarColors.whiteColor),
                  ),
                  Text(
                    "Ouvert entre 06h00 et 23h00",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.body(color: ChaliarColors.whiteColor),
                  ),
                ],
              )),
              Expanded(
                  child: Center(
                child: SvgPicture.asset(
                  "assets/images/courier.svg",
                  height: 280,
                  width: 180,
                ),
              )),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.05,
                    right: MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  children: [
                    Center(
                      child: ButtonChaliar(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, '/pro_particulier');
                          },
                          buttonText: 'Inscription',
                          height: 60.0,
                          mediaQueryWidth: 0.48,
                          borderRaduis: 50,
                          backgroundcolor: ChaliarColors.primaryColors,
                          bordercolor: ChaliarColors.primaryColors,
                          textStyle: AppTextStyle.button(
                              color: ChaliarColors.whiteColor)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Center(
                      child: ButtonChaliar(
                          onTap: () {},
                          buttonText: 'Connexion',
                          height: 60.0,
                          mediaQueryWidth: 0.48,
                          borderRaduis: 50,
                          backgroundcolor: ChaliarColors.whiteColor,
                          bordercolor: ChaliarColors.primaryColors,
                          textStyle: AppTextStyle.button(
                              color: ChaliarColors.primaryColors)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.009,
                    ),
                    Text(
                      "Devenir Chaliar",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.body(color: ChaliarColors.blackColor),
                    ),
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
