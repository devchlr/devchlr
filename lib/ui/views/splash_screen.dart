import 'package:flutter_app/model_views/splashScreenMV.dart';
import 'package:flutter_app/ui/styles/chaliar_font.dart';
import 'package:flutter_app/ui/styles/chaliar_icon_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenMV splashScreenMV=SplashScreenMV();
  void initState() {
    super.initState();
    splashScreenMV.nextScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/blueGrad.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200.0,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      "assets/images/logo.svg",
                      height: AppIconSize.large,
                      width: AppIconSize.large,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container()
                ,
              ),
              Container(
                height: 70,
                child: Center(
                    child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'POWERED\n@LIKEWEB AGENCY',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: AppFontFamilly.avenirHeavy,
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )),
              )
            ],
          )
        ],
      ),
    );
  }
}
