import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tutu/ui/utils/app_colors.dart';

import '../utils/strings.dart';

class ExpandableText extends StatefulWidget {

  final String text;
  
  ExpandableText(this.text);

  @override
  State<ExpandableText> createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  
  bool expanded = false;
  
  @override
  Widget build(BuildContext context) {
    List<InlineSpan> children = List();
    if(widget.text.length >= 102) {
      children.add(
          TextSpan(
              text: " " + (expanded ? Strings.showLess : Strings.showMore),
              style: TextStyle(color: AppColors.accent),
              recognizer: TapGestureRecognizer()..onTap = () {
                setState(() {
                  expanded = !expanded;
                });
              }
          )
      );
    }
    return Text.rich(
      TextSpan(
          text: (expanded || widget.text.length < 102) ? widget.text : widget.text.substring(0, 100) + "...",
          children: children
      )
    );
  }
}