import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/model_views/order/form/resume_orderVM.dart';
import 'package:flutter_app/models/adress.dart';
import 'package:flutter_app/models/commande.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/chaliar_font.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/views/orders/order_scanning.dart';
import 'package:flutter_app/ui/widgets/button.dart';
import 'package:flutter_app/ui/widgets/loading.dart';
import 'package:flutter_app/ui/widgets/svg_button.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ResumeOrderScreen extends StatefulWidget {
  Order? order;
  OrderPackageInformation?packageInformation;
  OrderRecipientInformation?recipientInformation;
  OrderDeliveryInformation?deliveryInformation;
  double? order_km;
  double?order_price;
  String?imagePath;
   ResumeOrderScreen({Key? key,this.imagePath,this.order_price,this.order_km,this.deliveryInformation,this.order,this.packageInformation,this.recipientInformation}) : super(key: key);

  @override
  _ResumeOrderScreenState createState() => _ResumeOrderScreenState();
}

class _ResumeOrderScreenState extends State<ResumeOrderScreen> {
  ResumeOrderVM resumeOrderVM=ResumeOrderVM();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resumeOrderVM.orderPackageInformation=widget.packageInformation;
    resumeOrderVM.orderRecipientInformation=widget.recipientInformation;
    resumeOrderVM.orderDeliveryInformation=widget.deliveryInformation;
    resumeOrderVM.imagePath=widget.imagePath;
  }

  @override
  Widget build(BuildContext context) {
    String month=DateFormat('dd-MMMM-yyyy').format(widget.deliveryInformation!.delivery_date!);
    String hour=DateFormat('kk:mm').format(widget.deliveryInformation!.delivery_schedule!);

    return ChangeNotifierProvider<ResumeOrderVM>(
        create: (context) => ResumeOrderVM(),
        child: Consumer<ResumeOrderVM>(
            builder: (context, model, child) =>
          Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Color(0xff1D1E27),),
        ),
        backgroundColor: Color(0xffffffff),
        elevation: 0,
      ),
      body:Stack(
        children: [
          Container(
            color: Color(0xffFFFFFF),
          ),
          ListView(
            children: [
              Center(
                child: Text('R??capitulatif de votre commande',
                  style: AppTextStyle.appBarHeader(
                      size: 16.0,
                      fontFamily: AppFontFamilly.avenirHeavy,
                      color: Color(0xff344D5B),
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              SizedBox(
                height: 13.0,
              ),
              Padding(padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*0.45,
              ),
                child:  Text('Modifier moyen de paiement ???',
                  style: AppTextStyle.appBarHeader(
                      size: 12.0,
                      fontFamily: AppFontFamilly.avenirHeavy,
                      color: Color(0xff3885DA),
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Padding(padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0
              ),
                child: CreditCardWidget(
                  cardNumber: '5344000340505324',
                  expiryDate: '20/24',
                  cardHolderName: 'IOSI PRATAMA',
                  cvvCode: '1234',
                  showBackView: false,
                  obscureCardNumber: true,
                  obscureCardCvv: false,
                  cardBgColor: Colors.lightBlue,   //Color(0xff3885DA)
                  height: 175,
                  labelCardHolder: 'label Holder',
                  textStyle: TextStyle(color: Color(0xffffffff)),
                  width: MediaQuery.of(context).size.width,
                  animationDuration: Duration(milliseconds: 1000),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Padding(padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width*0.6,
              ),
                child:  Text('Modifier mes informations ',
                  style: AppTextStyle.appBarHeader(
                      size: 10.0,
                      fontFamily: AppFontFamilly.avenirNext,
                      color: Color(0xff777777),
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              SizedBox(
                height: 22.0,
              ),
              Center(
                child: Text('${widget.deliveryInformation!.delivery_type}',
                  style: AppTextStyle.appBarHeader(
                      size: 16.0,
                      fontFamily: AppFontFamilly.avenirNext,
                      color: Color(0xff344D5B),
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              SizedBox(
                height: 22.0,
              ),
              Center(
                child: Text('${widget.order_km!.toStringAsFixed(2)} KM',
                  style: AppTextStyle.appBarHeader(
                      size: 9.0,
                      fontFamily: AppFontFamilly.montserrat,
                      color: Color(0xff042C5C),
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*0.15,
                  right: MediaQuery.of(context).size.width*0.15,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/resume_bg_cicle.png'),
                          backgroundColor: Colors.transparent,
                          radius: 20,
                          child: Center(child: SvgIconButton(
                            iconSize: 10,
                            iconAsset: 'assets/icons/facture/${widget.packageInformation!.package_size!.toLowerCase()}.svg',
                            iconColor: Color(0xffffffff),
                          ),),
                        ),
                        Container(
                          width: 140.0,
                          color: Colors.blue,
                          height: 5,
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/resume_bg_cicle.png'),
                          backgroundColor: Colors.transparent,
                          radius: 20,
                          child: Center(child: Image.asset('assets/images/marker/clientMarker.png',scale: 5,),),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width:120,
                          padding: EdgeInsets.only(
                              left: 0.0,
                              right: 0.0
                          ),
                          child:RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text:
                                "\n${hour}",
                                style: AppTextStyle.appBarHeader(
                                    color: Color(0xff3885DA),
                                    size: 12,
                                    fontFamily: AppFontFamilly.avenirNext
                                ),
                                children: [
                                  TextSpan(
                                    // recognizer: TapGestureRecognizer()
                                    //   ..onTap = () {
                                    //     print('phone call');
                                    //   },
                                    text: "\n${widget.deliveryInformation!.departure_address!.description}",
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff042C5C),
                                        size: 8.0,
                                        fontFamily: AppFontFamilly.avenirNext
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Container(
                          width:120,
                          padding: EdgeInsets.only(
                              left: 0.0,
                              right: 0.0
                          ),
                          child:RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text:
                                "\n17:30",
                                style: AppTextStyle.appBarHeader(
                                    color: Color(0xff3885DA),
                                    size: 12,
                                    fontFamily: AppFontFamilly.avenirNext
                                ),
                                children: [
                                  TextSpan(
                                    // recognizer: TapGestureRecognizer()
                                    //   ..onTap = () {
                                    //     print('phone call');
                                    //   },
                                    text: "\n${widget.recipientInformation!.arrival_address!.description}",
                                    style: AppTextStyle.appBarHeader(
                                        color: Color(0xff042C5C),
                                        size: 8.0,
                                        fontFamily: AppFontFamilly.avenirNext
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ],
                    )
                  ],
                ),),
              SizedBox(
                height: 12.0,
              ),
              Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*0.1,
                    right: MediaQuery.of(context).size.width*0.1,
                  ),
                  child: Card(
                    child: ListTile(
                      leading: SvgIconButton(
                        iconSize: 50,
                        iconAsset: SvgIcons.package_box,
                      ),
                      title: Text('Colis ?? livrer: ????${widget.packageInformation!.package_nature}????',style: AppTextStyle.appBarHeader(
                          color: Color(0xff042C5C),
                          size: 12,
                          fontFamily: AppFontFamilly.avenirNext,
                          fontWeight: FontWeight.w400
                      )),
                    ),
                  )),

              SizedBox(
                height: 27.0,
              ),
              Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*0.1,
                    right: MediaQuery.of(context).size.width*0.1,
                  ),
                  child: Card(
                    child: ListTile(
                      leading: Text('Total TTC',style: AppTextStyle.appBarHeader(
                          color: Color(0xff3885DA),
                          size: 15,
                          fontFamily: AppFontFamilly.montserrat,
                          fontWeight: FontWeight.w400
                      ),),
                      trailing: Text('${widget.order_price!.toStringAsFixed(2)}???',style: AppTextStyle.appBarHeader(
                          color: Color(0xff042C5C),
                          size: 18,
                          fontFamily: AppFontFamilly.avenirNext,
                          fontWeight: FontWeight.w500
                      )),
                    ),
                  )),
              SizedBox(
                height: 50.0,
              ),
              model.isLoading?LoadingForm():Container(),
              model.isLoading?SizedBox(
                height: 20.0,
              ):Container(),
              Center(
                child: ButtonChaliar(
                    onTap: () {
                      model.orderPackageInformation=widget.packageInformation;
                      model.orderRecipientInformation=widget.recipientInformation;
                      model.orderDeliveryInformation=widget.deliveryInformation;
                      model.imagePath=widget.imagePath;
                      model.saveOrder(context);
                    },
                    buttonText: 'Valider ma commande',
                    height: MediaQuery.of(context).size.height * 0.07,
                    mediaQueryWidth: 0.35,
                    borderRaduis: 41,
                    backgroundcolor: ChaliarColors.primaryColors,
                    bordercolor: ChaliarColors.primaryColors,
                    textStyle: AppTextStyle.button(
                        color: ChaliarColors.whiteColor)),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ],
      ),
    ),
        ),);
  }
}
