import 'package:client_chaliar/constants/iconList.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.title,@required this.price,@required this.description, @required this.colour,@required this.inconAsset, this.onPress,@required this.bgColour});

  final Color colour;
  final Color bgColour;
  final String inconAsset;
  final String title;
  final String description;
  final String price;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 170.0,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(title,style: AppTextStyle.appBarHeader(color:colour),),
            SizedBox(
              height: 5,
            ),
            Text('$price\$',style: AppTextStyle.cardbodyApp1(color:colour),),
            SizedBox(
              height: 10,
            ),
            Center(
              child: SvgPicture.asset(
                SvgIcons.scooter,
                height: 80,
                width: 50,
                color: colour,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: AppTextStyle.caption(color: colour),
              ),
            )
          ],
        ),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: bgColour,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: ChaliarColors.primaryColors,width: 2.0)
        ),
      ),
    );
  }
}