import 'package:client_chaliar/ui/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:client_chaliar/ui/styles/chaliar_color.dart';
import 'package:client_chaliar/ui/widgets/onboarding_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 10),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 10.0 : 7.0,
      width: isActive ? 10.0 : 7.0,
      decoration: BoxDecoration(
        color: isActive
            ? ChaliarColors.primaryColors
            : ChaliarColors.whiteGreyColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
    );
  }

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
          'DÉMARRER',
          style: AppTextStyle.header2(color: ChaliarColors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                color: ChaliarColors.whiteGreyColor,
                height: MediaQuery.of(context).size.height * 0.88,
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
                          'Choisissez une livraison express en 1h ou une livraison programmée',
                      buttonText: 'Suivant',
                      buildPageIndicator: _buildPageIndicator(),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/connexion');
                      },
                    ),
                    OnboardingPageWidget(
                      imageAsset: "assets/images/slider2.png",
                      title: 'Choisissez le mode de livraison',
                      subTitle:
                          'Vous trouverez un chaliar adapté à vos besoins dans les plus brefs délais',
                      buttonText: 'Suivant',
                      buildPageIndicator: _buildPageIndicator(),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/connexion');
                      },
                    ),
                    OnboardingPageWidget(
                      imageAsset: "assets/images/slider3.png",
                      title: 'Accédez à toutes vos courses',
                      subTitle:
                          'Découvrez votre historique et accédez facilement aux détails de vos courses ',
                      buttonText: 'Suivant',
                      buildPageIndicator: _buildPageIndicator(),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/connexion');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
