import 'package:flutter/material.dart';
import 'package:client_chaliar/ui/widgets/svg_button.dart';
import 'package:client_chaliar/ui/widgets/input_field.dart';
import 'package:client_chaliar/constants/iconList.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/widgets/button.dart';

class InscriptionProScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: InputField(
            label: "Prénom",
            placeholder: "Prénom",
            textFillColor: ChaliarColors.blackColor,
            // controller: model.email,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: InputField(
            label: "Nom",
            placeholder: "Nom",
            textFillColor: ChaliarColors.blackColor,
            // controller: model.email,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: InputField(
            label: "Email",
            placeholder: "Email",
            textFillColor: ChaliarColors.blackColor,
            // controller: model.email,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: InputField(
            label: "Mot de passe",
            placeholder: "Mot de passe",
            textFillColor: ChaliarColors.blackColor,
            suffixIcon: SvgIconButton(
                iconAsset: SvgIcons.eye_close,
                onPressed: () {
                  Navigator.pop(context);
                }),
            // controller: model.password,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: InputField(
            label: "Confirmation de mot de passe",
            placeholder: "Confirmation de mot de passe",
            textFillColor: ChaliarColors.blackColor,
            suffixIcon: SvgIconButton(
                iconAsset: SvgIcons.eye_close,
                onPressed: () {
                  Navigator.pop(context);
                }),
            // controller: model.password,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Center(
          child: ButtonChaliar(
              onTap: () {},
              buttonText: 'Suivant',
              height: 50.0,
              mediaQueryWidth: 0.51,
              borderRaduis: 50,
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
            style: AppTextStyle.body(color: ChaliarColors.blackColor),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            margin: EdgeInsets.only(left: 20, right: 20),
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
    );
  }
}
