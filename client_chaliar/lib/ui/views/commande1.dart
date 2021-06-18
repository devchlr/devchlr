import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class CommandeUn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ChaliarColors.whiteGreyColor,
        flexibleSpace: Image(
          image: AssetImage('assets/images/header.png'),
          fit: BoxFit.fill,
        ),
        title: Text(
          'Commande',
          style: AppTextStyle.appBarHeader(color: ChaliarColors.whiteColor),
        ),
        centerTitle: true,
      ),
      backgroundColor: ChaliarColors.whiteGreyColor,
      body: Stack(
        children: [
          Column(
            children: [
              Container(

              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}
