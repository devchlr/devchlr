import 'package:flutter_app/constants/type_user.dart';
import 'package:flutter_app/model_views/authentification/home_screenVM.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/chaliar_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/ui/styles/chaliar_icon_size.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/custom_radio_listTile.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:provider/provider.dart';

class ProParticulierScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthentificationHomeScreenMV>(
      create: (context) => AuthentificationHomeScreenMV(),
      child: Consumer<AuthentificationHomeScreenMV>(
        builder: (context, model, child) =>
            Scaffold(
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
                              child: ListView(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.03,
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:CrossAxisAlignment.center,
                                        children:[
                                          Text.rich(
                                            TextSpan(
                                              text: "Bienvenue sur Chaliar",
                                              style: AppTextStyle.headerApp1(
                                                  color: Color(0xff2F3547),fontFamilly: AppFontFamilly.avenirHeavy,fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.02,
                                          ),
                                          Container(
                                            height: 3,
                                            width: 57.68,
                                            decoration:
                                            BoxDecoration(color: ChaliarColors.whiteGreyColor),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.02,
                                          ),
                                          CustomRadioListTile(
                                            radioColor: ChaliarColors.secondaryColors,
                                            onClick: (){
                                              model.setRadioGroup(TypeUser.particulier);
                                            },
                                            width: 0.55,
                                            heigth: 0.19,
                                            raduis: 5.0,
                                            title: 'Je suis un particuier',
                                            subtile:
                                            'je veux me faire livrer des colis personnellement',
                                            group: model.group,
                                            value: TypeUser.particulier,
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.01,
                                          ),
                                          CustomRadioListTile(
                                            onClick: (){
                                              model.setRadioGroup(TypeUser.professionnel);
                                            },
                                            radioColor: ChaliarColors.secondaryColors,
                                            width: 0.55,
                                            heigth: 0.19,
                                            raduis: 5.0,
                                            title: 'Je suis un profesionnel',
                                            subtile:
                                            'je veux me faire livrer des colis pour ma société',
                                            group: model.group,
                                            value: TypeUser.professionnel,
                                          ),
                                          SizedBox(
                                            height:35,
                                          ),
                                          ButtonChaliar(
                                              onTap: (){
                                                model.pushUserRegisterPagePreference(context);
                                              },
                                              buttonText: 'Suivant',
                                              height: 48,
                                              mediaQueryWidth: 0.25,
                                              borderRaduis: 100,
                                              backgroundcolor: ChaliarColors.primaryColors,
                                              bordercolor: ChaliarColors.primaryColors,
                                              textStyle: AppTextStyle.button(
                                                  color: ChaliarColors.whiteColor)),
                                          SizedBox(
                                            height:55,
                                          ),
                                        ]
                                    ),
                                  )
                                ],
                              ))
                        ]),
                  )
                ],
              ),
            ),),);
  }
}
