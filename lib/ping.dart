import 'dart:_http';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:ping/ping_builder.dart';
import 'package:http/http.dart' as http;

class Ping {

  HttpClient client;
  PingBuilder pingBuilder;

  /// =====================
  /// GET request to return a Future
  /// =====================
  Future<T> getRequest<T>(String endpoint, Future<T> fn(Client client)) async {
    var res = await http.get("${pingBuilder.getBaseUrl()} $endpoint");

    if (res.statusCode == 200) {
      var mappedResponse = res.body as T;
      return Future.value(mappedResponse);
    } else {
      return Future.error(Error());
    }
  }

  /// =====================
  /// GET request with callbacks
  /// =====================
  Future<T> getRequestWithCallback<T>(String endpoint,
      {Future<T> Function(T response) onSuccess,
      Future<T> Function(T response) onFailure}) async {

    var res = await http.get("${pingBuilder.getBaseUrl()} $endpoint");
    if (res.statusCode == 200) {
      var mappedResponse = res.body as T;
      return await onSuccess(mappedResponse);
    } else {
      return Future.error(Error());
    }

  }

  static final Ping instance = new Ping._internal();

  factory Ping() {
    return instance;
  }

  Ping._internal();

}
