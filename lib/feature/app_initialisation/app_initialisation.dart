


import 'package:tutu/service/service_holder.dart';

class AppInitialisation {

  static Future<bool> initApp() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }

}