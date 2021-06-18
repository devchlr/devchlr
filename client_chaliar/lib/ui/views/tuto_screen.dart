import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:client_chaliar/ui/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/widgets/onboarding_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:client_chaliar/business_logic/view_model/tuto_view_model.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }
  void onChangedPade(int page) {
  setState(() {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    _currentPage=page;
  });
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 10),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 12.0 : 7.0,
      width: isActive ? 12.0 : 7.0,
      decoration: BoxDecoration(
        color: isActive
            ? Color(0xff74c6f0)
            : ChaliarColors.whiteGreyColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TutoViewModel>(
      create: (context) => TutoViewModel(),
      child: Consumer<TutoViewModel>(
          builder: (context, model, child) =>

      Scaffold(
        appBar: ChaliarMenu.topBar(imageBackground:'assets/images/header.png',title: 'DÉMARRER',bgColor:ChaliarColors.whiteColor),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                color: ChaliarColors.whiteGreyColor,
                height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    OnboardingPageWidget(
                      imageAsset: "assets/images/slider1.png",
                      title: 'Commandez un livreur en 3 clics',
                      subTitle:
                          'Choisissez une livraison express en \n1h ou une livraison programmée',
                      buttonText: 'Suivant',
                      buildPageIndicator: _buildPageIndicator(),
                      onTap: () {
                        onChangedPade(1);
                      },
                    ),
                    OnboardingPageWidget(
                      imageAsset: "assets/images/slider2.png",
                      title: 'Choisissez le mode de livraison',
                      subTitle:
                          'Vous trouverez un chaliar adapté à \nvos besoins dans les plus brefs \ndélais',
                      buttonText: 'Suivant',
                      buildPageIndicator: _buildPageIndicator(),
                      onTap: () {
                        onChangedPade(2);
                      },
                    ),
                    OnboardingPageWidget(
                      imageAsset: "assets/images/slider3.png",
                      title: 'Accédez à toutes vos courses',
                      subTitle:
                          'Découvrez votre historique et\n accédez facilement aux détails de\n vos courses ',
                      buttonText: 'Suivant',
                      buildPageIndicator: _buildPageIndicator(),
                      onTap: () {
                        model.PushPage(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),),);
  }
}
