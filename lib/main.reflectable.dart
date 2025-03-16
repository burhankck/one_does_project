// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.
import 'dart:core';
import 'package:one_does_project/data/model/book_detail_model.dart' as prefix2;
import 'package:one_does_project/data/model/book_model.dart' as prefix1;
import 'package:one_does_project/data/model/reflectable_model.dart' as prefix0;

// ignore_for_file: camel_case_types
// ignore_for_file: implementation_imports
// ignore_for_file: prefer_adjacent_string_concatenation
// ignore_for_file: prefer_collection_literals
// ignore_for_file: unnecessary_const
// ignore_for_file: unused_import

import 'package:reflectable/mirrors.dart' as m;
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.Reflector(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r'BookModel',
            r'.BookModel',
            134217735,
            0,
            const prefix0.Reflector(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {
              r'': (bool b) =>
                  ({data}) => b ? prefix1.BookModel(data: data) : null,
              r'fromJson': (bool b) =>
                  (json) => b ? prefix1.BookModel.fromJson(json) : null
            },
            -1,
            -1,
            const <int>[-1],
            null,
            {
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'data': 0,
              r'data=': 1
            }),
        r.NonGenericClassMirrorImpl(
            r'BookDetailModel',
            r'.BookDetailModel',
            134217735,
            1,
            const prefix0.Reflector(),
            const <int>[-1],
            null,
            null,
            -1,
            {},
            {},
            {
              r'': (bool b) =>
                  ({data}) => b ? prefix2.BookDetailModel(data: data) : null,
              r'fromJson': (bool b) =>
                  (json) => b ? prefix2.BookDetailModel.fromJson(json) : null
            },
            -1,
            -1,
            const <int>[-1],
            null,
            {
              r'==': 1,
              r'toString': 0,
              r'noSuchMethod': 1,
              r'hashCode': 0,
              r'runtimeType': 0,
              r'toJson': 0,
              r'data': 0,
              r'data=': 1
            })
      ],
      null,
      null,
      <Type>[prefix1.BookModel, prefix2.BookDetailModel],
      2,
      {
        r'==': (dynamic instance) => (x) => instance == x,
        r'toString': (dynamic instance) => instance.toString,
        r'noSuchMethod': (dynamic instance) => instance.noSuchMethod,
        r'hashCode': (dynamic instance) => instance.hashCode,
        r'runtimeType': (dynamic instance) => instance.runtimeType,
        r'data': (dynamic instance) => instance.data,
        r'toJson': (dynamic instance) => instance.toJson
      },
      {r'data=': (dynamic instance, value) => instance.data = value},
      null,
      [
        const [0, 0, null],
        const [1, 0, null],
        const [
          0,
          0,
          const [#data]
        ]
      ])
};

final _memberSymbolMap = null;

void initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}
