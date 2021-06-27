import 'package:flutter/material.dart';
import 'package:flutter_app/ui/styles/text_style.dart';

class CustomTextFieldCard extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final double? card_size;
  final TextStyle? placeholderStyle;
  final String? placeholder;
  final TextInputType? keyboardType;

  const CustomTextFieldCard({Key? key,this.leading,this.trailing,this.card_size=50,this.placeholderStyle,this.placeholder,this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        height: card_size,
        child: ListTile(
          leading: leading,
          title: Center(
            child: TextField(
              keyboardType: keyboardType,
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: placeholder,
                  hintStyle:placeholderStyle,
              ),
            ),
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}
