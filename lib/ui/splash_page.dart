import 'package:flutter/material.dart';
import 'package:tutu/feature/app_initialisation/app_initialisation.dart';
import 'package:tutu/ui/home_page.dart';


class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

  Future<bool> appInitialisation;

  SplashPageState() {
    appInitialisation = AppInitialisation.initApp();
    appInitialisation.then((success) {
      if(success) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage(title: "Home")),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

}