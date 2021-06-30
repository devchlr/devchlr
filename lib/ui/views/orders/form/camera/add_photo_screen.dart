import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
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
    return
      Stack(
        children: [
          Scaffold(
            key: _scaffoldKey,
            appBar:AppBar(
              // leading:,
              elevation: 0.0,
              flexibleSpace: Image(
                image: AssetImage('assets/images/bgPageBohomme.png'),
                fit: BoxFit.fill,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text(
                    'Votre commande',
                    style: AppTextStyle.appBarHeader(color: ChaliarColors.whiteColor),
                  ),),
                  Center(child: Text(
                    '7 avenue de la grande Armée/75003 Paris',
                    style: AppTextStyle.caption(color: ChaliarColors.whiteColor),
                  ),),
                  Container(
                    height: 5.0,
                  )
                ],
              ),
              backgroundColor: ChaliarColors.primaryColors,
            ),
            body:
            Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ChaliarColors.whiteColor,
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
                ListView(
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
                      height: 57,
                    ),
                    Center(
                      child:GestureDetector(
                        onTap:(){
                          Navigator.pushNamed(context, '/take_picture');
                        } ,
                        child:Container(
                          height: 60,
                          width: MediaQuery.of(context).size.height * 0.3,
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
                      height:30,
                    ),
                    Center(
                      child: Text(
                        'passer cette étape',
                        style: AppTextStyle.addPhotoCaption(color: ChaliarColors.whiteColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height:50 ,),
                    SvgPicture.asset(
                      "assets/images/bonhomme.svg",
                      height: 325,
                      width: 297,
                    )
                  ],
                ),
                // Positioned(
                //   bottom: 10.0,
                //   right: 20.0,
                //   child: SvgPicture.asset(
                //     "assets/images/bonhomme.svg",
                //     height: 325,
                //     width: 297,
                //   ),
                // ),

              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    top:MediaQuery.of(context).size.height * 0.11,
                    left:MediaQuery.of(context).size.width * 0.43,
                    right:MediaQuery.of(context).size.width * 0.43,
                  ),
                  child:CircleAvatar(
                    radius: 25.0,
                    backgroundColor: ChaliarColors.whiteColor,
                    child: Icon(Icons.close_outlined,color: ChaliarColors.primaryColors,),
                  )
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.065,
              left: MediaQuery.of(context).size.width*0.05,
              child:  GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,),
          ))
        ],
      );
  }
}

