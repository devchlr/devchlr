import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class PreCommandeScreen extends StatefulWidget {


  @override
  _PreCommandeScreenState createState() => _PreCommandeScreenState();
}

class _PreCommandeScreenState extends State<PreCommandeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChaliarMenu.topBar(
        title: 'Commande',
        bgColor: ChaliarColors.whiteColor,
        imageBackground: 'assets/images/header.png'
      ),
      bottomNavigationBar: Container(
        height: 100,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                  color: ChaliarColors.whiteColor,
                ),

              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/blueGrad.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),),
            ],
          ),
        ],
      ),
    );
  }
}

