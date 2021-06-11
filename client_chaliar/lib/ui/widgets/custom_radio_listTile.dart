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
      this.onChange});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * width,
      height: MediaQuery.of(context).size.height * heigth,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(raduis),
        ),
        elevation: 6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // RadioListTile<String>(
            //   // ListTileControlAffinity.trailing will place the radio at the trailing
            //   controlAffinity: ListTileControlAffinity.trailing,
            //   activeColor: radioColor,
            //   toggleable: true,
            //   title: Text(
            //     title,
            //     style: AppTextStyle.header4(color: ChaliarColors.blackColor),
            //   ),
            //   subtitle: Text(
            //     subtile,
            //     style: AppTextStyle.caption(color: ChaliarColors.blackColor),
            //   ),
            //   value: value,
            //   groupValue: group,
            //   onChanged: onChange,
            // ),
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
                onChanged: onChange,
                activeColor: ChaliarColors.primaryColors,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
