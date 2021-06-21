import 'package:client_chaliar/constants/iconList.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/widgets/appBar.dart';
import 'package:client_chaliar/ui/widgets/button.dart';
import 'package:client_chaliar/ui/widgets/input_field.dart';
import 'package:client_chaliar/ui/widgets/reusableCard.dart';
import 'package:client_chaliar/ui/widgets/svg_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddPhotoScreen extends StatefulWidget {


  @override
  _AddPhotoScreenState createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: ChaliarMenu.topBar(
      //     title: 'Votre commande',
      //     description: '7 avenue de la grande Armée/75003 Paris',
      //     bgColor: ChaliarColors.primaryColors,
      //     imageBackground: 'assets/images/blueGrad.png'
      // ),
      appBar:AppBar(
        leading: Icon(Icons.arrow_back_ios),
        elevation: 0.0,
        flexibleSpace: Image(
          image: AssetImage('assets/images/bgPageBohomme.png'),
          fit: BoxFit.fill,
        ),
        title: Column(
          children: [
            Text(
              'Votre commande',
              style: AppTextStyle.appBarHeader(color: ChaliarColors.whiteColor),
            ),
            Text(
              '7 avenue de la grande Armée/75003 Paris',
              style: AppTextStyle.caption(color: ChaliarColors.whiteColor),
            ),
            Container(
              height: 5.0,
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bgPageBohomme.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: ChaliarColors.whiteColor,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height *0.15,
              ),
                Center(
                  child: Text(
                    'Vous Aurez deux fois plus de chances\nde trouver un chaliar si vous ajoutez\ndes photos de votre annonce.',
                    style: AppTextStyle.addPhotodesc(color: ChaliarColors.whiteColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height *0.03,
              ),
              Center(
                child:GestureDetector(
                  onTap:(){} ,
                  child:Container(
                    height: 60,
                    width: MediaQuery.of(context).size.height * 0.35,
                    decoration:BoxDecoration(
                      color: ChaliarColors.secondaryColors,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Icon(Icons.camera_alt,color: ChaliarColors.whiteColor,),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top:20.0
                            ),
                            child:Text('Prendre la photo',style: AppTextStyle.addPhotoBtn(color: ChaliarColors.whiteColor)
                            ),),
                        ),
                      ],
                    ),
                  ),
                )
                ,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *0.02,
              ),
              Center(
                child: Text(
                  'passer cette étape',
                  style: AppTextStyle.addPhotoCaption(color: ChaliarColors.whiteColor),
                  textAlign: TextAlign.center,
                ),
              ),
              ],
            ),
          Positioned(
            bottom: 10.0,
              right: 20.0,
              child: SvgPicture.asset(
                "assets/images/bonhomme.svg",
                height: 325,
                width: 297,
              ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    left:MediaQuery.of(context).size.width * 0.43,
                    right:MediaQuery.of(context).size.width * 0.43,
                  ),
                  child:CircleAvatar(
                    radius: 47.0,
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

