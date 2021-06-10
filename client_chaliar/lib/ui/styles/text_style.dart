import 'package:flutter/material.dart';
import 'package:client_chaliar/ui/styles/chaliar_font_size.dart';
import 'package:client_chaliar/ui/styles/chaliar_font.dart';

class AppTextStyle {
  static TextStyle header1({Color color}) {
    return TextStyle(
      color: color,
      fontSize: AppFontSize.largest,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      letterSpacing: -1.5,
    );
  }

  static TextStyle header2({Color color}) {
    return TextStyle(
      color: color,
      fontSize: AppFontSize.larger,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      letterSpacing: -1.5,
    );
  }

  static TextStyle header3({Color color}) {
    return TextStyle(
      color: color,
      fontSize: AppFontSize.large2_1,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      letterSpacing: -1.5,
    );
  }

  static TextStyle header4({Color color}) {
    return TextStyle(
      color: color,
      fontSize: AppFontSize.large2,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      letterSpacing: -1.5,
    );
  }

  static TextStyle body({Color color}) {
    return TextStyle(
      color: color,
      fontSize: AppFontSize.meduim,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle button({Color color}) {
    return TextStyle(
      color: color,
      fontSize: AppFontSize.large,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle caption({Color color}) {
    return TextStyle(
      color: color,
      fontSize: AppFontSize.smallest,
      fontFamily: AppFontFamilly.montserrat,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
    );
  }
}
