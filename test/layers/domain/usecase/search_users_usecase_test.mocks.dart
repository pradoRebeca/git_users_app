// Mocks generated by Mockito 5.4.4 from annotations
// in git_users_app/test/layers/domain/usecase/search_users_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:git_users_app/layers/data/datasources/search_users_datasource.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [SearchUsersDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchUsersDatasource extends _i1.Mock
    implements _i2.SearchUsersDatasource {
  MockSearchUsersDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<Map<String, dynamic>> call(String? search) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [search],
        ),
        returnValue:
            _i3.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i3.Future<Map<String, dynamic>>);
}

/// A class which mocks [Map].
///
/// See the documentation for Mockito's code generation for more information.
class MockMap extends _i1.Mock implements Map<String, dynamic> {
  MockMap() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Iterable<MapEntry<String, dynamic>> get entries => (super.noSuchMethod(
        Invocation.getter(#entries),
        returnValue: <MapEntry<String, dynamic>>[],
      ) as Iterable<MapEntry<String, dynamic>>);

  @override
  Iterable<String> get keys => (super.noSuchMethod(
        Invocation.getter(#keys),
        returnValue: <String>[],
      ) as Iterable<String>);

  @override
  Iterable<dynamic> get values => (super.noSuchMethod(
        Invocation.getter(#values),
        returnValue: <dynamic>[],
      ) as Iterable<dynamic>);

  @override
  int get length => (super.noSuchMethod(
        Invocation.getter(#length),
        returnValue: 0,
      ) as int);

  @override
  bool get isEmpty => (super.noSuchMethod(
        Invocation.getter(#isEmpty),
        returnValue: false,
      ) as bool);

  @override
  bool get isNotEmpty => (super.noSuchMethod(
        Invocation.getter(#isNotEmpty),
        returnValue: false,
      ) as bool);

  @override
  Map<RK, RV> cast<RK, RV>() => (super.noSuchMethod(
        Invocation.method(
          #cast,
          [],
        ),
        returnValue: <RK, RV>{},
      ) as Map<RK, RV>);

  @override
  bool containsValue(Object? value) => (super.noSuchMethod(
        Invocation.method(
          #containsValue,
          [value],
        ),
        returnValue: false,
      ) as bool);

  @override
  bool containsKey(Object? key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
      ) as bool);

  @override
  void operator []=(
    String? key,
    dynamic value,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #[]=,
          [
            key,
            value,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  Map<K2, V2> map<K2, V2>(
          MapEntry<K2, V2> Function(
            String,
            dynamic,
          )? convert) =>
      (super.noSuchMethod(
        Invocation.method(
          #map,
          [convert],
        ),
        returnValue: <K2, V2>{},
      ) as Map<K2, V2>);

  @override
  void addEntries(Iterable<MapEntry<String, dynamic>>? newEntries) =>
      super.noSuchMethod(
        Invocation.method(
          #addEntries,
          [newEntries],
        ),
        returnValueForMissingStub: null,
      );

  @override
  dynamic update(
    String? key,
    dynamic Function(dynamic)? update, {
    dynamic Function()? ifAbsent,
  }) =>
      super.noSuchMethod(Invocation.method(
        #update,
        [
          key,
          update,
        ],
        {#ifAbsent: ifAbsent},
      ));

  @override
  void updateAll(
          dynamic Function(
            String,
            dynamic,
          )? update) =>
      super.noSuchMethod(
        Invocation.method(
          #updateAll,
          [update],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeWhere(
          bool Function(
            String,
            dynamic,
          )? test) =>
      super.noSuchMethod(
        Invocation.method(
          #removeWhere,
          [test],
        ),
        returnValueForMissingStub: null,
      );

  @override
  dynamic putIfAbsent(
    String? key,
    dynamic Function()? ifAbsent,
  ) =>
      super.noSuchMethod(Invocation.method(
        #putIfAbsent,
        [
          key,
          ifAbsent,
        ],
      ));

  @override
  void addAll(Map<String, dynamic>? other) => super.noSuchMethod(
        Invocation.method(
          #addAll,
          [other],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void clear() => super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void forEach(
          void Function(
            String,
            dynamic,
          )? action) =>
      super.noSuchMethod(
        Invocation.method(
          #forEach,
          [action],
        ),
        returnValueForMissingStub: null,
      );
}
