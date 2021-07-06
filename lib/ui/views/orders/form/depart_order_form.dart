import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_app/constants/type_livraison.dart';
import 'package:flutter_app/model_views/order/depart_view_model.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/custom_botom_navigation_bar.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
import 'package:flutter_app/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/suggestion_input.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter_typeahead/cupertino_flutter_typeahead.dart';



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

  void viewChanged(DateRangePickerViewChangedArgs args) {
    final DateTime visibleStartDate = args.visibleDateRange.startDate!;
    final DateTime visibleEndDate = args.visibleDateRange.endDate!;
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
    bool isCollapsed=false;
    final double width = MediaQuery.of(context).size.width;
    final double cellWidth = width / 9;
    DateTime h = DateTime.now();
    String formattedHour = DateFormat('kk').format(h);
    String formattedMinute = DateFormat('mm').format(h);
    String heure='';
    String minute='';
    String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
    String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');
    return ChangeNotifierProvider<DepartFormViewModel>(
        create: (context) => DepartFormViewModel(),
        child: Consumer<DepartFormViewModel>(
            builder: (context, model, child) =>
                Scaffold(
                  key: _scaffoldKey,
                  resizeToAvoidBottomInset: true,
                  backgroundColor: Colors.white,
                  body: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 130,),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                              ),
                              color: ChaliarColors.whiteColor,
                              child:
                              Card(
                                elevation: 2,
                                child: ListView(
                                  padding: EdgeInsets.only(
                                    top: 0
                                  ),
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
                                      padding: EdgeInsets.only(
                                        left: MediaQuery.of(context).size.width * 0.07,
                                        right: MediaQuery.of(context).size.width * 0.07,
                                      ),
                                      child: CustomSugestionInput(
                                        placeholder: 'Adresse de départ',
                                        suggestionsCallback: (pattern) async {
                                          return await model.getPlaceSugestion(pattern);
                                        },
                                        itemBuilder: (context, suggestion) {
                                          return ListTile(
                                            title: Text(suggestion.toString()),
                                          );
                                        },
                                        onSuggestionSelected: (suggestion) {
                                          model.departure_address.text=suggestion.toString();
                                        },
                                        controller:model.departure_address,
                                      )
                                     ,
                                    ),
                                    SizedBox(
                                      height: 13.0,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width * 0.07,
                                          right: MediaQuery.of(context).size.width * 0.07,
                                        ),
                                        child: GestureDetector(
                                          onTap: (){
                                            model.selectTypeLivraison(TypeLivraison.express);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: ChaliarColors.whiteGreyColor,
                                                borderRadius: BorderRadius.circular(6.0),
                                                // border: Border.all(color: ChaliarColors.primaryColors,width: 0.5)
                                            ),
                                            child: ListTile(
                                              trailing: Radio(
                                                value: TypeLivraison.express,
                                                groupValue: model.group,
                                                onChanged: (value){
                                                  model.selectTypeLivraison(TypeLivraison.express);
                                                },
                                              ),
                                              title: Text("Livraison express",style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors)
                                                ,),
                                            ),
                                          ),
                                        )
                                    ),
                                    SizedBox(
                                      height: 13.0,
                                    ),
                                    GestureDetector(
                                        onTap: (){
                                          model.selectTypeLivraison(TypeLivraison.programme);
                                        },child:
                                    Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width * 0.07,
                                          right: MediaQuery.of(context).size.width * 0.07,
                                        ),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: ChaliarColors.whiteGreyColor,
                                                borderRadius: BorderRadius.circular(6.0),
                                                // border: Border.all(color: ChaliarColors.primaryColors,width: 0.5)
                                            ),
                                            child: ExpansionTile(
                                              initiallyExpanded: model.group==TypeLivraison.programme?true:false,
                                              trailing: Radio(
                                                value: TypeLivraison.programme,
                                                groupValue: model.group,
                                                onChanged: (value){
                                                  model.selectTypeLivraison(TypeLivraison.programme);
                                                },
                                              ),
                                              title: Text("livraison programmée",style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors)
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
                                                              controller: model.delivery_date,
                                                              showNavigationArrow: true,
                                                              // onSelectionChanged: _onSelectionChanged,
                                                              selectionMode: DateRangePickerSelectionMode.single,
                                                            ),
                                                          ],
                                                        ))
                                                )

                                              ],
                                            ),
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
                                              // border: Border.all(color: ChaliarColors.primaryColors,width: 0.5)
                                          ),
                                          child: ExpansionTile(
                                            trailing: Text(''),
                                            title: Text("Définir l’horaire de livraison",style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors)
                                              ,),
                                            children: <Widget>[
                                                GestureDetector(
                                                  onTap: ()async{
                                                   showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay(hour:int.parse(formattedHour) , minute: int.parse(formattedMinute)),
                                                      builder: (BuildContext context, Widget? child) {
                                                        return MediaQuery(
                                                          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                                          child: child!,
                                                        );
                                                      },
                                                    ).then((value){
                                                      DateTime  newDate = new DateTime.now();
                                                      new DateTime(newDate.year, newDate.month, newDate.day, value!.hour, value.minute);
                                                      setState(() {
                                                        formattedHour = newDate.hour.toString();
                                                         formattedMinute = newDate.minute.toString();
                                                      });
                                                      print(newDate);
                                                      model.delivery_schedule.text=newDate.toString();
                                                      print(model.delivery_schedule.text);
                                                    });
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        padding:EdgeInsets.only(
                                                          top: 10,
                                                          bottom: 10,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:MainAxisAlignment.center,
                                                          children: [
                                                            Container(
                                                            height: 50,
                                                            width: 50,
                                                            padding: EdgeInsets.all(10.0),
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(0.0),
                                                                border: Border.all(color: ChaliarColors.primaryColors,width: 1)
                                                            ),
                                                            child: Center(
                                                              child: Text('${heure==''?formattedHour[0]:heure[0]}'),
                                                            ),
                                                          ),
                                                            SizedBox(width: 10.0,),
                                                            Container(
                                                              height: 50,
                                                              width: 50,
                                                              padding: EdgeInsets.all(10.0),
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                  border: Border.all(color: ChaliarColors.primaryColors,width: 1)
                                                              ),
                                                              child: Center(
                                                                child: Text('${heure==''?formattedHour[1]:heure[1]}'),
                                                              ),
                                                            ),
                                                            SizedBox(width: 10.0,),
                                                            Center(
                                                              child: Text(':',style: AppTextStyle.appBarHeader(
                                                                size: 22,
                                                                color: ChaliarColors.secondaryColors,
                                                                fontWeight: FontWeight.bold
                                                              ),),
                                                            ),
                                                            SizedBox(width: 10.0,),
                                                            Container(
                                                                height: 50,
                                                                width: 50,
                                                                padding: EdgeInsets.all(10.0),
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                    border: Border.all(color: ChaliarColors.primaryColors,width: 1)
                                                                ),
                                                                child: Center(
                                                                  child: Text('${formattedMinute[0]}'),
                                                                )
                                                            ),
                                                            SizedBox(width: 10.0,),
                                                            Container(
                                                                height: 50,
                                                                width: 50,
                                                                padding: EdgeInsets.all(10.0),
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                    border: Border.all(color: ChaliarColors.primaryColors,width: 1)
                                                                ),
                                                                child: Center(
                                                                  child: Text('${formattedMinute[1]}'),
                                                                )
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),


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
                                        controller: model.delivery_firt_name,
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
                                        controller: model.delivery_name,
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
                                        controller: model.phone_number,
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
                                        controller: model.delivery_email,
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
                                        controller: model.delivery_group,
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
                                              //model.formEditingController(context);
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
                                      height: 60.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              bottom:MediaQuery.of(context).size.height*0.06,
                            ),
                            color:Colors.transparent,
                          )
                        ],
                      ),
                      Positioned(
                        left: 10.0,
                        top: 30.0,
                        child: CircleAvatar(
                          radius: 5.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                        top:MediaQuery.of(context).size.height*0.91,
                      ),
                        child:  CustomBottomNavigationBar(
                          bgColor: Colors.transparent,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            top: 0
                        ),
                        child: CustomHearder(
                          title: "Commande",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height*0.08,
                            left: MediaQuery.of(context).size.width*0.02
                        ),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios,color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                )
        ));
  }
}


