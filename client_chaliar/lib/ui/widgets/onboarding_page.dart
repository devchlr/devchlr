import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/widgets/button.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subTitle;
  final String buttonText;
  final List<Widget> buildPageIndicator;
  final VoidCallback onTap;
  OnboardingPageWidget(
      {this.imageAsset,
      this.title,
      this.subTitle,
      this.buttonText,
      this.buildPageIndicator,
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: ChaliarColors.whiteGreyColor,
        ),
        Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 40.0),
              child: Center(
                child: Image.asset(imageAsset),
              ),
            )),
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.57,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: ChaliarColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.09,
                  right: MediaQuery.of(context).size.height * 0.14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 5.0),
                  Center(
                      child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyle.header2(color: ChaliarColors.blackColor),
                  )),
                  SizedBox(height: 5.0),
                  Center(
                    child: Text(subTitle,
                        textAlign: TextAlign.center,
                        style:
                            AppTextStyle.body(color: ChaliarColors.blackColor)),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildPageIndicator,
                  ),
                  SizedBox(height: 15.0),
                  Center(
                    child: ButtonChaliar(
                        onTap: onTap,
                        buttonText: buttonText,
                        height: 60.0,
                        mediaQueryWidth: 0.48,
                        borderRaduis: 50,
                        backgroundcolor: ChaliarColors.whiteColor,
                        bordercolor: ChaliarColors.primaryColors,
                        textStyle: AppTextStyle.button(
                            color: ChaliarColors.primaryColors)),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
