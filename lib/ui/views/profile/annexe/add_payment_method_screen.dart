import 'package:flutter/material.dart';
import 'package:flutter_app/ui/views/profile/annexe/payment_form/visa_form.dart';
import 'package:flutter_app/ui/widgets/custom_header.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';


class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  _AddPaymentMethodScreenState createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {

  // PaymentIntent? _retrievedPaymentIntent;
  // CardFieldInputDetails? _card;
  // SetupIntent? _setupIntentResult;
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.3,),
                SizedBox(height: 61,),
               Center(
                 child: Image.asset('assets/images/methodpayement_method.png'),
               ),

                // Container(
                //   alignment: Alignment.center,
                //   padding: EdgeInsets.all(16),
                //   child: CardField(
                //     onCardChanged: (card) {
                //       setState(() {
                //         _card=card;
                //       });
                //       print(_card?.expiryYear);
                //     },
                //   ),
                // ),
                // Expanded(child:VisaPaymentForm(),)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 0
            ),
            child: CustomHearder(
              title: "Méthode de paiement",
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
    );
  }
}
