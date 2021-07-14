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
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/ui/views/authentifications/authentification_screen.dart';
import 'package:flutter_app/ui/views/authentifications/conditionnal_term.dart';
import 'package:flutter_app/ui/views/course/home_course.dart';
import 'package:flutter_app/ui/views/facture/home_facturation.dart';
import 'package:flutter_app/ui/views/message/home_message.dart';
import 'package:flutter_app/ui/views/annexe/about.dart';
import 'package:flutter_app/ui/views/annexe/condionnal_term_detail_screen.dart';
import 'package:flutter_app/ui/views/annexe/faq_screen.dart';
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
import 'package:flutter_app/ui/views/orders/order_scanning.dart';
import 'package:flutter_app/ui/views/orders/order_tracking.dart';
import 'package:flutter_app/ui/views/profile/annexe/add_payment_method_screen.dart';
import 'package:flutter_app/ui/views/profile/annexe/edit_profile_screen.dart';
import 'package:flutter_app/ui/views/profile/annexe/payment_method_screen.dart';
import 'package:flutter_app/ui/views/profile/home_profile_screen.dart';
import 'package:flutter_app/ui/views/splash_screen.dart';
import 'package:flutter_app/ui/views/tutorial_screen.dart';
// import 'package:client_chaliar/ui/views/faq/term_screen.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> main() async{
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();
  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (USE_EMULATOR) {
    await _connectToFirebaseEmulator();
  }

  Stripe.publishableKey = 'stripePublishableKey';
  runApp(MyApp(camera: firstCamera,));
}


const bool USE_EMULATOR = true;

Future _connectToFirebaseEmulator() async {
  final localHostString = Platform.isAndroid ? '10.0.2.2' : 'localhost';

  FirebaseFirestore.instance.settings = Settings(
    host: '$localHostString:8080',
    sslEnabled: false,
    persistenceEnabled: false,
  );
  await FirebaseAuth.instance.useEmulator('http://$localHostString:9099');
  // [Storage | localhost:9199]
  await firebase_storage.FirebaseStorage.instance.useStorageEmulator(localHostString, 9199);
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> camera;

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
          // primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          unselectedWidgetColor: Colors.grey,
          disabledColor: Colors.grey),
      routes: <String, WidgetBuilder>{
        "/splash": (BuildContext context) => new SplashScreen(),
        "/tuto": (BuildContext context) => new OnboardingScreen(),
        "/connexion": (BuildContext context) => new ConnexionScreen(),
        "/pro_particulier": (BuildContext context) =>
        new ProParticulierScreen(),
        "/phone_auth":(BuildContext context)=>new PhoneOptValidateScreen(),
        "/inscription": (BuildContext context) => new UserRegisterScreen(),
        "/singin": (BuildContext context) => new SingInScreen(),
        "/pre_commande": (BuildContext context) => new PreCommandeScreen(),
        "/taille_colli": (BuildContext context) => new TailleColisScreen(),
        "/add_photo": (BuildContext context) => new AddPhotoScreen(),
        "/commande_depart_form": (BuildContext context) => new DepartFormScreen(),
        "/commande_arrivee_form": (BuildContext context) => new ArriveeFormScreen(),
        '/take_picture':(BuildContext context)=>new TakePictureScreen(camera: camera),
        '/resume_order_screen':(BuildContext context)=>new ResumeOrderScreen(),
        '/home_profile':(BuildContext context)=>new HomeProfileScreen(),
        '/edit_profile':(BuildContext context)=>new EditProfileScreen(),
        '/payment_method':(BuildContext context)=>new PaymentMethodScreen(),
        '/add_payment_method':(BuildContext context)=>new AddPaymentMethodScreen(),
        '/home_facturation':(BuildContext context)=>new HomeFacturationScreen(),
         "/faq": (BuildContext context) => new FaqScreen(),
        "/order_tracking": (BuildContext context) => new OrderTrackingScreen(),
        "/order_scaning": (BuildContext context) => new OrderScanScreen(),
        "/order_message": (BuildContext context) => new HomeMessageScreen(),
        "/about": (BuildContext context) => new AboutScreen(),
        "/term_condition": (BuildContext context) => new TermConditionScreen(),
        "/home_course":(BuildContext context)=>new HomeCourseScreen(),
      },
    );
  }
}