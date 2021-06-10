import 'package:flutter/material.dart';
import 'package:client_chaliar/ui/views/splash_screen.dart';
import 'package:client_chaliar/ui/views/tuto_screen.dart';

void main() {
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
      ),
      routes: <String, WidgetBuilder>{
        "/splash": (BuildContext context) => new SplashScreen(),
        "/tuto": (BuildContext context) => new OnboardingScreen(),
      },
    );
  }
}
