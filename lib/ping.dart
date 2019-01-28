import 'dart:async';
import 'dart:convert';

import 'package:reflectable/reflectable.dart';
import 'package:reflectable/mirrors.dart';
import 'package:http/http.dart' as http;

import 'package:ping/ping_model.reflectable.dart';

import 'package:ping/ping_model.dart';

@pingReflectable
class Ping {
  Ping() {
    initializeReflectable();
  }

  Future get(String url, {Type model}) {
    return http.get(url).then((res) {
      if (model != null) {
        ClassMirror mirror = pingReflectable.reflectType(model);
        return mirror.newInstance('fromJson', [json.decode(res.body)]);
//        return reflectClass(model)
//            .newInstance(Symbol('fromJson'), [json.decode(res.body)]).reflectee;
      }
      return PingModel.fromJson(json.decode(res.body));
    });
  }
}

@pingReflectable
@metaReflector
class User extends PingModel {
  final name;
  final email;

  @MetaCapability()
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        super.fromJson(json);
}

main() {
  Ping()
      .get('https://jsonplaceholder.typicode.com/users/1', model: User)
      .then((val) => print(val.body['email']));
}
