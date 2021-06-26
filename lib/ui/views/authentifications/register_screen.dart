import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/chaliar_font.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/input_field.dart';
import 'package:flutter_app/ui/widgets/svg_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model_views/authentification/register_screenVM.dart';
import 'package:provider/provider.dart';

class UserRegisterScreen extends StatelessWidget {
  final String typeUSer;
  UserRegisterScreen({this.typeUSer='particulier'});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterScreenVM>(
      create: (context) => RegisterScreenVM(),
      child: Consumer<RegisterScreenVM>(
        builder: (context, model, child) =>
            Scaffold(
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
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height*0.07,
                        left: MediaQuery.of(context).size.width * 0.36,
                        right: MediaQuery.of(context).size.width * 0.36
                    ),
                    child: Text(
                      'Inscription',
                      textAlign: TextAlign.center,
                      style: AppTextStyle.appBarHeader(size: 19.8,color: ChaliarColors.whiteColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height*0.1,
                        bottom: MediaQuery.of(context).size.height * 0.01,
                        left: MediaQuery.of(context).size.width * 0.08,
                        right: MediaQuery.of(context).size.width * 0.08
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.08),
                      ),
                      elevation: 2,
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                            child: InputField(
                              // fieldSize: MediaQuery.of(context).size.height * 0.02,
                              controller: model.surname,
                              label: "Prénom",
                              placeholder: "Prénom",
                              textFillColor: ChaliarColors.blackColor,
                              maxlenght: 250,

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
                              controller: model.name,
                              placeholder: "Nom",
                              textFillColor: ChaliarColors.blackColor,
                              maxlenght: 250,
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
                              controller: model.email,
                              typeInput: TextInputType.emailAddress,
                              placeholder: "Email",
                              textFillColor: ChaliarColors.blackColor,
                              maxlenght: 300,
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
                              controller: model.phoneNumber,
                              textFillColor: ChaliarColors.blackColor,
                              maxlenght: 300,
                              // controller: model.email,
                              // controller: model.email,
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          //   child: IntlPhoneField(
                          //     decoration: InputDecoration(
                          //       labelText: 'Téléphone',
                          //       labelStyle:
                          //       AppTextStyle.header4(color: ChaliarColors.blackColor),
                          //       filled: true,
                          //       fillColor: ChaliarColors.whiteColor,
                          //       hintStyle:
                          //       AppTextStyle.header4(color: ChaliarColors.blackColor),
                          //       contentPadding: EdgeInsets.only(
                          //           top: 10, bottom: 10, left: 20, right: 20),
                          //
                          //     ),
                          //     initialCountryCode: 'FR',
                          //     onChanged: (phone) {
                          //       model.phone= phone.completeNumber;
                          //     },
                          //   ),
                          // ),
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
                                maxlenght: 250,
                                textFillColor: ChaliarColors.blackColor,
                                controller: model.societe
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
                                label: "Siret (facultatif)",
                                maxlenght: 250,
                                textFillColor: ChaliarColors.blackColor,
                                controller: model.siret
                            ),
                          ),
                          typeUSer == 'particulier'?SizedBox(
                            height: 0,
                          )
                              :SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                            child: InputField(
                                fieldSize: MediaQuery.of(context).size.height * 0.02,
                                label: "Adresse de facturation",
                                maxlenght: 250,
                                textFillColor: ChaliarColors.blackColor,
                                controller: model.facturationAdress
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
                                maxlenght: 20,
                                textFillColor: ChaliarColors.blackColor,
                                controller: model.codePostal
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
                                maxlenght: 250,
                                textFillColor: ChaliarColors.blackColor,
                                controller: model.city
                            ),
                          ),
                          SizedBox(
                            height: 61,
                          ),
                          Center(
                            child: ButtonChaliar(
                                onTap: () async{
                                  model.createUser(context,typeUSer);
                                },
                                buttonText: 'Connexion',
                                height: 54,
                                mediaQueryWidth: 0.35,
                                borderRaduis: 27,
                                backgroundcolor: ChaliarColors.primaryColors,
                                bordercolor: ChaliarColors.primaryColors,
                                textStyle: AppTextStyle.button(
                                    color: ChaliarColors.whiteColor)),
                          ),
                          typeUSer != 'particulier'?SizedBox(
                            height: 0,
                          )
                              :SizedBox(
                            height: 19,
                          ),
                          typeUSer != 'particulier'?SizedBox(
                            height: 0,
                          )
                              :Center(
                            child: Text(
                              "Ou",
                              textAlign: TextAlign.center,
                              style: AppTextStyle.appBarHeader(size:14.4,fontFamily:AppFontFamilly.avenirNext,color: Color(0xff838391)),
                            ),
                          ),
                          typeUSer != 'particulier'?SizedBox(
                            height: 0,
                          )
                              :SizedBox(
                            height: 16,
                          ),
                          typeUSer != 'particulier'?SizedBox(
                            height: 0,
                          )
                              :Container(
                              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05, right: MediaQuery.of(context).size.width * 0.05),
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
                                              onPressed: ()async {
                                                showDialog(context: context,
                                                    builder: (_) =>
                                                    new AlertDialog(
                                                      content: Text('google singIng',
                                                        textAlign: TextAlign.center,
                                                        style: AppTextStyle.bodyApp1(color: Colors.red),),
                                                    )
                                                );

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
                              height: 41.0
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/term_condition');
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 20, right: 20),
                                  child: Center(
                                    child: Text(
                                      'Vous acceptez nos conditions générales d’utilisations',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.appBarHeader(size:7.2,color: Color(0xff838391)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: 10.0
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),),);
  }
}
