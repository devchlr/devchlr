import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:client_chaliar/ui/views/inscription/particulier_screen.dart';
import 'package:client_chaliar/ui/views/inscription/pro_screen.dart';
import 'package:client_chaliar/ui/widgets/appBar.dart';

class InscriptionHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Image(
          image: AssetImage('assets/images/header.png'),
          fit: BoxFit.fill,
        ),
        title: Text(
          'Inscription',
          style: AppTextStyle.header2(color: ChaliarColors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                // color: colorPrimary,
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: const Radius.circular(18.0),
                ),
              ),
              child: DefaultTabController(
                length: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TabBar(
                          isScrollable: false,
                          tabs: [
                            Tab(
                              icon: Text(
                                'Particulier',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.header1_title(
                                    color: ChaliarColors.primaryColors),
                              ),
                            ),
                            Tab(
                              icon: Text(
                                'Professionnel',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.header1_title(
                                    color: ChaliarColors.primaryColors),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          flex: 2,
                          child: TabBarView(
                            children: <Widget>[
                              InscriptionParticulierScreen(),
                              InscriptionProScreen()
                            ],
                          ),
                        )
                      ]),
                ),
              ));
        }),
      ),
    );
  }
}
