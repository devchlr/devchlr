import 'package:flutter/material.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_app/ui/widgets/appBar.dart';


class TermConditionScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChaliarMenu.topBar(title: 'Condition générale',bgColor: ChaliarColors.whiteColor,imageBackground: 'assets/images/header.png'),
      body: Stack(
        children: [
          Container(
            color: ChaliarColors.whiteColor,
          ),
          Card(
            elevation: 0,
            margin: EdgeInsets.only(
                left: 20,
                right: 20
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Condition générale',textAlign: TextAlign.center,style: AppTextStyle.headerApp1(color: ChaliarColors.blackColor,)),
                SizedBox(
                  height: 20,
                ),
                Text.rich(
                  TextSpan(
                    text: "Lorem Ipsum is It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etcsometimes on purpose (injected humour and the likesimply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                    style: AppTextStyle.bodyApp1(color: ChaliarColors.blackColor),
                  ),
                  textAlign:TextAlign.justify,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
