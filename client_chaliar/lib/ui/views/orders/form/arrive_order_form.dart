import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/appBar.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timelines/timelines.dart';
class ArriveeFormScreen extends StatefulWidget {
  @override
  _ArriveeFormScreenState createState() => _ArriveeFormScreenState();
}

class _ArriveeFormScreenState extends State<ArriveeFormScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
                  _scaffoldKey.currentState?.openDrawer();
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
                          title: Text('Position d\'arrivée du colis',
                            style: AppTextStyle.formComDesc(color: ChaliarColors.secondaryColors,),
                          ),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                          child: InputField(
                            fieldSize: MediaQuery.of(context).size.height * 0.025,
                            label: "Adresse de d\'arrivée",
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
                            label: "Prénom du destinataire",
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
                            label: "Nom du destinataire",
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
                            label: "Numéro de déléphone du destinataire",
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
                            label: "Email du destinataire",
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
                            label: "Société à livrer",
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
                            label: "Notes personnelles",
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
                                  Navigator.pushNamed(context, '/taille_colli');
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
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

