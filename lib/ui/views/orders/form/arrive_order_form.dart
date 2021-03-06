import 'package:flutter_app/model_views/order/form/arrive_view_model.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/custom_botom_navigation_bar.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
import 'package:flutter_app/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/suggestion_input.dart';
import 'package:provider/provider.dart';


class ArriveeFormScreen extends StatefulWidget {
  OrderDeliveryInformation? deliveryInformation;
  ArriveeFormScreen({this.deliveryInformation});

  @override
  _ArriveeFormScreenState createState() => _ArriveeFormScreenState();
}

class _ArriveeFormScreenState extends State<ArriveeFormScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ArriveScreenViewModel arriveScreenViewModel=ArriveScreenViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    arriveScreenViewModel.orderDeliveryInformation=widget.deliveryInformation!;
  }
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider<ArriveScreenViewModel>(
      create: (context) => ArriveScreenViewModel(),
      child: Consumer<ArriveScreenViewModel>(
          builder: (context, model, child) =>
      Scaffold(
      key: _scaffoldKey,
        resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 120,),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0
                  ),
                  color: ChaliarColors.whiteColor,
                  child: Card(
                    elevation: 2,
                    child: ListView(
                      padding: EdgeInsets.only(
                        top: 0
                      ),
                      children: [
                        ListTile(
                          title: Text('Position d\'arriv??e du colis',
                            style: AppTextStyle.formComDesc(color: ChaliarColors.secondaryColors,),
                          ),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: CustomSugestionInput(
                            placeholder: 'Adresse de d\'arriv??e',
                            suggestionsCallback: (pattern) async {
                              return await model.getPlaceSugestion(pattern);
                            },
                            itemBuilder: (context, suggestion) {
                              return ListTile(
                                title: Text(suggestion.toString()),
                              );
                            },
                            onSuggestionSelected: (suggestion) {
                              model.arrival_address.text=suggestion.toString();
                            },
                            errorText: model.vArrivalAdress?'Erreur le champ adress est mal renseigne':null,
                            controller:model.arrival_address,
                          ),
                        ),
                        SizedBox(
                          height: 13.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Pr??nom du destinataire",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            controller: model.firt_name_recipient,
                            errorText: model.vfirstNameR?'erreur format inccorect':null,
                            onChanged: (value){
                              model.arrivaAdressV();
                              model.firstNameR();
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
                            label: "Nom du destinataire",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            controller: model.name_recipient,
                            errorText: model.vNameR?'erreur format inccorect':null,
                            onChanged: (value){
                              model.arrivaAdressV();
                              model.firstNameR();
                              model.nameR();
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
                            label: "Num??ro de d??l??phone du destinataire",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            controller: model.recipient_phone_number,
                            errorText: model.vPhoneR?'erreur format inccorect':null,
                            onChanged: (value){
                              model.arrivaAdressV();
                              model.firstNameR();
                              model.nameR();
                              model.phoneR();
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
                            label: "Email du destinataire",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            controller: model.recipient_email,
                            errorText: model.vEmailR?'erreur format inccorect':null,
                            onChanged: (value){
                              model.arrivaAdressV();
                              model.firstNameR();
                              model.nameR();
                              model.phoneR();
                              model.emailR();
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
                            label: "Soci??t?? ?? livrer",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            controller: model.recipient_group,
                            errorText: model.vGroupR?'erreur format inccorect':null,
                            onChanged: (value){
                              model.groupR();
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
                            label: "Notes personnelles",
                            isBorder: true,
                            textLabelColor: ChaliarColors.secondaryColors,
                            maxlenght: 250,
                            backgroundColor: ChaliarColors.whiteGreyColor,
                            borderColor: ChaliarColors.primaryColors,
                            controller: model.recipient_note,
                            errorText: model.vNoteR?'erreur format inccorect':null,
                            onChanged: (value){
                              model.noteR();
                            },
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
                                  model.orderDeliveryInformation=widget.deliveryInformation!;
                                  model.formEditingController(context);
                                  // Navigator.pushNamed(context, '/taille_colli');
                                },
                                buttonText: 'Valider',
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
              top:MediaQuery.of(context).size.height*0.92,
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
    ),
      ),
      );
  }
}

