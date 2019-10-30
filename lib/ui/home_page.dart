import 'package:flutter/material.dart';
import 'package:tutu/ui/search_page.dart';

import 'utils/app_colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final podcasts = List<String>.generate(10000, (i) => "Podcast $i");

  void addPodcast() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchPage(title: "Search")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                    Icons.add,
                    color: AppColors.white
                ),
                onPressed: addPodcast
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: podcasts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Hello ${podcasts[index]}'),
              onTap: null,
            );
          },
        )
    );
  }
}