import 'package:flutter_app/model_views/authentification/home_screenVM.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/chaliar_icon_size.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:provider/provider.dart';

class ConnexionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthentificationHomeScreenMV>(
      create: (context) => AuthentificationHomeScreenMV(),
      child: Consumer<AuthentificationHomeScreenMV>(
        builder: (context, model, child) =>
            Scaffold(
              resizeToAvoidBottomInset: true,
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
                        height: MediaQuery.of(context).size.height * 0.26,
                        decoration: BoxDecoration(
                          color: ChaliarColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  ListView(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [

                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.08,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    "assets/images/logo.svg",
                                    height: AppIconSize.medium,
                                    width: AppIconSize.medium,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text(
                                "Commandez un \ntransporteur",
                                textAlign: TextAlign.center,
                                style:
                                AppTextStyle.headerApp1(color: ChaliarColors.whiteColor),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.015,
                              ),
                              Text(
                                "Ouvert entre 06h00 et 23h00",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.bodyApp1(color: ChaliarColors.whiteColor),
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 2,
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/images/courier.svg",
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.height * 0.4,
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(
                                top:15,
                                left: MediaQuery.of(context).size.height * 0.05,
                                right: MediaQuery.of(context).size.height * 0.05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Center(
                                  child: ButtonChaliar(
                                      onTap: () {
                                        model.pushPage(
                                            context, 'pro_particulier');
                                      },
                                      buttonText: 'Inscription',
                                      height: 59,
                                      mediaQueryWidth: 0.48,
                                      borderRaduis: 100,
                                      backgroundcolor: ChaliarColors.primaryColors,
                                      bordercolor: ChaliarColors.primaryColors,
                                      textStyle: AppTextStyle.button(
                                          color: ChaliarColors.whiteColor)),
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                Center(
                                  child: ButtonChaliar(
                                      onTap: () {
                                        model.pushPage(context, 'singin');
                                      },
                                      buttonText: 'Connexion',
                                      height: 59,
                                      mediaQueryWidth: 0.48,
                                      borderRaduis: 100,
                                      backgroundcolor: ChaliarColors.whiteColor,
                                      bordercolor: ChaliarColors.primaryColors,
                                      textStyle: AppTextStyle.button(
                                          color: Color(0xff34B3E8),size: 11)),
                                ),
                                SizedBox(
                                  height: 19,
                                ),
                                Text(
                                  "Devenir Chaliar",
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.bodyfooter(color: Color(0xffBBD3EB)),
                                ),
                                SizedBox(
                                  height:27,
                                ),
                              ],
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),),);
  }
}
