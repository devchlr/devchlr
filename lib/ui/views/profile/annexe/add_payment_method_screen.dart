import 'package:flutter/material.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/ui/views/profile/annexe/payment_form/visa_form.dart';
import 'package:flutter_app/ui/widgets/appBar.dart';
import 'package:flutter_app/ui/widgets/svg_button.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  _AddPaymentMethodScreenState createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChaliarMenu.topBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Color(0xffF3F3F3),),
          ),
          description: '',
          title: 'Méthode de paiement',
          bgColor: Color(0xffd8d8d8),
          imageBackground: 'assets/images/header.png'
      ),
      backgroundColor: Color(0xffF3F3F3),
      body: Stack(
        children: [
          Container(
            color: Color(0xffF3F3F3),
          ),
          Padding(padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width*0.05,
            right: MediaQuery.of(context).size.width*0.05,
          ),
            child: Column(
              children: [
                SizedBox(height: 61,),
               Expanded(child:  DefaultTabController(
                 length: 4,
                 child: Column(
                   children: [
                     TabBar(
                         indicatorWeight: 1,
                         indicatorColor: Colors.transparent,
                         tabs: [
                           SvgIconButton(
                             iconAsset: SvgIcons.white_visa,
                             iconSize: 62,
                           ),
                           SvgIconButton(
                             iconAsset: SvgIcons.mastercard,
                             iconSize: 62,
                           ),
                           SvgIconButton(
                             iconAsset: SvgIcons.paypal,
                             iconSize: 62,
                           ),
                           SvgIconButton(
                             iconAsset: SvgIcons.maestro,
                             iconSize: 62,
                           ),
                         ]),
                     Expanded(child: TabBarView(
                       children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width*0.05,
                          right: MediaQuery.of(context).size.width*0.05,
                          ),
                          child:  VisaPaymentForm(),
                        ),
                         Padding(
                           padding: EdgeInsets.only(
                             left: MediaQuery.of(context).size.width*0.05,
                             right: MediaQuery.of(context).size.width*0.05,
                           ),
                           child:  ListView(children: [Text('111')],),
                         ),
                         Padding(
                           padding: EdgeInsets.only(
                             left: MediaQuery.of(context).size.width*0.05,
                             right: MediaQuery.of(context).size.width*0.05,
                           ),
                           child:  ListView(children: [Text('111')],),
                         ),
                         Padding(
                           padding: EdgeInsets.only(
                             left: MediaQuery.of(context).size.width*0.05,
                             right: MediaQuery.of(context).size.width*0.05,
                           ),
                           child:  ListView(children: [Text('111')],),
                         ),
                       ],
                     ),)
                   ],
                 ),

               )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
