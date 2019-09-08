import 'package:json_annotation/json_annotation.dart';

part 'net_result.g.dart';

@JsonSerializable()
class NetResult {
  String code;
  Map<String, dynamic> data;
  String msg;

  NetResult({
    this.code,
    this.data,
    this.msg,
  });

  factory NetResult.fromJson(Map<String, dynamic> json) =>
      _$NetResultFromJson(json);

  Map<String, dynamic> toJson() => _$NetResultToJson(this);

  NetResult.empty();
}
