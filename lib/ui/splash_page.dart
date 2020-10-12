import 'package:flutter/material.dart';
import 'package:tutu/feature/app_initialisation/app_initialisation.dart';
import 'package:tutu/ui/home_page.dart';


class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

  Future<bool> appInitialisation;

  SplashPageState() {
    appInitialisation = AppInitialisation.initApp();
    appInitialisation.then((success) {
      if(success) {
        Route route = MaterialPageRoute(builder: (context) => HomePage());
        Navigator.pushAndRemoveUntil(context, route, (route) => false);
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