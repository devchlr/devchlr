import 'package:flutter/material.dart';

import 'package:client_chaliar/constants/iconList.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/widgets/svg_button.dart';

class ButtonChaliar extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final double height;
  final double mediaQueryWidth;
  final double borderRaduis;
  final Color backgroundcolor;
  final Color bordercolor;
  final TextStyle textStyle;

  ButtonChaliar(
      {this.onTap,
      this.buttonText,
      this.height,
      this.mediaQueryWidth,
      this.borderRaduis,
      this.backgroundcolor,
      this.bordercolor,
      this.textStyle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: MediaQuery.of(context).size.height * mediaQueryWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRaduis),
            color: backgroundcolor,
            border: Border.all(color: bordercolor)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 0.0),
            child: Text(
              buttonText,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerButton extends StatelessWidget {
  final double height;
  final double width;
  final SvgIconButton iconSvg;
  ContainerButton({this.height, this.width, this.iconSvg});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0),
          color: ChaliarColors.whiteColor,
          border: Border.all(color: ChaliarColors.whiteGreyColor)),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 0.0),
          child: iconSvg,
        ),
      ),
    );
  }
}
