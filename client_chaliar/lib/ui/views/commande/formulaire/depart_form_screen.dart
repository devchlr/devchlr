import 'package:client_chaliar/constants/iconList.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/widgets/appBar.dart';
import 'package:client_chaliar/ui/widgets/button.dart';
import 'package:client_chaliar/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timelines/timelines.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;


class DepartFormScreen extends StatefulWidget {


  @override
  _DepartFormScreenState createState() => _DepartFormScreenState();
}

class _DepartFormScreenState extends State<DepartFormScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime _currentDate = DateTime(2019, 2, 3);
  DateTime _currentDate2 = DateTime(2019, 2, 3);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
  DateTime _targetDateTime = DateTime(2019, 2, 3);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: ChaliarMenu.topBar(
          leading: Icon(Icons.arrow_back_ios),
          title: 'Commande',
          bgColor: ChaliarColors.whiteColor,
          imageBackground: 'assets/images/header.png'
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.transparent,
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
                  _scaffoldKey.currentState.openDrawer();
                },
                child: Center(
                  child: SvgPicture.asset(
                    SvgIcons.chaliar,
                    height: 30,
                    width: 20,
                    color: ChaliarColors.whiteGreyColor,
                  ),
                ),
              ),
              GestureDetector(
                child: Center(
                  child: SvgPicture.asset(
                    SvgIcons.commande,
                    height: 70,
                    width: 50,
                  ),
                ),
              ),
              GestureDetector(
                child: Center(
                  child: SvgPicture.asset(
                    SvgIcons.scooter,
                    height: 30,
                    width: 20,
                    color: ChaliarColors.whiteGreyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0
                  ),
                  color: ChaliarColors.whiteColor,
                  child: Card(
                    elevation: 0.5,
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text('Position de départ du colis',
                          style: AppTextStyle.formComDesc(color: ChaliarColors.secondaryColors,)
                            ,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Adresse de départ",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            // controller: model.surname,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Prénom",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            // controller: model.surname,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 10.0,right: 10.0
                          ),
                          child: ExpansionTile(
                            trailing: Radio(
                              value: '1',
                              groupValue: '1',
                              onChanged: (value){},
                            ),
                            title: Text("\t\t\t Expansion Title",style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors)
                              ,),
                            children: <Widget>[

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Nom",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            // controller: model.surname,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Numéro de déléphone",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            // controller: model.surname,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Email",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            // controller: model.surname,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Email",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            // controller: model.surname,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Email",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            // controller: model.surname,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Email",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            // controller: model.surname,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Societé (facultatif)",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            maxlenght: 250,
                            // controller: model.surname,
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.65,
            ),
            child: Center(
              child: ButtonChaliar(
                  onTap: () {
                  },
                  buttonText: 'Commander',
                  height: MediaQuery.of(context).size.height * 0.07,
                  mediaQueryWidth: 0.30,
                  borderRaduis: 50,
                  backgroundcolor: ChaliarColors.primaryColors,
                  bordercolor: ChaliarColors.primaryColors,
                  textStyle: AppTextStyle.button(
                      color: ChaliarColors.whiteColor)),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildTitle() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        children: <Widget>[
          Text("MODUL 1"),
          Spacer(),
          Text("Mehr"),
        ],
      ),
      Text("Kursubersicht"),
      Row(
        children: <Widget>[
          Text("6 Aufgaben"),
          Spacer(),
          FlatButton.icon(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {},
            icon: Icon(Icons.play_arrow),
            label: Text("Fortsetzen",style: AppTextStyle.caption(color: Colors.grey),),
          ),
        ],
      ),
    ],
  );
}