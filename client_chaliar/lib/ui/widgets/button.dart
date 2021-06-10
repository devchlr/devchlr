import 'package:flutter/material.dart';

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
