


import 'package:tutu/service/service_holder.dart';

class AppInitialisation {

  static Future<bool> initApp() async {
    await ServiceHolder.databaseService.init();
    return true;
  }

}