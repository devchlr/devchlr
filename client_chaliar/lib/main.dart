import 'package:client_chaliar/ui/views/auth/inscription/register_screen.dart';
import 'package:client_chaliar/ui/views/auth/phone_opt/phone_number_input.dart';
import 'package:client_chaliar/ui/views/commande/add_photo_screen.dart';
import 'package:client_chaliar/ui/views/commande/formulaire/arrive_form_screen.dart';
import 'package:client_chaliar/ui/views/commande/formulaire/depart_form_screen.dart';
import 'package:client_chaliar/ui/views/commande/pre_commande_screen.dart';
import 'package:client_chaliar/ui/views/commande/taille_colli_screen.dart';
import 'package:client_chaliar/ui/views/commande1.dart';
import 'package:client_chaliar/ui/views/faq/faq_screen.dart';
import 'package:flutter/material.dart';
import 'package:client_chaliar/ui/views/splash_screen.dart';
import 'package:client_chaliar/ui/views/tuto_screen.dart';
import 'package:client_chaliar/ui/views/auth/connexion_screen.dart';
import 'package:client_chaliar/ui/views/auth/pro_particulier_screen.dart';
import 'package:client_chaliar/ui/views/auth/inscription_screen.dart';
import 'package:client_chaliar/ui/views/auth/singin_screen.dart';
import 'package:client_chaliar/ui/views/auth/condition_generale_screen.dart';
import 'package:client_chaliar/ui/views/auth/phone_opt/phone_number_validate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:client_chaliar/ui/views/faq/term_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      title: 'Chaliar',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          unselectedWidgetColor: Colors.grey,
          disabledColor: Colors.blueAccent),
      routes: <String, WidgetBuilder>{
        "/splash": (BuildContext context) => new PreCommandeScreen(),
        "/tuto": (BuildContext context) => new OnboardingScreen(),
        "/connexion": (BuildContext context) => new ConnexionScreen(),
        "/pro_particulier": (BuildContext context) =>
            new ProParticulierScreen(),
        "/inscription": (BuildContext context) => new InscriptionHomeScreen(),
        "/singin": (BuildContext context) => new PhoneOptMainScreen(),
        "/condition_generale": (BuildContext context) =>
            new ConditionGeneraleScreen(),
        "/phone_verification": (BuildContext context) => new PhoneOptValidateScreen(),
        "/term_condition": (BuildContext context) => new TermConditionScreen(),
        "/pre_commande": (BuildContext context) => new PreCommandeScreen(),
        "/taille_colli": (BuildContext context) => new TailleColisScreen(),
        "/add_photo": (BuildContext context) => new AddPhotoScreen(),
        "/commande_depart_form": (BuildContext context) => new DepartFormScreen(),
        "/commande_arrivee_form": (BuildContext context) => new ArriveeFormScreen(),
        "/faq": (BuildContext context) => new FaqScreen(),
      },
    );
  }
}