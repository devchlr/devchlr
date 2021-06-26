import 'package:flutter_app/model_views/authentification/connexionVM.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/chaliar_font.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:provider/provider.dart';

class PhoneOptMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthentificationConnexionVM>(
      create: (context) => AuthentificationConnexionVM(),
      child: Consumer<AuthentificationConnexionVM>(
        builder: (context, model, child) =>
            Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Container(
                    color: ChaliarColors.whiteGreyColor,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.height * 0.035,
                      left: MediaQuery.of(context).size.height * 0.035,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 150.0,
                        ),
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: "Numéro de téléphone",
                              style:
                              AppTextStyle.appBarHeader(fontWeight: FontWeight.w400,size: 27,color: Color(0xff1C1939),fontFamily: AppFontFamilly.avenirNext,),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 26.0,
                        ),
                        Text(
                          "Entrez votre numéro de téléphone, vous allez recevoir un code par SMS pour valider votre compte",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.appBarHeader( fontWeight: FontWeight.w400,
                              color: Color(0xff1C1939),size: 15,fontFamily: AppFontFamilly.avenirNext),
                        ),
                        SizedBox(
                          height: 48.0,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          elevation: 2,
                          child:Container(
                            margin: EdgeInsets.only(
                              top: 01,
                              bottom: 01,
                              left: 20,
                              right: 20
                            ),
                            child:
                            Row(
                              children: [
                                Expanded(child: IntlPhoneField(
                                  showDropdownIcon: true,
                                  decoration: InputDecoration(
                                    border:OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Numéro de téléphone',
                                    labelStyle:
                                    AppTextStyle.header4(color: ChaliarColors.blackColor),
                                    filled: true,
                                    fillColor: ChaliarColors.whiteColor,
                                    hintStyle:
                                    AppTextStyle.header4(color: Color(0xff1C1939)),
                                  ),
                                  initialCountryCode: 'FR',
                                  onChanged: (phone) {
                                    model.phone=phone.completeNumber;
                                  },
                                ),)
                              ],
                            )
                          ),
                        ),
                        SizedBox(
                          height: 106.0,
                        ),
                        Center(
                          child: ButtonChaliar(
                              onTap: () async{
                                model.context=context;
                                await model.verifyUserAccount();
                              },
                              buttonText: 'Valider le code',
                              height: 60.0,
                              mediaQueryWidth: 0.5,
                              borderRaduis: 30,
                              backgroundcolor: ChaliarColors.primaryColors,
                              bordercolor: ChaliarColors.primaryColors,
                              textStyle:
                              AppTextStyle.button(color: ChaliarColors.whiteColor)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),),);
  }
}
