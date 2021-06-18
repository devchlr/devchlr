import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:client_chaliar/ui/widgets/appBar.dart';

class InscriptionHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backwardsCompatibility: false,
          elevation: 0.0,
          backgroundColor: ChaliarColors.whiteColor,
          flexibleSpace: Image(
            image: AssetImage('assets/images/header.png'),
            fit: BoxFit.fill,
          ),
          title: Text(
            'Inscription',
            style: AppTextStyle.appBarHeader(color: ChaliarColors.whiteColor),
          ),
          centerTitle: true,
        ),
      body: SingleChildScrollView(
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                // color: colorPrimary,
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: const Radius.circular(18.0),
                ),
              ),
              child: DefaultTabController(
                length: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 1),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TabBar(
                          // isScrollable: false,
                      // indicator: CircleTabIndicator(color: ChaliarColors.primaryColors, radius: 3),
                      indicatorSize: TabBarIndicatorSize.label,
                          labelStyle: AppTextStyle.tabHeader(
                              color: ChaliarColors.whiteGreyColor),

                          tabs: [
                            Container(
                              child: Text(
                                'Particulier',
                                textAlign: TextAlign.left,
                                style: AppTextStyle.tabHeader(
                                    color: ChaliarColors.whiteGreyColor),
                              ),
                            ),
                            Container(
                              child: Text(
                                'Professionnel',
                                textAlign: TextAlign.right,
                                style: AppTextStyle.tabHeader(
                                    color: ChaliarColors.primaryColors),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          flex: 2,
                          child: TabBarView(
                            children: <Widget>[

                            ],
                          ),
                        )
                      ]),
                ),
              ));
        }),
      ),
    );
  }
}


class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
    ..color = color
    ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final p1 = Offset(50, 50);
    final p2 = Offset(250, 150);
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
  }
}