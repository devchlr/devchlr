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
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class DepartFormScreen extends StatefulWidget {


  @override
  _DepartFormScreenState createState() => _DepartFormScreenState();
}

class _DepartFormScreenState extends State<DepartFormScreen> {

//date picker
  final DateRangePickerController _controller = DateRangePickerController();
  String headerString = '';



//end date picker


  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime _currentDate = DateTime(2019, 2, 3);
  DateTime _currentDate2 = DateTime(2019, 2, 3);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
  DateTime _targetDateTime = DateTime(2019, 2, 3);
  // void viewChanged(DateRangePickerViewChangedArgs args) {
  //   final DateTime visibleStartDate = args.visibleDateRange.startDate!;
  //   final DateTime visibleEndDate = args.visibleDateRange. endDate!;
  //   final int totalVisibleDays = (visibleStartDate.difference(visibleEndDate).inDays);
  //   final DateTime midDate =
  //   visibleStartDate.add(Duration(days: totalVisibleDays ~/ 2));
  //   headerString = DateFormat('MMMM yyyy').format(midDate).toString();
  //   SchedulerBinding.instance!.addPostFrameCallback((duration) {
  //     setState(() {});
  //   });
  // }
  void viewChanged(DateRangePickerViewChangedArgs args) {
    final DateTime visibleStartDate = args.visibleDateRange.startDate;
    final DateTime visibleEndDate = args.visibleDateRange.endDate;
    final int totalVisibleDays =
    (visibleStartDate.difference(visibleEndDate).inDays);
    final DateTime midDate =
    visibleStartDate.add(Duration(days: totalVisibleDays ~/ 2));
    headerString = DateFormat('MMMM yyyy').format(midDate).toString();
    // SchedulerBinding.instance.addPostFrameCallback((duration) {
    //   setState(() {});
    // });
  }

  @override

  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double cellWidth = width / 9;
    DateTime h = DateTime.now();
    String formattedHour = DateFormat('kk').format(h);
    String formattedMinute = DateFormat('mm').format(h);
    return Scaffold(
      key: _scaffoldKey,
      appBar: ChaliarMenu.topBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
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
                  child:
                  Card(
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
                          height: 13.0,
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
                          height: 13.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.07,
                            right: MediaQuery.of(context).size.width * 0.07,
                            ),
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
                          height: 13.0,
                        ),
                       Padding(
                         padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.07,
                            right: MediaQuery.of(context).size.width * 0.07,
                            ),
                         child: Container(
                          decoration: BoxDecoration(
          color: ChaliarColors.whiteGreyColor,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(color: ChaliarColors.primaryColors,width: 0.5)
        ),
                          child: ListTile(
                            trailing: Radio(
                              value: '1',
                              groupValue: '2',
                              onChanged: (value){},
                            ),
                            title: Text("Livraison express",style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors)
                              ,),
                          ),
                        )
                       ),
                        SizedBox(
                          height: 13.0,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ChaliarColors.whiteGreyColor,
                                  borderRadius: BorderRadius.circular(6.0),
                                  border: Border.all(color: ChaliarColors.primaryColors,width: 0.5)
                              ),
                              child: ExpansionTile(
                                trailing: Radio(
                                  value: '1',
                                  groupValue: '1',
                                  onChanged: (value){},
                                ),
                                title: Text("Livraison programmé",style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors)
                                  ,),
                                children: <Widget>[
                                  Container(
                                      margin:EdgeInsets.only(
                                          left: 20.0,right: 20.0
                                      ),
                                      child:Positioned(
                                          left: 0,
                                          top: 80,
                                          right: 0,
                                          bottom: 0,
                                          child:  Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              SfDateRangePicker(
                                                showNavigationArrow: true,
                                                // onSelectionChanged: _onSelectionChanged,
                                                selectionMode: DateRangePickerSelectionMode.single,
                                              ),
                                            ],
                                          ))
                                  )

                                ],
                              ),
                            )
                        ),
                        SizedBox(
                          height: 13.0,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.07,
                              right: MediaQuery.of(context).size.width * 0.07,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ChaliarColors.whiteGreyColor,
                                  borderRadius: BorderRadius.circular(6.0),
                                  border: Border.all(color: ChaliarColors.primaryColors,width: 0.5)
                              ),
                              child: ExpansionTile(
                                trailing: Text(''),
                                title: Text("Définir l’horaire de livraison",style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors)
                                  ,),
                                children: <Widget>[
                                  Container(
                                      margin:EdgeInsets.only(
                                          left: 20.0,right: 20.0,bottom: 10.0
                                      ),
                                      child:
                                      GestureDetector(
                                        onTap: (){},
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 80,
                                              width: 80,
                                              padding: EdgeInsets.all(10.0),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(0.0),
                                                  border: Border.all(color: ChaliarColors.primaryColors,width: 0.5)
                                              ),
                                              child: Center(
                                                child: Text('$formattedHour'),
                                              ),
                                            ),
                                            SizedBox(width: 10.0,),
                                            Container(
                                                height: 80,
                                                width: 80,
                                                padding: EdgeInsets.all(10.0),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(0.0),
                                                    border: Border.all(color: ChaliarColors.primaryColors,width: 0.5)
                                                ),
                                                child: Center(
                                                  child: Text('$formattedMinute'),
                                                )
                                            )
                                          ],
                                        ),
                                      ),
                                      // FlatButton(
                                      //     onPressed: () {
                                      //       showTimePicker(
                                      //           context: context,
                                      //           initialTime: TimeOfDay.now(),
                                      //           builder: (context, _) {
                                      //             return MediaQuery(
                                      //                 data: MediaQuery.of(context).copyWith(
                                      //                   // Using 24-Hour format
                                      //                     alwaysUse24HourFormat: true),
                                      //                 // If you want 12-Hour format, just change alwaysUse24HourFormat to false or remove all the builder argument
                                      //                 child: _);
                                      //           });
                                      //     },
                                      //     child: Text(
                                      //       'show date time picker (Chinese)',
                                      //       style: TextStyle(color: Colors.blue),
                                      //     )),
                                  )

                                ],
                              ),
                            )
                        ),
                        SizedBox(
                          height: 13.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Prénom ",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            // controller: model.surname,
                          ),
                        ),
                        SizedBox(
                          height: 13.0,
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
                          height: 13.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Numéro de téléphone ",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            // controller: model.surname,
                          ),
                        ),
                        SizedBox(
                          height: 13.0,
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
                          height: 13.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Société (facultatif)",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            // controller: model.surname,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
            padding: EdgeInsets.only(
            ),
            child: Center(
              child: ButtonChaliar(
                  onTap: () {
                    Navigator.pushNamed(context, '/commande_arrivee_form');
                  },
                  buttonText: 'Suivant',
                  height: MediaQuery.of(context).size.height * 0.07,
                  mediaQueryWidth: 0.30,
                  borderRaduis: 50,
                  backgroundcolor: ChaliarColors.primaryColors,
                  bordercolor: ChaliarColors.primaryColors,
                  textStyle: AppTextStyle.button(
                      color: ChaliarColors.whiteColor)),
            ),
          ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 10.0,
              top: 30.0,
              child: CircleAvatar(
            radius: 5.0,
          ),
          ),
        ],
      ),
    );
  }
}


