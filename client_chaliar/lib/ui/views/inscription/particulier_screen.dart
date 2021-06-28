import 'package:flutter/material.dart';
import 'package:client_chaliar/ui/widgets/svg_button.dart';
import 'package:client_chaliar/ui/widgets/input_field.dart';
import 'package:client_chaliar/constants/iconList.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/widgets/button.dart';

class InscriptionParticulierScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.1),
          child: InputField(
            fieldSize: MediaQuery.of(context).size.height * 0.03,
            label: "Prénom",
            placeholder: "Prénom",
            textFillColor: ChaliarColors.blackColor,
            isBorder: true,
            // controller: model.email,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.1),
          child: InputField(
            fieldSize: MediaQuery.of(context).size.height * 0.03,
            label: "Nom",
            placeholder: "Nom",
            textFillColor: ChaliarColors.blackColor,
            isBorder: true,
            // controller: model.email,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.1),
          child: InputField(
            fieldSize: MediaQuery.of(context).size.height * 0.03,
            label: "Email",
            placeholder: "Email",
            textFillColor: ChaliarColors.blackColor,
            isBorder: true,
            // controller: model.email,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.1),
          child: InputField(
            fieldSize: MediaQuery.of(context).size.height * 0.03,
            label: "Mot de passe",
            placeholder: "Mot de passe",
            textFillColor: Colors.grey,
            suffixIcon: SvgIconButton(
                iconAsset: SvgIcons.eye_close,
                onPressed: () {
                  Navigator.pop(context);
                }),
            isBorder: true,
            // controller: model.password,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1, right: MediaQuery.of(context).size.width * 0.1),
          child: InputField(
            fieldSize: MediaQuery.of(context).size.height * 0.03,
            label: "Confirmation de mot de passe",
            placeholder: "Confirmation de mot de passe",
            textFillColor: ChaliarColors.blackColor,
            suffixIcon: SvgIconButton(
                iconAsset: SvgIcons.eye_close,
                onPressed: () {
                  Navigator.pop(context);
                }),
            isBorder: true,
            // controller: model.password,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Center(
          child: ButtonChaliar(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/singin');
              },
              buttonText: 'Connexion',
              height: MediaQuery.of(context).size.height * 0.075,
              mediaQueryWidth: 0.4,
              borderRaduis: 6,
              backgroundcolor: ChaliarColors.primaryColors,
              bordercolor: ChaliarColors.primaryColors,
              textStyle: AppTextStyle.button(color: ChaliarColors.whiteColor)),
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            "Ou",
            textAlign: TextAlign.center,
            style: AppTextStyle.appBarHeader(color: ChaliarColors.blackColor),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
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
          height: MediaQuery.of(context).size.height * 0.07,
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
            )
          ],
        )
      ],
    );
  }
}