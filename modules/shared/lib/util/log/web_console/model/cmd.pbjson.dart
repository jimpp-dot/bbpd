///
//  Generated code. Do not modify.
//  source: cmd.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core';
import 'dart:convert';
import 'dart:typed_data';

@Deprecated('Use opDescriptor instead')
const Op$json = const {
  '1': 'Op',
  '2': const [
    const {'1': 'SetLogLevel', '2': 0},
    const {'1': 'SetLogType', '2': 1},
  ],
};

/// Descriptor for `Op`. Decode as a `google.protobuf.EnumDescriptorProto`.
final Uint8List opDescriptor =
    base64Decode('CgJPcBIPCgtTZXRMb2dMZXZlbBAAEg4KClNldExvZ1R5cGUQAQ==');
@Deprecated('Use logLevelDescriptor instead')
const LogLevel$json = const {
  '1': 'LogLevel',
  '2': const [
    const {'1': 'Verbose', '2': 0},
    const {'1': 'Debug', '2': 1},
    const {'1': 'Info', '2': 2},
    const {'1': 'Warning', '2': 3},
    const {'1': 'Error', '2': 4},
    const {'1': 'Wtf', '2': 5},
    const {'1': 'Nothing', '2': 6},
  ],
};

/// Descriptor for `LogLevel`. Decode as a `google.protobuf.EnumDescriptorProto`.
final Uint8List logLevelDescriptor = base64Decode(
    'CghMb2dMZXZlbBILCgdWZXJib3NlEAASCQoFRGVidWcQARIICgRJbmZvEAISCwoHV2FybmluZxADEgkKBUVycm9yEAQSBwoDV3RmEAUSCwoHTm90aGluZxAG');
@Deprecated('Use logTypeDescriptor instead')
const LogType$json = const {
  '1': 'LogType',
  '2': const [
    const {'1': 'Console', '2': 0},
    const {'1': 'Http', '2': 1},
    const {'1': 'RoomSocket', '2': 2},
    const {'1': 'ImSocket', '2': 3},
    const {'1': 'Tracker', '2': 4},
    const {'1': 'ChatSocket', '2': 5},
  ],
};

/// Descriptor for `LogType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final Uint8List logTypeDescriptor = base64Decode(
    'CgdMb2dUeXBlEgsKB0NvbnNvbGUQABIICgRIdHRwEAESDgoKUm9vbVNvY2tldBACEgwKCEltU29ja2V0EAMSCwoHVHJhY2tlchAEEg4KCkNoYXRTb2NrZXQQBQ==');
@Deprecated('Use cmdDescriptor instead')
const Cmd$json = const {
  '1': 'Cmd',
  '2': const [
    const {'1': 'op', '3': 1, '4': 1, '5': 14, '6': '.Op', '10': 'op'},
    const {'1': 'data', '3': 2, '4': 1, '5': 11, '6': '.Data', '10': 'data'},
  ],
};

/// Descriptor for `Cmd`. Decode as a `google.protobuf.DescriptorProto`.
final Uint8List cmdDescriptor = base64Decode(
    'CgNDbWQSEwoCb3AYASABKA4yAy5PcFICb3ASGQoEZGF0YRgCIAEoCzIFLkRhdGFSBGRhdGE=');
@Deprecated('Use dataDescriptor instead')
const Data$json = const {
  '1': 'Data',
  '2': const [
    const {
      '1': 'log_level',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.LogLevel',
      '10': 'logLevel'
    },
    const {
      '1': 'log_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.LogType',
      '10': 'logType'
    },
    const {'1': 'other', '3': 3, '4': 1, '5': 9, '10': 'other'},
  ],
};

/// Descriptor for `Data`. Decode as a `google.protobuf.DescriptorProto`.
final Uint8List dataDescriptor = base64Decode(
    'CgREYXRhEiYKCWxvZ19sZXZlbBgBIAEoDjIJLkxvZ0xldmVsUghsb2dMZXZlbBIjCghsb2dfdHlwZRgCIAEoDjIILkxvZ1R5cGVSB2xvZ1R5cGUSFAoFb3RoZXIYAyABKAlSBW90aGVy');
