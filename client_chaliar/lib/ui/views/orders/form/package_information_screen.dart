import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/appBar.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/input_field.dart';
import 'package:flutter_app/ui/widgets/reusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TailleColisScreen extends StatefulWidget {


  @override
  _TailleColisScreenState createState() => _TailleColisScreenState();
}

class _TailleColisScreenState extends State<TailleColisScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: ChaliarMenu.topBar(
          title: 'Votre commande',
          description: '7 avenue de la grande Armée/75003 Paris',
          bgColor: ChaliarColors.whiteColor,
          imageBackground: 'assets/images/header.png'
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  top: 20.0,
                    left: 20.0,right: 20.0
                ),
                decoration: BoxDecoration(
                  color: ChaliarColors.whiteColor,
                ),
                child:  Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.07, right: MediaQuery.of(context).size.width * 0.07),
                      child: InputField(
                        borderColor: Colors.black,
                        isBorder: true,
                        fieldSize: MediaQuery.of(context).size.height * 0.02,
                        label: "Nom",
                        placeholder: "Nom",
                        textFillColor: ChaliarColors.blackColor,
                        maxlenght: 250,
                        // controller: model.name,
                      ),
                    ),
                ),
              // Text(
              //   'Nom de l\'objet à transporter',
              //   style: AppTextStyle.tailleCaption(color: ChaliarColors.blackColor),
              // )
              Expanded(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.only(
                        left: 30.0,right: 30.0,bottom: 10.0,top: 10.0
                    ),
                    color: ChaliarColors.whiteColor,
                    child:ListView(
                        children:[
                          Expanded(
                              flex:1,
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ReusableCard(
                                    title: 'Taille S',
                                    price: '39',
                                    description: 'Tiens dans une boite à chaussure (téléphone, clé, …)',
                                    colour: ChaliarColors.primaryColors,
                                    bgColour: ChaliarColors.whiteColor,
                                    inconAsset:SvgIcons.bike,onPress: (){
                                  },
                                  ),
                                  ReusableCard(
                                    title: 'Taille M',
                                    price: '69',
                                    description: 'Tiens dans une valise cabine(ordinateur, platine …)',
                                    colour: ChaliarColors.whiteGreyColor,
                                    bgColour: ChaliarColors.primaryColors,
                                    inconAsset:SvgIcons.scooter,
                                    assetColour: ChaliarColors.whiteColor,
                                    onPress: (){},
                                  ),
                                ],
                              )
                          ),
                          Expanded(
                              flex:1,
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ReusableCard(
                                    title: 'Taille L',
                                    price: '89',
                                    description: 'Tiens dans le coffre d’une voiture(tv, valise …)',
                                    colour: ChaliarColors.primaryColors,
                                    bgColour: ChaliarColors.whiteColor,
                                    inconAsset:SvgIcons.mini_cooper,
                                    onPress: (){},
                                  ),

                                  ReusableCard(
                                    title: 'Taille XL',
                                    price: '129',
                                    description: 'Nécessite un petit utilitaire(canapé, armoire…)',
                                    colour: ChaliarColors.primaryColors,
                                    bgColour: ChaliarColors.whiteColor,
                                    inconAsset:SvgIcons.truck,
                                    onPress: (){},
                                  )
                                ],
                              )
                          )
                        ]
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: 10.0
                ),
                child:Center(
                  child: ButtonChaliar(
                      onTap: () {
                        Navigator.pushNamed(context, '/add_photo');
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
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    top:MediaQuery.of(context).size.height * 0,
                    left:MediaQuery.of(context).size.width * 0.4,
                    right:MediaQuery.of(context).size.width * 0.4,
                  ),
                  child:CircleAvatar(
                    radius: 27.0,
                    backgroundColor: ChaliarColors.whiteColor,
                    child: Icon(Icons.close_outlined,color: ChaliarColors.primaryColors,),
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}

