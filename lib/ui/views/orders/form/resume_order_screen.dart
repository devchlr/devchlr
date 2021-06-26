import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/styles/chaliar_font.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:timelines/timelines.dart';


class ResumeOrderScreen extends StatefulWidget {
  const ResumeOrderScreen({Key? key}) : super(key: key);

  @override
  _ResumeOrderScreenState createState() => _ResumeOrderScreenState();
}

class _ResumeOrderScreenState extends State<ResumeOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Color(0xff1D1E27),),
        ),
        backgroundColor: Color(0xffffffff),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xffFFFFFF),
          ),
          ListView(
            children: [
              Center(
                child: Text('Récapitulatif de votre commande',
                  style: AppTextStyle.appBarHeader(
                    size: 16.0,
                    fontFamily: AppFontFamilly.avenirHeavy,
                    color: Color(0xff344D5B),
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
              SizedBox(
                height: 13.0,
              ),
              Padding(padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*0.45,
              ),
                child:  Text('Modifier moyen de paiement ➝',
                  style: AppTextStyle.appBarHeader(
                      size: 12.0,
                      fontFamily: AppFontFamilly.avenirHeavy,
                      color: Color(0xff3885DA),
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Padding(padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0
              ),
              child: CreditCardWidget(
                cardNumber: '5344000340505324',
                expiryDate: '20/24',
                cardHolderName: 'IOSI PRATAMA',
                cvvCode: '1234',
                showBackView: false,
                obscureCardNumber: true,
                obscureCardCvv: false,
                cardBgColor: Colors.lightBlue,   //Color(0xff3885DA)
                height: 175,
                labelCardHolder: 'label Holder',
                textStyle: TextStyle(color: Color(0xffffffff)),
                width: MediaQuery.of(context).size.width,
                animationDuration: Duration(milliseconds: 1000),
              ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Padding(padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*0.6,
              ),
                child:  Text('Modifier mes informations',
                  style: AppTextStyle.appBarHeader(
                      size: 10.0,
                      fontFamily: AppFontFamilly.avenirNext,
                      color: Color(0xff777777),
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              SizedBox(
                height: 22.0,
              ),
              Center(
                child: Text('Livraison express',
                  style: AppTextStyle.appBarHeader(
                      size: 16.0,
                      fontFamily: AppFontFamilly.avenirNext,
                      color: Color(0xff344D5B),
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 22.0,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width*0.15,
              right: MediaQuery.of(context).size.width*0.15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Expanded(
            child: CustomScrollView(
            slivers: <Widget>[
            SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
          ),
          SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
          ),
          SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
          ),
          SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverPadding(padding: EdgeInsets.only(top: 60)),
        ],
      ),),
                // FixedTimeline.tileBuilder(
                //   theme: TimelineThemeData(
                //     direction: Axis.horizontal,
                //     connectorTheme: ConnectorThemeData(
                //       space: 30.0,
                //       thickness: 5.0,
                //     ),
                //   ),
                //   builder: TimelineTileBuilder.connectedFromStyle(
                //     connectionDirection: ConnectionDirection.before,
                //     connectorStyleBuilder: (context, index) {
                //       return (index == 1) ? ConnectorStyle.dashedLine : ConnectorStyle.solidLine;
                //     },
                //     indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
                //     itemExtent: 130.0,
                //     itemCount: 2,
                //   ),
                // ),
              ],
            )
          )
        ],
      ),
    );
  }
}
