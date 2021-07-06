import 'package:flutter/material.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingForm extends StatefulWidget {
  const LoadingForm({Key? key}) : super(key: key);

  @override
  _LoadingFormState createState() => _LoadingFormState();
}

class _LoadingFormState extends State<LoadingForm> {
  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
       body:  Container(
         color: Colors.white,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Text('Patienter svp...',style: AppTextStyle.appBarHeader(
               color: ChaliarColors.secondaryColors,
             ),),
             SizedBox(height: 20,),
             SpinKitThreeBounce(
               color: Colors.blueAccent,
               size: 50.0,
             )
           ],
         ),
       ),
     );
  }
}
