import 'package:client_chaliar/business_logic/view_model/auth/singin_view_model.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/chaliar_font.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:client_chaliar/ui/widgets/button.dart';
import 'package:provider/provider.dart';

class PhoneOptMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SingInViewModel>(
      create: (context) => SingInViewModel(),
      child: Consumer<SingInViewModel>(
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
                  height: 100.0,
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
                  height: 10.0,
                ),
                Text(
                  "Entrez votre numéro de téléphone, vous allez recevoir un code par SMS pour valider votre compte",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.appBarHeader( fontWeight: FontWeight.w400,
                      color: Color(0xff1C1939),size: 15,fontFamily: AppFontFamilly.avenirNext),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Card(
                  elevation: 6,
                  child: IntlPhoneField(
                    showDropdownIcon: false,
                    dropdownDecoration: BoxDecoration(
                      border: Border(
                      ),
                      borderRadius: BorderRadius.circular(1),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Numéro de téléphone',
                      labelStyle:
                          AppTextStyle.header4(color: ChaliarColors.blackColor),
                      filled: true,
                      fillColor: ChaliarColors.whiteColor,
                      hintStyle:
                          AppTextStyle.header4(color: ChaliarColors.blackColor),
                      contentPadding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 10),
                    ),
                    initialCountryCode: 'FR',
                    onChanged: (phone) {
                      model.phone=phone.completeNumber;
                    },
                  ),
                ),
                SizedBox(
                  height: 50.0,
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
