import 'package:flutter/material.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  CustomAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: Image(
        image: AssetImage('assets/images/header.png'),
        fit: BoxFit.fill,
      ),
      title: Text(
        'Inscription',
        style: AppTextStyle.header2(color: ChaliarColors.whiteColor),
      ),
      centerTitle: true,
    );
  }
}
