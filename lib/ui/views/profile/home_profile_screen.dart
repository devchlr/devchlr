import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constants/iconList.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/chaliar_font.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/custom_botom_navigation_bar.dart';
import 'package:flutter_app/ui/widgets/custom_showSnackBar.dart';
import 'package:flutter_app/ui/widgets/profile_listTile.dart';
import 'package:flutter_app/ui/widgets/svg_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomeProfileScreen extends StatefulWidget {
  FirebaseAuth _auth =FirebaseAuth.instance;
  HomeProfileScreen({Key? key}) : super(key: key);

  @override
  _HomeProfileScreenState createState() => _HomeProfileScreenState();
}

class _HomeProfileScreenState extends State<HomeProfileScreen> {
  CustomShowSnackBar customShowSnackBar=CustomShowSnackBar();
  String? user_surname;
  void initState() {
    super.initState();
    nextScreen();
  }
  void nextScreen()async{
    print(await widget._auth.currentUser);
    // setState(() async{
    //   user_surname=await widget._auth.currentUser?.phoneNumber;
    // });
    // print(user_surname);

    // if(await widget._auth.currentUser==null){
    //   Timer(Duration(seconds: 6),
    //           () => Navigator.pushReplacementNamed(context, '/tuto'));
    // }else{
    //   print('toujours actif');
    //   // widget._auth.signOut();
    //   Timer(Duration(seconds: 6),
    //           () => Navigator.pushReplacementNamed(context, '/pre_commande'));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/profileBg.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(child: Container(
                color: ChaliarColors.whiteGreyColor,
              ))
            ],
          ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                child: ListView(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 90,
                      backgroundImage: AssetImage('assets/images/profileInage.png'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width*0.1
                    ),
                    child: Center(
                      child: Text(
                        '$user_surname\nWilliams',
                        textAlign: TextAlign.left,
                        style: AppTextStyle.appBarHeader(
                            size: 19,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFontFamilly.montserrat
                        ),
                      ),
                    ),
                  )
                ],
              ),),
              Expanded(
                  child:Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*0.08,
                      right: MediaQuery.of(context).size.width*0.08
                    ),
                    child:  ListView(
                      children: [
                        Text('GENERAL',style: AppTextStyle.appBarHeader(
                          size: 13,
                          color: Color(0xff77869E),
                          fontFamily: AppFontFamilly.avenirHeavy
                        ),),
                        SizedBox(
                          height: 15.0,
                        ),
                        CustomProfileListTile(title:'Mes informations',iconAsset:SvgIcons.ticket,onTap:(){
                          Navigator.pushNamed(context, '/edit_profile');
                        },),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomProfileListTile(title:'Méthode de paiement',iconAsset:SvgIcons.credit_card,onTap:(){},),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomProfileListTile(title:'Facturation',iconAsset:SvgIcons.invoice,onTap:(){},),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text('CHART',style: AppTextStyle.appBarHeader(
                            size: 13,
                            color: Color(0xff77869E),
                            fontFamily: AppFontFamilly.avenirHeavy
                        ),),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomProfileListTile(title:'Aide',iconAsset:SvgIcons.question,onTap:(){},),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomProfileListTile(title:'À propos',iconAsset:SvgIcons.smartphone,onTap:(){},),
                        SizedBox(
                          height: 10.0,
                        ),
                        CustomProfileListTile(title:'Partager l’applicati',iconAsset:SvgIcons.share,onTap:(){},),
                        SizedBox(
                          height: 50.0,
                        ),
                        GestureDetector(
                          onTap: (){
                            widget._auth.signOut();
                          },
                          child: Card(
                            color: Color(0xffDFE7F5),
                            elevation: 1,
                            child: ListTile(
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xffDFE7F5),
                                  borderRadius: BorderRadius.all(Radius.circular(5)
                                  ),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: (){
                                      customShowSnackBar.initUserRequestAnimation(context);
                                      widget._auth.signOut();
                                      Navigator.pushNamed(context, '/singin');
                                    },
                                    child: SvgIconButton(
                                      iconSize: 25,
                                      iconAsset: SvgIcons.logout,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text(
                                'Déconnexion',
                                style: AppTextStyle.appBarHeader(
                                    color: Color(0xff042C5C),
                                    size: 14,
                                    fontFamily: AppFontFamilly.montserrat,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  )
             )
            ],
          )

        ],
      ),
    );
  }
}
