import 'package:client_chaliar/business_logic/view_model/auth/register_view_model.dart';
import 'package:client_chaliar/constants/iconList.dart';
import 'package:client_chaliar/services/auth_service.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/widgets/appBar.dart';
import 'package:client_chaliar/ui/widgets/button.dart';
import 'package:client_chaliar/ui/widgets/input_field.dart';
import 'package:client_chaliar/ui/widgets/svg_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl_phone_field/intl_phone_field.dart';



class UserRegisterScreen extends StatelessWidget {
  final String typeUSer;
  UserRegisterScreen({this.typeUSer='particulier'});
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of<AuthService>(context, listen: false);
    return ChangeNotifierProvider<RegisterViewModel>(
        create: (context) => RegisterViewModel(),
        child: Consumer<RegisterViewModel>(
            builder: (context, model, child) =>
      Scaffold(
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
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                        labelText: 'Téléphone',
                        labelStyle:
                        AppTextStyle.header4(color: ChaliarColors.blackColor),
                        filled: true,
                        fillColor: ChaliarColors.whiteColor,
                        hintStyle:
                        AppTextStyle.header4(color: ChaliarColors.blackColor),
                        contentPadding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 20, right: 20),

                      ),
                      initialCountryCode: 'FR',
                      onChanged: (phone) {
                        model.phone= phone.completeNumber;
                      },
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Center(
                    child: ButtonChaliar(
                        onTap: () async{
                          model.createUser(context,typeUSer);
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
                                      onPressed: ()async {
                                        showDialog(context: context,
                                            builder: (_) =>
                                            new AlertDialog(
                                              content: Text('google singIng',
                                                textAlign: TextAlign.center,
                                                style: AppTextStyle.bodyApp1(color: Colors.red),),
                                            )
                                        );
                                        var cred=await model.signInWithGoogle();
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
                        onTap: () {
                          Navigator.pushNamed(context, '/term_condition');
                        },
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
    ),),);
  }
}
