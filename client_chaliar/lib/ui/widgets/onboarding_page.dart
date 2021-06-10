import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subTitle;
  final String buttonText;
  final List<Widget> buildPageIndicator;
  OnboardingPageWidget(
      {this.imageAsset,
      this.title,
      this.subTitle,
      this.buttonText,
      this.buildPageIndicator});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: ChaliarColors.whiteColor,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          child: SvgPicture.asset(
            imageAsset,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.6,
              left: 10.0,
              right: 10.0),
          child: Container(
            color: ChaliarColors.whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15.0),
                Center(
                    child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.header2(color: ChaliarColors.blackColor),
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
                  child: Container(
                    height: 55.0,
                    width: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                              color: ChaliarColors.primaryColors,
                              spreadRadius: 1),
                        ],
                        color: ChaliarColors.whiteColor,
                        border: Border.all(color: ChaliarColors.primaryColors)),
                    child: GestureDetector(
                      onTap: () => print('Get started'),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 0.0),
                          child: Text(
                            buttonText,
                            style: AppTextStyle.header3(
                                color: ChaliarColors.primaryColors),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
