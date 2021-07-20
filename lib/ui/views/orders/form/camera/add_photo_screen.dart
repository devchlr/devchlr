import 'package:flutter_app/model_views/order/form/add_photoVM.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
import 'package:flutter_app/ui/widgets/loading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:provider/provider.dart';

class AddPhotoScreen extends StatefulWidget {
  OrderDeliveryInformation? deliveryInformation;
  OrderRecipientInformation? recipientInformation;
  OrderPackageInformation? packageInformation;
  AddPhotoScreen({this.deliveryInformation,this.recipientInformation,this.packageInformation});
  @override
  _AddPhotoScreenState createState() => _AddPhotoScreenState();
}
class _AddPhotoScreenState extends State<AddPhotoScreen> {
  AddPhotoVM addPhotoVM=AddPhotoVM();
  void initState(){
    super.initState();
    addPhotoVM.orderRecipientInformation=widget.recipientInformation;
    addPhotoVM.orderDeliveryInformation=widget.deliveryInformation;
    addPhotoVM.orderPackageInformation=widget.packageInformation;
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool dismitCircle=false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddPhotoVM>(
      create: (context) => AddPhotoVM(),
      child: Consumer<AddPhotoVM>(
          builder: (context, model, child) =>
      Stack(
        children: [
          Scaffold(
            key: _scaffoldKey,
            body:
            Stack(
              children: [
                SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        height:650,
                        decoration: BoxDecoration(
                          color: ChaliarColors.whiteColor,
                          image: DecorationImage(
                            image: AssetImage("assets/images/bgPageBohomme.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 200,
                          ),
                          Center(
                            child: Text(
                              'Vous Aurez deux fois plus de chances\nde trouver un chaliar si vous ajoutez\ndes photos de votre annonce.',
                              style: AppTextStyle.addPhotodesc(color: ChaliarColors.whiteColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Center(
                            child:GestureDetector(
                              onTap:(){
                                model.orderDeliveryInformation=widget.deliveryInformation;
                                model.orderRecipientInformation=widget.recipientInformation;
                                model.orderPackageInformation=widget.packageInformation;
                                model.getPhoto(context);
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
                                            right: 30
                                        ),
                                        child:Center(
                                            child: Text(
                                              'Prendre la photo',
                                              style: AppTextStyle.addPhotoBtn(
                                                  color: ChaliarColors.whiteColor
                                              ),),
                                        ),),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            ,
                          ),
                          SizedBox(
                            height:28,
                          ),
                          model.isLoading?LoadingForm(
                            bgColor: Colors.white,
                          ):Container(),
                          model.isLoading? SizedBox(
                            height:28,
                          ):Container(),
                          Center(
                            child: GestureDetector(
                              onTap: (){
                                model.orderDeliveryInformation=widget.deliveryInformation;
                                model.orderRecipientInformation=widget.recipientInformation;
                                model.orderPackageInformation=widget.packageInformation;
                                model.getPackageResume(context);
                              },
                              child: Text(
                                'passer cette étape',
                                style: AppTextStyle.addPhotoCaption(color: ChaliarColors.whiteColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height:40 ,),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10
                            ),
                            child: SvgPicture.asset(
                              "assets/images/bonhomme.svg",
                              height: 325,
                              width: 297,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(
                ),
                  child: CustomHearder(
                    title: 'Votre commande',
                    description: widget.recipientInformation!.arrival_address!.description??'',
                  ),
                ),
              ],
            ),
          ),
          dismitCircle==false? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    top:MediaQuery.of(context).size.height * 0.12,
                    left:MediaQuery.of(context).size.width * 0.42,
                    right:MediaQuery.of(context).size.width * 0.42,
                  ),
                  child:GestureDetector(
                    onTap:(){
                      print('circle clicked');
                      setState(() {
                        dismitCircle=true;
                      });
                    },
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: ChaliarColors.whiteColor,
                      child: Icon(Icons.close_outlined,color: ChaliarColors.primaryColors,),
                    ),
                  )
              )
            ],
          ):Container(),
         // Column(
         //    mainAxisAlignment: MainAxisAlignment.start,
         //    children: [
         //      Padding(
         //          padding: EdgeInsets.only(
         //            top:MediaQuery.of(context).size.height * 0.12,
         //            left:MediaQuery.of(context).size.width * 0.42,
         //            right:MediaQuery.of(context).size.width * 0.42,
         //          ),
         //          child:GestureDetector(
         //            onTap:(){
         //              Navigator.pushNamed(context, '/resume_order_screen');
         //            },
         //            child: CircleAvatar(
         //              radius: 25.0,
         //              backgroundColor: ChaliarColors.whiteColor,
         //              child: Icon(Icons.close_outlined,color: ChaliarColors.primaryColors,),
         //            ),
         //          )
         //      )
         //    ],
         //  ),
         Positioned(
            top: MediaQuery.of(context).size.height*0.065,
              left: MediaQuery.of(context).size.width*0.05,
              child:  GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,),
          ),),
        ],
      ),),);
  }
}

