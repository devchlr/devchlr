import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:client_chaliar/ui/widgets/button.dart';
import 'package:client_chaliar/ui/widgets/pinbox.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:flutter/gestures.dart';

class PhoneOptValidateScreen extends StatelessWidget {
  List<TextEditingController> controllers = <TextEditingController>[
    new TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      text: "Vérification du compte",
                      style:
                          AppTextStyle.header1(color: ChaliarColors.blackColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          "Entrez les 4 chiffres du code que vous avez reçu par SMS au ",
                      style: AppTextStyle.header3_light(
                          color: ChaliarColors.blackColor),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('phone call');
                            },
                          text: " +336 03 02 36 99",
                          style: AppTextStyle.header3_light(
                              color: ChaliarColors.primaryColors,
                              isUnderlined: true),
                        )
                      ],
                    )),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: PinInputTextField(
                    pinLength: 4,
                    decoration: UnderlineDecoration(
                      colorBuilder: PinListenColorBuilder(
                          ChaliarColors.primaryColors,
                          ChaliarColors.secondaryColors),
                      // bgColorBuilder: true ? _solidColor : null,
                      obscureStyle: ObscureStyle(
                        isTextObscure: false,
                        obscureText: '😂',
                      ),
                    ),
                    // controller: _pinEditingController,
                    textInputAction: TextInputAction.go,
                    // enabled: _enable,
                    keyboardType: TextInputType.number,
                    textCapitalization: TextCapitalization.characters,
                    onSubmit: (pin) {
                      debugPrint('submit pin:$pin');
                    },
                    onChanged: (pin) {
                      debugPrint('onChanged execute. pin:$pin');
                    },
                    enableInteractiveSelection: false,
                    cursor: Cursor(
                      width: 2,
                      color: Colors.lightBlue,
                      radius: Radius.circular(2),
                      // enabled: _cursorEnable,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Je n’ai pas reçu de code?",
                      style: AppTextStyle.header3_light(
                          color: ChaliarColors.blackColor),
                    )),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    print('Resend OPT Code');
                  },
                  child: Text(
                    'Me renvoyer un code',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.header3_light(
                      color: ChaliarColors.primaryColors,
                      isUnderlined: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Center(
                  child: ButtonChaliar(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, '/pro_particulier');
                      },
                      buttonText: 'Envoyer le code',
                      height: 60.0,
                      mediaQueryWidth: 0.5,
                      borderRaduis: 50,
                      backgroundcolor: ChaliarColors.primaryColors,
                      bordercolor: ChaliarColors.primaryColors,
                      textStyle:
                          AppTextStyle.button(color: ChaliarColors.whiteColor)),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          "En cliquannt ici vous acceptez notre Politique de confidentialité et nos  ",
                      style: AppTextStyle.header3_light(
                          color: ChaliarColors.blackColor),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('show condition term screen');
                            },
                          text: " Conditions générales d’utilisatios",
                          style: AppTextStyle.header3_light(
                              color: ChaliarColors.primaryColors,
                              isUnderlined: true),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
