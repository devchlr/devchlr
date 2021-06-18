import 'package:client_chaliar/business_logic/models/model_user.dart';
import 'package:client_chaliar/business_logic/view_model/auth/opt_view_model.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/views/auth/condition_generale_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:client_chaliar/ui/widgets/button.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:flutter/gestures.dart';
import 'dart:async';
import 'package:provider/provider.dart';

class PhoneOptValidateScreen extends StatefulWidget {
  String phone;
  User user;
  PhoneOptValidateScreen({this.phone});
  @override
  _PhoneOptValidateScreenState createState() => _PhoneOptValidateScreenState();
}

  class _PhoneOptValidateScreenState extends State<PhoneOptValidateScreen>{
  OPTValidationViewModel _validator=OPTValidationViewModel();
  void initState(){
    super.initState();
    getUser();
  }
  void getUser()async{
    await FirebaseAuth.instance.signOut();
      sendSmsOpt();
      getUserData();
  }
  void getUserData()async{
    await _validator.getUserData(widget.phone);
  }
  void sendSmsOpt()async{
    await _validator.sendSmsOpt(widget.phone);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OPTValidationViewModel>(
      create: (context) => OPTValidationViewModel(),
      child: Consumer<OPTValidationViewModel>(
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
                          "Entrez les 6 chiffres du code que vous avez reçu par SMS au ",
                      style: AppTextStyle.header3_light(
                          color: ChaliarColors.blackColor),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('phone call');
                            },
                          text: "${widget.phone}",
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
                    pinLength: 6,
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
                      model.pin=pin;
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
                    model.sendSmsOpt(widget.phone);
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
                        model.context=context;
                        model.confirmOPT();
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
                              Navigator.pushNamed(context, '/term_condition');
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
    )
          ),);
  }
}
