import 'dart:async';

import 'package:flutter/services.dart';

class Hellop {
  static const MethodChannel _channel =
      const MethodChannel('hellop');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
