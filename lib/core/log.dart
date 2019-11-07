

import 'package:logger/logger.dart';

class Log {

  static Logger logger = Logger();
  static String TAG = "__app ";

  static v(dynamic message) {
    logger.v(TAG + message);
  }

  static d(dynamic message) {
    logger.d(TAG + message);
  }

  static i(dynamic message) {
    logger.i(TAG + message);
  }

  static w(dynamic message) {
    logger.w(TAG + message);
  }

  static e(dynamic message) {
    logger.e(TAG + message);
  }

  static wtf(dynamic message) {
    logger.wtf(TAG + message);
  }
}