import 'package:flutter/material.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';

class ChaliarMenu{

  static AppBar topBar({String imageBackground,String title,Color bgColor,String description=''}) {
    return AppBar(
      automaticallyImplyLeading: false,
      backwardsCompatibility: false,
      elevation: 0.0,
      backgroundColor: ChaliarColors.whiteGreyColor,
      flexibleSpace: Image(
        image: AssetImage(imageBackground),
        fit: BoxFit.fill,
      ),
      title: Column(

        children: [
          Text(
            title,
            style: AppTextStyle.appBarHeader(color: bgColor),
          ),
          Text(
            description,
            style: AppTextStyle.caption(color: bgColor),
          ),
        ],
      ),
      centerTitle: true,
    );
  }

}
