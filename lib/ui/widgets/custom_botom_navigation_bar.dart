import 'package:flutter/material.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
 CustomBottomNavigationBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xfff3f3f3),
        image: DecorationImage(
          image: AssetImage("assets/images/menuFooter.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height*0.02
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap:(){
                Navigator.pushNamed(context, '/home_profile');
              },
              child: Center(
                child: SvgPicture.asset(
                  SvgIcons.chaliar,
                  height: 30,
                  width: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/pre_commande');
              },
              child: Center(
                child: SvgPicture.asset(
                  SvgIcons.commande,
                  height: 70,
                  width: 50,
                ),
              ),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Center(
                child: SvgPicture.asset(
                  SvgIcons.scooter,
                  height: 30,
                  width: 20,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
