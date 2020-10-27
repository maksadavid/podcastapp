import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


class ExpandableText extends StatefulWidget {
  final String text;

  ExpandableText(this.text);

  @override
  State<ExpandableText> createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("Description"),
      children: [
        Html(data:widget.text)
      ],
    );
  }
}
