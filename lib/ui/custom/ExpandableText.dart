import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
    return Text.rich(
      TextSpan(
          text: expanded ? widget.text : widget.text.substring(0, 100) + "...",
          children: [
            TextSpan(
                text: " " + (expanded ? "Less" : "More"),
                style: TextStyle(color: Colors.blueAccent),
                recognizer: TapGestureRecognizer()..onTap = () {
                  setState(() {
                    expanded = !expanded;
                  });
                }
            ),
          ],
      ),
    );
  }
}