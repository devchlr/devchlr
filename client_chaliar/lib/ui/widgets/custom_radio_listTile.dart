import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:flutter/material.dart';

class CustomRadioListTile extends StatelessWidget {
  final Color radioColor;
  final double width;
  final double heigth;
  final double raduis;
  final String title;
  final String subtile;
  final String value;
  final String group;
  final VoidCallback onClick;
  // Declare this variable
  int selectedRadio;
  final Function(String) onChange;
  CustomRadioListTile(
      {this.radioColor,
      this.width,
      this.heigth,
      this.raduis,
      this.title,
      this.subtile,
      this.group,
      this.value,
      this.onChange,
        this.onClick
      });
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ChaliarColors.secondaryColors,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(raduis),
      ),
      elevation: 2,
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          padding: EdgeInsets.only(
          top:1.0,
            bottom: 10.0
          ),
          // width: MediaQuery.of(context).size.width * width,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
              border: Border.all(
                  color: group == value
                      ? ChaliarColors.secondaryColors
                      : ChaliarColors.whiteGreyColor)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(
                  title,
                  style: AppTextStyle.header4(color: ChaliarColors.blackColor),
                ),
                subtitle: Text(
                  subtile,
                  style: AppTextStyle.caption(color: ChaliarColors.blackColor),
                ),
                trailing: new Radio(
                  value: value,
                  groupValue: group,
                  activeColor: ChaliarColors.secondaryColors,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
