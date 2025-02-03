// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.7.1.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ffi' as ffi;
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_io.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  @protected
  String dco_decode_String(dynamic raw);

  @protected
  bool dco_decode_bool(dynamic raw);

  @protected
  int dco_decode_box_autoadd_i_32(dynamic raw);

  @protected
  DeleteRunResult dco_decode_delete_run_result(dynamic raw);

  @protected
  double dco_decode_f_64(dynamic raw);

  @protected
  int dco_decode_i_32(dynamic raw);

  @protected
  PlatformInt64 dco_decode_i_64(dynamic raw);

  @protected
  InitializeParserOutcome dco_decode_initialize_parser_outcome(dynamic raw);

  @protected
  LegBreakModel dco_decode_leg_break_model(dynamic raw);

  @protected
  LegPositionEnum dco_decode_leg_position_enum(dynamic raw);

  @protected
  List<LegBreakModel> dco_decode_list_leg_break_model(dynamic raw);

  @protected
  List<PhaseModel> dco_decode_list_phase_model(dynamic raw);

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw);

  @protected
  List<ShieldChangeModel> dco_decode_list_shield_change_model(dynamic raw);

  @protected
  List<SquadMemberModel> dco_decode_list_squad_member_model(dynamic raw);

  @protected
  String? dco_decode_opt_String(dynamic raw);

  @protected
  int? dco_decode_opt_box_autoadd_i_32(dynamic raw);

  @protected
  PhaseModel dco_decode_phase_model(dynamic raw);

  @protected
  RunModel dco_decode_run_model(dynamic raw);

  @protected
  ShieldChangeModel dco_decode_shield_change_model(dynamic raw);

  @protected
  SquadMemberModel dco_decode_squad_member_model(dynamic raw);

  @protected
  StatusEffectEnum dco_decode_status_effect_enum(dynamic raw);

  @protected
  TotalTimesModel dco_decode_total_times_model(dynamic raw);

  @protected
  int dco_decode_u_8(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  String sse_decode_String(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  int sse_decode_box_autoadd_i_32(SseDeserializer deserializer);

  @protected
  DeleteRunResult sse_decode_delete_run_result(SseDeserializer deserializer);

  @protected
  double sse_decode_f_64(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  PlatformInt64 sse_decode_i_64(SseDeserializer deserializer);

  @protected
  InitializeParserOutcome sse_decode_initialize_parser_outcome(
      SseDeserializer deserializer);

  @protected
  LegBreakModel sse_decode_leg_break_model(SseDeserializer deserializer);

  @protected
  LegPositionEnum sse_decode_leg_position_enum(SseDeserializer deserializer);

  @protected
  List<LegBreakModel> sse_decode_list_leg_break_model(
      SseDeserializer deserializer);

  @protected
  List<PhaseModel> sse_decode_list_phase_model(SseDeserializer deserializer);

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer);

  @protected
  List<ShieldChangeModel> sse_decode_list_shield_change_model(
      SseDeserializer deserializer);

  @protected
  List<SquadMemberModel> sse_decode_list_squad_member_model(
      SseDeserializer deserializer);

  @protected
  String? sse_decode_opt_String(SseDeserializer deserializer);

  @protected
  int? sse_decode_opt_box_autoadd_i_32(SseDeserializer deserializer);

  @protected
  PhaseModel sse_decode_phase_model(SseDeserializer deserializer);

  @protected
  RunModel sse_decode_run_model(SseDeserializer deserializer);

  @protected
  ShieldChangeModel sse_decode_shield_change_model(
      SseDeserializer deserializer);

  @protected
  SquadMemberModel sse_decode_squad_member_model(SseDeserializer deserializer);

  @protected
  StatusEffectEnum sse_decode_status_effect_enum(SseDeserializer deserializer);

  @protected
  TotalTimesModel sse_decode_total_times_model(SseDeserializer deserializer);

  @protected
  int sse_decode_u_8(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  void sse_encode_String(String self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_i_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_delete_run_result(
      DeleteRunResult self, SseSerializer serializer);

  @protected
  void sse_encode_f_64(double self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_i_64(PlatformInt64 self, SseSerializer serializer);

  @protected
  void sse_encode_initialize_parser_outcome(
      InitializeParserOutcome self, SseSerializer serializer);

  @protected
  void sse_encode_leg_break_model(LegBreakModel self, SseSerializer serializer);

  @protected
  void sse_encode_leg_position_enum(
      LegPositionEnum self, SseSerializer serializer);

  @protected
  void sse_encode_list_leg_break_model(
      List<LegBreakModel> self, SseSerializer serializer);

  @protected
  void sse_encode_list_phase_model(
      List<PhaseModel> self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer);

  @protected
  void sse_encode_list_shield_change_model(
      List<ShieldChangeModel> self, SseSerializer serializer);

  @protected
  void sse_encode_list_squad_member_model(
      List<SquadMemberModel> self, SseSerializer serializer);

  @protected
  void sse_encode_opt_String(String? self, SseSerializer serializer);

  @protected
  void sse_encode_opt_box_autoadd_i_32(int? self, SseSerializer serializer);

  @protected
  void sse_encode_phase_model(PhaseModel self, SseSerializer serializer);

  @protected
  void sse_encode_run_model(RunModel self, SseSerializer serializer);

  @protected
  void sse_encode_shield_change_model(
      ShieldChangeModel self, SseSerializer serializer);

  @protected
  void sse_encode_squad_member_model(
      SquadMemberModel self, SseSerializer serializer);

  @protected
  void sse_encode_status_effect_enum(
      StatusEffectEnum self, SseSerializer serializer);

  @protected
  void sse_encode_total_times_model(
      TotalTimesModel self, SseSerializer serializer);

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);
}

// Section: wire_class

class RustLibWire implements BaseWire {
  factory RustLibWire.fromExternalLibrary(ExternalLibrary lib) =>
      RustLibWire(lib.ffiDynamicLibrary);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RustLibWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;
}
