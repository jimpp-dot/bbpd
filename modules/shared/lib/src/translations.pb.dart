///
//  Generated code. Do not modify.
//  source: translations.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core';

import 'package:protobuf/protobuf.dart';

class Translations extends GeneratedMessage {
  static final BuilderInfo _i = BuilderInfo(
      const bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Translations',
      package: const PackageName(
          const bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'version')
    ..m<String, String>(2,
        const bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'texts',
        entryClassName: 'Translations.TextsEntry',
        keyFieldType: PbFieldType.OS,
        valueFieldType: PbFieldType.OS,
        packageName: const PackageName('pb'))
    ..m<String, ListValue>(3,
        const bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'array',
        entryClassName: 'Translations.ArrayEntry',
        keyFieldType: PbFieldType.OS,
        valueFieldType: PbFieldType.OM,
        valueCreator: ListValue.create,
        packageName: const PackageName('pb'))
    ..hasRequiredFields = false;

  Translations._() : super();
  factory Translations() => create();
  factory Translations.fromBuffer(List<int> i,
          [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Translations.fromJson(String i,
          [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Translations clone() => Translations()..mergeFromMessage(this);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Translations copyWith(void Function(Translations) updates) =>
      super.copyWith((message) => updates(message as Translations))
          as Translations; // ignore: deprecated_member_use
  BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static Translations create() => Translations._();
  Translations createEmptyInstance() => create();
  static PbList<Translations> createRepeated() => PbList<Translations>();
  @pragma('dart2js:noInline')
  static Translations getDefault() =>
      _defaultInstance ??= GeneratedMessage.$_defaultFor<Translations>(create);
  static Translations? _defaultInstance;

  @TagNumber(1)
  String get version => $_getSZ(0);
  @TagNumber(1)
  set version(String v) {
    $_setString(0, v);
  }

  @TagNumber(1)
  bool hasVersion() => $_has(0);
  @TagNumber(1)
  void clearVersion() => clearField(1);

  @TagNumber(2)
  Map<String, String> get texts => $_getMap(1);

  @TagNumber(3)
  Map<String, ListValue> get array => $_getMap(2);
}

enum Value_Kind { numberValue, stringValue, boolValue, listValue, notSet }

class Value extends GeneratedMessage {
  static const Map<int, Value_Kind> _Value_KindByTag = {
    2: Value_Kind.numberValue,
    3: Value_Kind.stringValue,
    4: Value_Kind.boolValue,
    6: Value_Kind.listValue,
    0: Value_Kind.notSet
  };
  static final BuilderInfo _i = BuilderInfo(
      const bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Value',
      package: const PackageName(
          const bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 6])
    ..a<double>(
        2,
        const bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'numberValue',
        PbFieldType.OD)
    ..aOS(
        3,
        const bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stringValue')
    ..aOB(
        4,
        const bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'boolValue')
    ..aOM<ListValue>(
        6,
        const bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'listValue',
        subBuilder: ListValue.create)
    ..hasRequiredFields = false;

  Value._() : super();
  factory Value() => create();
  factory Value.fromBuffer(List<int> i,
          [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Value.fromJson(String i,
          [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Value clone() => Value()..mergeFromMessage(this);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Value copyWith(void Function(Value) updates) =>
      super.copyWith((message) => updates(message as Value))
          as Value; // ignore: deprecated_member_use
  BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static Value create() => Value._();
  Value createEmptyInstance() => create();
  static PbList<Value> createRepeated() => PbList<Value>();
  @pragma('dart2js:noInline')
  static Value getDefault() =>
      _defaultInstance ??= GeneratedMessage.$_defaultFor<Value>(create);
  static Value? _defaultInstance;

  Value_Kind whichKind() => _Value_KindByTag[$_whichOneof(0)]!;
  void clearKind() => clearField($_whichOneof(0));

  @TagNumber(2)
  double get numberValue => $_getN(0);
  @TagNumber(2)
  set numberValue(double v) {
    $_setDouble(0, v);
  }

  @TagNumber(2)
  bool hasNumberValue() => $_has(0);
  @TagNumber(2)
  void clearNumberValue() => clearField(2);

  @TagNumber(3)
  String get stringValue => $_getSZ(1);
  @TagNumber(3)
  set stringValue(String v) {
    $_setString(1, v);
  }

  @TagNumber(3)
  bool hasStringValue() => $_has(1);
  @TagNumber(3)
  void clearStringValue() => clearField(3);

  @TagNumber(4)
  bool get boolValue => $_getBF(2);
  @TagNumber(4)
  set boolValue(bool v) {
    $_setBool(2, v);
  }

  @TagNumber(4)
  bool hasBoolValue() => $_has(2);
  @TagNumber(4)
  void clearBoolValue() => clearField(4);

  @TagNumber(6)
  ListValue get listValue => $_getN(3);
  @TagNumber(6)
  set listValue(ListValue v) {
    setField(6, v);
  }

  @TagNumber(6)
  bool hasListValue() => $_has(3);
  @TagNumber(6)
  void clearListValue() => clearField(6);
  @TagNumber(6)
  ListValue ensureListValue() => $_ensure(3);
}

class ListValue extends GeneratedMessage {
  static final BuilderInfo _i = BuilderInfo(
      const bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'ListValue',
      package: const PackageName(
          const bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'pb'),
      createEmptyInstance: create)
    ..pc<Value>(
        1,
        const bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'values',
        PbFieldType.PM,
        subBuilder: Value.create)
    ..hasRequiredFields = false;

  ListValue._() : super();
  factory ListValue() => create();
  factory ListValue.fromBuffer(List<int> i,
          [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ListValue.fromJson(String i,
          [ExtensionRegistry r = ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ListValue clone() => ListValue()..mergeFromMessage(this);
  @Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ListValue copyWith(void Function(ListValue) updates) =>
      super.copyWith((message) => updates(message as ListValue))
          as ListValue; // ignore: deprecated_member_use
  BuilderInfo get info_ => _i;
  @pragma('dart2js:noInline')
  static ListValue create() => ListValue._();
  ListValue createEmptyInstance() => create();
  static PbList<ListValue> createRepeated() => PbList<ListValue>();
  @pragma('dart2js:noInline')
  static ListValue getDefault() =>
      _defaultInstance ??= GeneratedMessage.$_defaultFor<ListValue>(create);
  static ListValue? _defaultInstance;

  @TagNumber(1)
  List<Value> get values => $_getList(0);

  List toList() {
    return _parseListValue(this);
  }

  List _parseListValue(ListValue? value) {
    List result = [];
    value?.values.forEach((e) {
      var value;
      switch (e.whichKind()) {
        case Value_Kind.boolValue:
          value = e.boolValue;
          break;
        case Value_Kind.numberValue:
          value = e.numberValue;
          break;
        case Value_Kind.stringValue:
          value = e.stringValue;
          break;
        case Value_Kind.listValue:
          value = _parseListValue(e as ListValue);
          break;
        case Value_Kind.notSet:
          break;
      }

      if (value != null) {
        result.add(value);
      }
    });

    return result;
  }
}
