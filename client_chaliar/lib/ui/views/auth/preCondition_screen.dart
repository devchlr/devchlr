import 'package:client_chaliar/business_logic/models/model_user.dart';
import 'package:client_chaliar/business_logic/view_model/auth/condition_term_view_model.dart';
import 'package:client_chaliar/ui/views/auth/condition_generale_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PreOnboardingScreen extends StatefulWidget {

  String phone;
  PreOnboardingScreen({this.phone});
  @override
  _PreOnboardingScreenState createState() => _PreOnboardingScreenState();
}
class _PreOnboardingScreenState extends State<PreOnboardingScreen> {
  void initState(){
    super.initState();
    getUserData();
  }
  ConditionnalTermViewModel conditionnalTermViewModel = ConditionnalTermViewModel();
  void getUserData() async{
    var userData = await conditionnalTermViewModel.getUserData(widget.phone);
    print(userData['id']);
    Navigator.push(context,MaterialPageRoute(builder:(context){
      return  ConditionGeneraleScreen(user: new UserChaliar(
        id: userData['id'],
        name: userData['name'],
        surname: userData['surname'],
        email: userData['email'],
          phone : userData['phone'],
          street : userData['street'],
          facturationAdresse : userData['facturationAdresse'],
          codePostal : userData['codePostal'],
          city : userData['city'],
          siret:userData['siret'],
          societe:userData['societe'],
          userRole : userData['userRole']
      ),);
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.blueAccent,
          size: 100.0,
        ),
      ),
    );
  }
}
