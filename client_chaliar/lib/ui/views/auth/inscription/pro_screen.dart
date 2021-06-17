import 'package:client_chaliar/business_logic/view_model/auth/professionnal_register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client_chaliar/ui/widgets/svg_button.dart';
import 'package:client_chaliar/ui/widgets/input_field.dart';
import 'package:client_chaliar/constants/iconList.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/widgets/button.dart';
import 'package:provider/provider.dart';

class InscriptionProScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfessionalRegisterViewModel>(
        create: (context) => ProfessionalRegisterViewModel(),
        child: Consumer<ProfessionalRegisterViewModel>(
            builder: (context, model, child) =>
      Card(
        elevation:0.0,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.03,
        ),
        child: ListView(
          // physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15, right: MediaQuery.of(context).size.width * 0.15),
              child: InputField(
                fieldSize: MediaQuery.of(context).size.height * 0.03,
                label: "Prénom",
                placeholder: "Prénom",
                textFillColor: ChaliarColors.blackColor,
                isBorder: true,
                controller: model.surname,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15, right: MediaQuery.of(context).size.width * 0.15),
              child: InputField(
                fieldSize: MediaQuery.of(context).size.height * 0.03,
                label: "Nom",
                placeholder: "Nom",
                textFillColor: ChaliarColors.blackColor,
                isBorder: true,
                controller: model.name,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15, right: MediaQuery.of(context).size.width * 0.15),
              child: InputField(
                fieldSize: MediaQuery.of(context).size.height * 0.03,
                label: "Email",
                typeInput: TextInputType.emailAddress,
                placeholder: "Email",
                textFillColor: ChaliarColors.blackColor,
                isBorder: true,
                controller: model.email,
                // controller: model.email,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15, right: MediaQuery.of(context).size.width * 0.15),
              child: InputField(
                fieldSize: MediaQuery.of(context).size.height * 0.03,
                label: "Mot de passe",
                placeholder: "Mot de passe",
                controller: model.password,
                obscureText: model.obscureText,
                textFillColor: Colors.grey,
                suffixIcon: SvgIconButton(
                    iconColor: model.isSamePassword() ? Colors.green : null,
                    iconAsset: model.iconAsset,
                    onPressed: () {
                      model.showPasswor(model.obscureText);
                    }),
                isBorder: true,
                // controller: model.password,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15, right: MediaQuery.of(context).size.width * 0.15),
              child: InputField(
                fieldSize: MediaQuery.of(context).size.height * 0.03,
                label: "Confirmation de mot de passe",
                placeholder: "Confirmation de mot de passe",
                textFillColor: ChaliarColors.blackColor,
                obscureText: model.obscureText,
                controller: model.passwordBis,
                suffixIcon: SvgIconButton(
                    iconColor: model.isSamePassword() ? Colors.green : null,
                    iconAsset: model.iconAsset,
                    onPressed: () {
                      model.showPasswor(model.obscureText);
                    }),
                isBorder: true,
                // controller: model.password,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15, right: MediaQuery.of(context).size.width * 0.15),
              child: InputField(
                fieldSize: MediaQuery.of(context).size.height * 0.03,
                label: "Numéro de téléphone",
                textFillColor: ChaliarColors.blackColor,
                controller: model.phoneNumber,
                isBorder: true,
                // controller: model.email,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(

              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15, right: MediaQuery.of(context).size.width * 0.15),
              child: InputField(
                controller: model.societe,
                fieldSize: MediaQuery.of(context).size.height * 0.03,
                label: "Nom société",
                textFillColor: ChaliarColors.blackColor,
                isBorder: true,
                // controller: model.email,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15, right: MediaQuery.of(context).size.width * 0.15),
              child: InputField(
                fieldSize: MediaQuery.of(context).size.height * 0.03,
                label: "Adresse de facturation",
                textFillColor: ChaliarColors.blackColor,
                controller: model.facturationAdress,
                isBorder: true,
                // controller: model.email,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15, right: MediaQuery.of(context).size.width * 0.15),
              child: InputField(
                fieldSize: MediaQuery.of(context).size.height * 0.03,
                label: "Code postal",
                textFillColor: ChaliarColors.blackColor,
                controller: model.codePostal,
                isBorder: true,
                // controller: model.email,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.15, right: MediaQuery.of(context).size.width * 0.15),
              child: InputField(
                fieldSize: MediaQuery.of(context).size.height * 0.03,
                label: "Ville",
                textFillColor: ChaliarColors.blackColor,
                controller: model.city,
                isBorder: true,
                // controller: model.email,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
              child: ButtonChaliar(
                  onTap: () async{
                    await model.singUp(context);
                    // Navigator.pushReplacementNamed(context, '/singin');
                  },
                  buttonText: 'Connexion',
                  height: MediaQuery.of(context).size.height * 0.075,
                  mediaQueryWidth: 0.343,
                  borderRaduis: 6,
                  backgroundcolor: ChaliarColors.primaryColors,
                  bordercolor: ChaliarColors.primaryColors,
                  textStyle: AppTextStyle.button(color: ChaliarColors.whiteColor)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.12, right: MediaQuery.of(context).size.width * 0.12),
                    child: Center(
                      child: Text(
                        'Vous acceptez nos conditions générales ',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.caption(color: ChaliarColors.blackColor),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
        ),
    );
  }
}