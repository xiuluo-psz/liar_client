// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'net_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetResult _$NetResultFromJson(Map<String, dynamic> json) {
  return NetResult(
    code: json['code'] as String,
    data: json['data'] as Map<String, dynamic>,
    msg: json['msg'] as String,
  );
}

Map<String, dynamic> _$NetResultToJson(NetResult instance) => <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg,
    };
