import 'package:client_chaliar/ui/styles/chaliar_font.dart';
import 'package:flutter/material.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';

class ChaliarMenu{

  static AppBar topBar({double size=18.0,String fontFamily=AppFontFamilly.montserrat,Widget leading=null,Color textColor=ChaliarColors.whiteColor , String imageBackground,String title,Color bgColor,String description=''}) {
    return AppBar(
      shadowColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      leading: leading,
      automaticallyImplyLeading: false,
      backwardsCompatibility: false,
      elevation: 0.0,
      backgroundColor:Colors.transparent,
      flexibleSpace: Image(
        image: AssetImage(imageBackground),
        filterQuality: FilterQuality.high,
        fit: BoxFit.fitWidth,
      ),
      title: Column(
        children: [
          Text(
            title,
            style: AppTextStyle.appBarHeader(size: size, color: textColor,fontFamily: fontFamily),
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

