import 'package:flutter/material.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';

class ChaliarMenu{

  static AppBar topBar({Widget leading=null,Color textColor=ChaliarColors.whiteColor , String imageBackground,String title,Color bgColor,String description=''}) {
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: false,
      backwardsCompatibility: false,
      elevation: 0.0,
      backgroundColor:bgColor,
      flexibleSpace: Image(
        image: AssetImage(imageBackground),
        fit: BoxFit.fill,
      ),
      title: Column(

        children: [
          Text(
            title,
            style: AppTextStyle.appBarHeader(color: textColor),
          ),
          Text(
            description,
            style: AppTextStyle.caption(color: textColor),
          ),
          description!=''?Container(
            height: 20.0,
          ):SizedBox(
            height: 0.0,
          )
        ],
      ),
      centerTitle: true,
    );
  }
}

