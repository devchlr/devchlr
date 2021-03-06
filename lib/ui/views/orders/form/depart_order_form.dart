import 'package:flutter_app/constants/type_livraison.dart';
import 'package:flutter_app/model_views/order/form/depart_view_model.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/custom_botom_navigation_bar.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
import 'package:flutter_app/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/suggestion_input.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
  }
  @override
  Widget build(BuildContext context) {
    bool isCollapsed=false;
    final double width = MediaQuery.of(context).size.width;
    final double cellWidth = width / 9;
    DateTime h = DateTime.now();
    String formattedHour = DateFormat('kk').format(h);
    String formattedMinute = DateFormat('mm').format(h);
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
                                      title: Text('Position de d??part du colis',
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
                                        placeholder: 'Adresse de d??part',
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
                                        errorText: model.adressValid?'Champ Adresse de depart incorrect':null,
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
                                    model.isDateValid?Center(
                                      child: Text('Erreur la date de livraison est depasse\n veuillez renseiner une date valide',
                                      style: AppTextStyle.appBarHeader(
                                        color: Colors.red,
                                        size: 12,
                                        fontWeight: FontWeight.bold
                                      ),),
                                    ):Container(),
                                    model.isDateValid?SizedBox(
                                      height: 13.0,
                                    ):Container(),
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
                                                border: model.isDateValid?Border.all(color: Colors.red,width: 1):null,
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
                                              title: Text("livraison programm??e",style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors)
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
                                                              onSelectionChanged: (DateRangePickerSelectionChangedArgs args){
                                                                model.isDateValid;
                                                              },
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
                                            title: Text("D??finir l???horaire de livraison",style:AppTextStyle.bodyfooterField(color: ChaliarColors.secondaryColors)
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
                                                      model.myDate=value;
                                                      var t=value;
                                                     if(t!=null){
                                                       final now = new DateTime.now();
                                                       model.delivery_schedule.selectedDate=new DateTime(now.year, now.month, now.day, t.hour, t.minute);
                                                       model.changeTime();
                                                       model.pickTime();
                                                     }
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
                                                              child: Text('${model.lsHour.length>1?model.lsHour[0]:'0'}'),
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
                                                                child: Text('${model.lsHour.length>1?model.lsHour[1]:model.lsHour[0]}'),
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
                                                                  child: Text('${model.lsMinute.length>1?model.lsMinute[0]:'0'}'),
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
                                                                  child: Text('${model.lsMinute.length>1?model.lsMinute[1]:model.lsMinute[0]}'),
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
                                        label: "Pr??nom ",
                                        isBorder: true,
                                        textLabelColor: ChaliarColors.secondaryColors,
                                        maxlenght: 250,
                                        backgroundColor: ChaliarColors.whiteGreyColor,
                                        borderColor: ChaliarColors.primaryColors,
                                        controller: model.delivery_firt_name,
                                        errorText: model.surnameIsValid?"Le champs Pr??nom est incorrect":null,
                                        onChanged: (value){
                                          // model.isAdressValid();
                                          // model.isSurnameValid();
                                          model.dateValide();
                                        },
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
                                        errorText: model.nameIsValid?"Le champs Nom est incorrect":null,
                                        onChanged: (value){
                                          model.isNameValid();
                                          model.isSurnameValid();
                                          model.isAdressValid();
                                        },

                                      ),
                                    ),
                                    SizedBox(
                                      height: 13.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                                      child: InputField(
                                        fieldSize: MediaQuery.of(context).size.height * 0.025,
                                        label: "Num??ro de t??l??phone ",
                                        isBorder: true,
                                        textLabelColor: ChaliarColors.secondaryColors,
                                        maxlenght: 250,
                                        backgroundColor: ChaliarColors.whiteGreyColor,
                                        borderColor: ChaliarColors.primaryColors,
                                        controller: model.phone_number,
                                        errorText: model.phoneIsValid?"Le champs Num??ro de t??l??phone est incorrect":null,
                                        onChanged: (value){
                                          model.isPhoneValid();
                                          model.isNameValid();
                                          model.isSurnameValid();
                                          model.isAdressValid();
                                        },

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
                                        errorText: model.emailIsValid?"Le champs Email est incorrect":null,
                                        onChanged: (value){
                                          model.isEmailValid();
                                          model.isPhoneValid();
                                          model.isNameValid();
                                          model.isSurnameValid();
                                          model.isAdressValid();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 13.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                                      child: InputField(
                                        fieldSize: MediaQuery.of(context).size.height * 0.025,
                                        label: "Soci??t?? (facultatif)",
                                        isBorder: true,
                                        textLabelColor: ChaliarColors.secondaryColors,
                                        maxlenght: 250,
                                        backgroundColor: ChaliarColors.whiteGreyColor,
                                        borderColor: ChaliarColors.primaryColors,
                                        controller: model.delivery_group,
                                        // onChanged: (value){
                                        //   model.getLocalisation(model.departure_address.text);
                                        // },
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
                                              model.formEditingController(context);
                                              //   Navigator.pushNamed(context, '/commande_arrivee_form');
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


