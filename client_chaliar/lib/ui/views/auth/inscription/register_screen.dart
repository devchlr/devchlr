import 'package:client_chaliar/constants/iconList.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/widgets/appBar.dart';
import 'package:client_chaliar/ui/widgets/button.dart';
import 'package:client_chaliar/ui/widgets/input_field.dart';
import 'package:client_chaliar/ui/widgets/svg_button.dart';
import 'package:flutter/material.dart';



class UserRegisterScreen extends StatelessWidget {
  final String typeUSer;
  UserRegisterScreen({this.typeUSer='particulier'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChaliarMenu.topBar(imageBackground:'assets/images/blueGrad.png',title: 'DÉMARRER',bgColor:ChaliarColors.whiteColor),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/blueGrad.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(
            top: 0.0,
            bottom: MediaQuery.of(context).size.height * 0.01,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05
          ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 0,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                    child: InputField(
                      fieldSize: MediaQuery.of(context).size.height * 0.02,
                      label: "Prénom",
                      placeholder: "Prénom",
                      textFillColor: ChaliarColors.blackColor,

                      // controller: model.surname,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                    child: InputField(
                      fieldSize: MediaQuery.of(context).size.height * 0.02,
                      label: "Nom",
                      placeholder: "Nom",
                      textFillColor: ChaliarColors.blackColor,
                      // controller: model.name,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                    child: InputField(
                      fieldSize: MediaQuery.of(context).size.height * 0.02,
                      label: "Email",
                      typeInput: TextInputType.emailAddress,
                      placeholder: "Email",
                      textFillColor: ChaliarColors.blackColor,
                      // controller: model.email,
                      // controller: model.email,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                    child: InputField(
                      fieldSize: MediaQuery.of(context).size.height * 0.02,
                      label: "Numéro de téléphone",
                      typeInput: TextInputType.emailAddress,
                      placeholder: "Email",
                      textFillColor: ChaliarColors.blackColor,
                      // controller: model.email,
                      // controller: model.email,
                    ),
                  ),
                  typeUSer == 'particulier'?SizedBox(
                    height: 0,
                  )
                      :SizedBox(
                    height: 8,
                  ),
                  typeUSer == 'particulier'?SizedBox(
                    height: 0,
                  )
                  :Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                    child: InputField(
                      fieldSize: MediaQuery.of(context).size.height * 0.02,
                      label: "Nom société",
                      typeInput: TextInputType.emailAddress,
                      textFillColor: ChaliarColors.blackColor,
                      // controller: model.email,
                      // controller: model.email,
                    ),
                  ),
                  typeUSer == 'particulier'?SizedBox(
                    height: 0,
                  )
                      :SizedBox(
                    height: 8,
                  ),
                  typeUSer == 'particulier'?SizedBox(
                    height: 0,
                  )
                      :Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                    child: InputField(
                      fieldSize: MediaQuery.of(context).size.height * 0.02,
                      label: "Adresse de facturation",
                      typeInput: TextInputType.emailAddress,
                      textFillColor: ChaliarColors.blackColor,
                      // controller: model.email,
                      // controller: model.email,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                    child: InputField(
                      fieldSize: MediaQuery.of(context).size.height * 0.02,
                      label: "Code Postal",
                      typeInput: TextInputType.emailAddress,
                      textFillColor: ChaliarColors.blackColor,
                      // controller: model.email,
                      // controller: model.email,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                    child: InputField(
                      fieldSize: MediaQuery.of(context).size.height * 0.02,
                      label: "Ville",
                      typeInput: TextInputType.emailAddress,
                      textFillColor: ChaliarColors.blackColor,
                      // controller: model.email,
                      // controller: model.email,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Center(
                    child: ButtonChaliar(
                        onTap: () async{
                          // await model.singUp(context);
                          // Navigator.pushReplacementNamed(context, '/singin');
                        },
                        buttonText: 'Connexion',
                        height: MediaQuery.of(context).size.height * 0.08,
                        mediaQueryWidth: 0.35,
                        borderRaduis: 70,
                        backgroundcolor: ChaliarColors.primaryColors,
                        bordercolor: ChaliarColors.primaryColors,
                        textStyle: AppTextStyle.button(
                            color: ChaliarColors.whiteColor)),
                  ),
                  typeUSer != 'particulier'?SizedBox(
                    height: 0,
                  )
                      :SizedBox(
                    height: 15,
                  ),
                  typeUSer != 'particulier'?SizedBox(
                    height: 0,
                  )
                      :Center(
                    child: Text(
                      "Ou",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.appBarHeader(color: ChaliarColors.blackColor),
                    ),
                  ),
                  typeUSer != 'particulier'?SizedBox(
                    height: 0,
                  )
                      :SizedBox(
                    height: 15,
                  ),
                  typeUSer != 'particulier'?SizedBox(
                    height: 0,
                  )
                      :Container(
                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.1),
                      child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ContainerButton(
                                  height: 60,
                                  width: 80,
                                  iconSvg: SvgIconButton(
                                      iconAsset: SvgIcons.facebook_blue,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      })),
                              ContainerButton(
                                  height: 60,
                                  width: 80,
                                  iconSvg: SvgIconButton(
                                      iconAsset: SvgIcons.google_account,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      })),
                              ContainerButton(
                                  height: 60,
                                  width: 80,
                                  iconSvg: SvgIconButton(
                                      iconAsset: SvgIcons.apple,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      })),
                            ]),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Center(
                            child: Text(
                              'Vous acceptez nos conditions générales d’utilisations',
                              textAlign: TextAlign.center,
                              style: AppTextStyle.caption(color: ChaliarColors.blackColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
