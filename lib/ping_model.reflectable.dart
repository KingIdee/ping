// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import "dart:core";
import 'ping_model.dart' as prefix0;

// ignore:unused_import
import "package:reflectable/mirrors.dart" as m;
// ignore:unused_import
import "package:reflectable/src/reflectable_builder_based.dart" as r;
// ignore:unused_import
import "package:reflectable/reflectable.dart" as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.PingReflectable(): new r.ReflectorData(
      <m.TypeMirror>[
        new r.NonGenericClassMirrorImpl(
            r"PingModel",
            r".PingModel",
            7,
            0,
            const prefix0.PingReflectable(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {
              r"fromJson": (b) =>
                  (json) => b ? new prefix0.PingModel.fromJson(json) : null
            },
            -1,
            -1,
            const <int>[-1],
            null,
            {})
      ],
      null,
      null,
      <Type>[prefix0.PingModel],
      1,
      {},
      {},
      null,
      [
        const [1, 0, null]
      ]),
  const prefix0.MetaReflector(): new r.ReflectorData(
      <m.TypeMirror>[], null, null, <Type>[], 0, {}, {}, null, [])
};

final _memberSymbolMap = null;

initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}
