
import 'dart:_http';

import 'package:ping/ping.dart';

class PingBuilder {

  String _baseUrl;
  int _timeout;

  PingBuilder setBaseUrl(String baseUrl) {
    this._baseUrl = baseUrl;
    return this;
  }

  String getBaseUrl() {
    return _baseUrl;
  }

  PingBuilder setTimeout(int _timeout) {
    this._timeout = _timeout;
    return this;
  }

  Ping build(){
    var pingStaticInstance = Ping.instance;
    pingStaticInstance.client = HttpClient();
    pingStaticInstance.pingBuilder = this;

    if(_timeout!=null) {
      pingStaticInstance.client.connectionTimeout = Duration(seconds: _timeout);
    }

    return pingStaticInstance;
  }


  static final PingBuilder instance = new PingBuilder._internal();

  factory PingBuilder() {
    return instance;
  }

  PingBuilder._internal();

}