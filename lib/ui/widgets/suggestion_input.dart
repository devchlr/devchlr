import 'package:flutter/material.dart';
import 'package:flutter_app/ui/styles/chaliar_color.dart';
import 'package:flutter_app/ui/styles/text_style.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';


class CustomSugestionInput extends StatelessWidget {
  final TextEditingController?controller;
 final Future<Iterable<Object?>> Function(String)? suggestionsCallback;
  final Widget Function(BuildContext,Object?) ?itemBuilder;
  final void Function(Object?)? onSuggestionSelected;
  final String? placeholder;
  final String? errorText;
  final Color? labelColor;
  final Color?fillColors;
  final FontWeight?weigth;
  final bool? isUrderline;

 const CustomSugestionInput({this.labelColor,this.fillColors,this.weigth,this.isUrderline=false,
   this.errorText,this.placeholder, Key? key,this.controller,this.suggestionsCallback,this.itemBuilder,this.onSuggestionSelected}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: TypeAheadField(
        textFieldConfiguration: TextFieldConfiguration(
            controller: controller,
            style: AppTextStyle.appBarHeader(
              fontWeight: FontWeight.w400,
                size: 12,
                color: labelColor==null?ChaliarColors.secondaryColors:labelColor
            ),
            decoration: InputDecoration(
              enabled: false,
                filled: true,
                fillColor: fillColors==null?ChaliarColors.whiteGreyColor:fillColors,
                contentPadding: EdgeInsets.only(
                    top:  MediaQuery.of(context).size.height * 0.025,
                    bottom: MediaQuery.of(context).size.height * 0.025,
                    left: 20,
                    right: 20),
                errorStyle: AppTextStyle.appBarHeader(
                    color: Colors.red,
                    size: 12,
                    fontWeight: FontWeight.w400
                ),
                errorText: errorText,
                hintText: placeholder,
                hintStyle: AppTextStyle.appBarHeader(
                  size: 12,
                    color: labelColor==null?ChaliarColors.secondaryColors:labelColor,
                  fontWeight: weigth==null?FontWeight.w400:weigth!
                ),
                border:isUrderline==false?InputBorder.none:new UnderlineInputBorder(
                    borderSide: new BorderSide(
                    color: Colors.black
                    ),),
                 enabledBorder: isUrderline==false?InputBorder.none:new UnderlineInputBorder(
                   borderSide: new BorderSide(
                       color: Colors.black
                   ),),
            )
        ),
        suggestionsCallback: suggestionsCallback!,
        itemBuilder: itemBuilder!,
        onSuggestionSelected: onSuggestionSelected!,
      ),
    );
  }
}
