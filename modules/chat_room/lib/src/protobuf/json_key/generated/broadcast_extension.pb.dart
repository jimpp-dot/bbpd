///
//  Generated code. Do not modify.
//  source: broadcast_extension.proto
//

// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Broadcast_extension {
  static final registerName = $pb.Extension<$core.String>(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'google.protobuf.MessageOptions',
      const $core.bool.fromEnvironment('protobuf.omit_field_names')
          ? ''
          : 'registerName',
      2001,
      $pb.PbFieldType.OS);
  static final registerId = $pb.Extension<$core.int>(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'google.protobuf.MessageOptions',
      const $core.bool.fromEnvironment('protobuf.omit_field_names')
          ? ''
          : 'registerId',
      2002,
      $pb.PbFieldType.OU3);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(registerName);
    registry.add(registerId);
  }
}
