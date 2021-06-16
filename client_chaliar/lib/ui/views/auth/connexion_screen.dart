import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/chaliar_icon_size.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:client_chaliar/ui/widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:client_chaliar/business_logic/view_model/auth/connexion_view_model.dart';

class ConnexionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ConnexionViewModel>(
      create: (context) => ConnexionViewModel(),
      child: Consumer<ConnexionViewModel>(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.06,
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
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    "Commandez un \ntransporteur",
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyle.headerApp1(color: ChaliarColors.whiteColor),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
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
                  width: MediaQuery.of(context).size.height * 0.38,
                ),
              )),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(
                  top:MediaQuery.of(context).size.height * 0.02,
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
                          height: MediaQuery.of(context).size.height * 0.07,
                          mediaQueryWidth: 0.48,
                          borderRaduis: 70,
                          backgroundcolor: ChaliarColors.primaryColors,
                          bordercolor: ChaliarColors.primaryColors,
                          textStyle: AppTextStyle.button(
                              color: ChaliarColors.whiteColor)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.006,
                    ),
                    Center(
                      child: ButtonChaliar(
                          onTap: () {
                            model.pushPage(context, 'singin');
                          },
                          buttonText: 'Connexion',
                          height: MediaQuery.of(context).size.height * 0.07,
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
                      style: AppTextStyle.bodyfooter(color: ChaliarColors.blackColor),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.004,
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
