import 'package:flutter/material.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';

class ChaliarMenu{

  static AppBar topBar({String imageBackground,String title,Color bgColor}) {
    return AppBar(
      automaticallyImplyLeading: false,
      backwardsCompatibility: false,
      elevation: 0.0,
      backgroundColor: ChaliarColors.whiteGreyColor,
      flexibleSpace: Image(
        image: AssetImage(imageBackground),
        fit: BoxFit.fill,
      ),
      title: Text(
        title,
        style: AppTextStyle.appBarHeader(color: bgColor),
      ),
      centerTitle: true,
    );
  }

}
