import 'dart:async';

import 'package:flutter/services.dart';

class Hellosk {
  static const MethodChannel _channel =
      const MethodChannel('hellosk');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
