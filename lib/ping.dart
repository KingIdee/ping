import 'dart:async';

import 'package:flutter/services.dart';

class Ping {
  static const MethodChannel _channel =
      const MethodChannel('ping');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

}
