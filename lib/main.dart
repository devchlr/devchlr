// import 'package:client_chaliar/ui/views/auth/inscription/register_screen.dart';
// import 'package:client_chaliar/ui/views/auth/phone_opt/phone_number_input.dart';
// import 'package:client_chaliar/ui/views/auth/preCondition_screen.dart';
// import 'package:client_chaliar/ui/views/commande/add_photo_screen.dart';
// import 'package:client_chaliar/ui/views/commande/formulaire/arrive_form_screen.dart';
// import 'package:client_chaliar/ui/views/commande/formulaire/depart_form_screen.dart';
// import 'package:client_chaliar/ui/views/commande/formulaire/take_picture.dart';
// import 'package:client_chaliar/ui/views/commande/pre_commande_screen.dart';
// import 'package:client_chaliar/ui/views/commande/taille_colli_screen.dart';
// import 'package:client_chaliar/ui/views/commande1.dart';
// import 'package:client_chaliar/ui/views/faq/faq_screen.dart';
import 'package:flutter/material.dart';
// import 'package:client_chaliar/ui/views/splash_screen.dart';
// import 'package:client_chaliar/ui/views/tuto_screen.dart';
// import 'package:client_chaliar/ui/views/auth/connexion_screen.dart';
// import 'package:client_chaliar/ui/views/auth/pro_particulier_screen.dart';
// import 'package:client_chaliar/ui/views/auth/inscription_screen.dart';
// import 'package:client_chaliar/ui/views/auth/singin_screen.dart';
// import 'package:client_chaliar/ui/views/auth/condition_generale_screen.dart';
// import 'package:client_chaliar/ui/views/auth/phone_opt/phone_number_validate.dart';
import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/ui/views/authentifications/connexion_screen.dart';
import 'package:flutter_app/ui/views/authentifications/home_screen.dart';
import 'package:flutter_app/ui/views/authentifications/register_screen.dart';
import 'package:flutter_app/ui/views/authentifications/type_register_screen.dart';
import 'package:flutter_app/ui/views/orders/form/arrive_order_form.dart';
import 'package:flutter_app/ui/views/orders/form/camera/add_photo_screen.dart';
import 'package:flutter_app/ui/views/orders/form/camera/camera_screen.dart';
import 'package:flutter_app/ui/views/orders/form/depart_order_form.dart';
import 'package:flutter_app/ui/views/orders/form/package_information_screen.dart';
import 'package:flutter_app/ui/views/orders/form/resume_order_screen.dart';
import 'package:flutter_app/ui/views/orders/home_order_screen.dart';
import 'package:flutter_app/ui/views/profile/annexe/add_payment_method_screen.dart';
import 'package:flutter_app/ui/views/profile/annexe/edit_profile_screen.dart';
import 'package:flutter_app/ui/views/profile/annexe/payment_method_screen.dart';
import 'package:flutter_app/ui/views/profile/home_profile_screen.dart';
import 'package:flutter_app/ui/views/splash_screen.dart';
import 'package:flutter_app/ui/views/tutorial_screen.dart';
// import 'package:client_chaliar/ui/views/faq/term_screen.dart';

Future<void> main() async{
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();
  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(camera: firstCamera,));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({
    Key? key,
    required this.camera,
  }) : super(key: key);

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
          disabledColor: Colors.grey),
      routes: <String, WidgetBuilder>{
        "/splash": (BuildContext context) => new SplashScreen(),
        "/tuto": (BuildContext context) => new OnboardingScreen(),
        "/connexion": (BuildContext context) => new ConnexionScreen(),
        "/pro_particulier": (BuildContext context) =>
        new ProParticulierScreen(),
        "/inscription": (BuildContext context) => new UserRegisterScreen(),
        "/singin": (BuildContext context) => new PhoneOptMainScreen(),
        // "/condition_generale": (BuildContext context) =>
        // new ConditionGeneraleScreen(),
        // "/phone_verification": (BuildContext context) => new PhoneOptValidateScreen(),
        // "/term_condition": (BuildContext context) => new TermConditionScreen(),
        // "/pre_commande": (BuildContext context) => new PreCommandeScreen(),
        "/taille_colli": (BuildContext context) => new TailleColisScreen(),
        "/add_photo": (BuildContext context) => new AddPhotoScreen(),
        "/commande_depart_form": (BuildContext context) => new DepartFormScreen(),
        "/commande_arrivee_form": (BuildContext context) => new ArriveeFormScreen(),
        '/take_picture':(BuildContext context)=>new TakePictureScreen(camera: camera),
        '/resume_order_screen':(BuildContext context)=>new ResumeOrderScreen(),

        // "/faq": (BuildContext context) => new FaqScreen(),
        // "/pre-condition": (BuildContext context) => new PreOnboardingScreen(),
      },
    );
  }
}