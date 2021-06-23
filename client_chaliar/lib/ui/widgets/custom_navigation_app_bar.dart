import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/chaliar_font.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/views/commande/formulaire/take_picture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBarWithPopButtonAndSubTile extends SliverPersistentHeaderDelegate {
  final double height;
  String title;
  String subTitle;

  CustomAppBarWithPopButtonAndSubTile({this.height=100,this.title,this.subTitle});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
        color: Colors.transparent,
        child: Stack(fit: StackFit.loose, children: <Widget>[
          Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: height,
              child: CustomPaint(
                painter: CustomToolbarShape(),
              )),
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width*0.04,
              top: MediaQuery.of(context).size.width*0.03,
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: ChaliarColors.whiteColor,),
            ),),
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*0.2,
                right: MediaQuery.of(context).size.width*0.2
            ),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyle.appBarHeader(color: ChaliarColors.whiteColor),
                ),SizedBox(
                  height: 12.0,
                ),
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style:AppTextStyle.headerCaption(color: ChaliarColors.whiteColor,size: 12,assetFont: AppFontFamilly.montserrat),
                ),
              ],
            ),
          ),
        ]));
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class CustomAppBarWithPopButton extends SliverPersistentHeaderDelegate {
  final double height;
  final String title;
  const CustomAppBarWithPopButton({this.height=70,this.title});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
        color: Colors.transparent,
        child: Stack(fit: StackFit.loose, children: <Widget>[
          Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: CustomPaint(
                painter: CustomToolbarShape(),
              )),
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width*0.04,
              top: MediaQuery.of(context).size.width*0.03,
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: ChaliarColors.whiteColor,),
            ),),
          Positioned(
            top:MediaQuery.of(context).size.height*0.035,
            left:MediaQuery.of(context).size.width*0.35,
            child:  Center(
              child: Text(
                title,
                style: AppTextStyle.appBarHeader(color: ChaliarColors.whiteColor),
              ),
            ),)
        ]));
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}






//painter class
class CustomToolbarShape extends CustomPainter {
  final Color lineColor;

  const CustomToolbarShape({this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

//First oval
    Path path = Path();
    Rect pathGradientRect = new Rect.fromCircle(
      center: new Offset(size.width / 4, 0),
      radius: size.width/1.4,
    );

    Gradient gradient = new LinearGradient(
      colors: <Color>[
        Color.fromRGBO(89, 139, 225, 1.0).withOpacity(1),
        Color.fromRGBO(16, 159, 255, 1.0).withOpacity(1),
      ],
      stops: [
        0.3,
        1.0,
      ],
    );

    path.lineTo(-size.width / 1.4, 0);
    path.quadraticBezierTo(
        size.width / 2, size.height * 2, size.width + size.width / 1.4, 0);

    paint.color = ChaliarColors.primaryColors;
    paint.shader = gradient.createShader(pathGradientRect);
    paint.strokeWidth = 40;
    path.close();

    canvas.drawPath(path, paint);

//Second oval
    Rect secondOvalRect = new Rect.fromPoints(
      Offset(-size.width / 2.5, -size.height),
      Offset(size.width * 1.4, size.height / 1.5),
    );

    gradient = new LinearGradient(
      colors: <Color>[
        Color.fromRGBO(16, 159, 255, 1.0).withOpacity(1),
        Color.fromRGBO(16, 159, 255, 1.0).withOpacity(1),
      ],
      stops: [
        0.0,
        1.0,
      ],
    );
    Paint secondOvalPaint = Paint()
      ..color = ChaliarColors.primaryColors
      ..shader = gradient.createShader(secondOvalRect);

    canvas.drawOval(secondOvalRect, secondOvalPaint);

//Third oval
    Rect thirdOvalRect = new Rect.fromPoints(
      Offset(-size.width / 2.5, -size.height),
      Offset(size.width * 1.4, size.height / 2.7),
    );

    gradient = new LinearGradient(
      colors: <Color>[
        Color.fromRGBO(16, 159, 255, 1.0).withOpacity(1),
        Color.fromRGBO(21, 146, 255, 1.0).withOpacity(0.2),
      ],
      stops: [
        0.0,
        1.0,
      ],
    );
    Paint thirdOvalPaint = Paint()
      ..color = ChaliarColors.primaryColors
      ..shader = gradient.createShader(thirdOvalRect);

    canvas.drawOval(thirdOvalRect, thirdOvalPaint);

//Fourth oval
    Rect fourthOvalRect = new Rect.fromPoints(
      Offset(-size.width / 2.4, -size.width/1.875),
      Offset(size.width / 1.34, size.height / 1.14),
    );

    gradient = new LinearGradient(
      colors: <Color>[
        Color.fromRGBO(16, 159, 255, 1.0).withOpacity(1),
        Color.fromRGBO(16, 143, 255, 1.0).withOpacity(0.3),
      ],
      stops: [
        0.3,
        1.0,
      ],
    );
    Paint fourthOvalPaint = Paint()
      ..color = ChaliarColors.primaryColors
      ..shader = gradient.createShader(fourthOvalRect);

    canvas.drawOval(fourthOvalRect, fourthOvalPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

