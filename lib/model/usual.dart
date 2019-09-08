import 'package:json_annotation/json_annotation.dart';

part 'usual.g.dart';

@JsonSerializable()
class Usual {

  bool isAd;

  Usual({this.isAd});

  factory Usual.fromJson(Map<String, dynamic> json) => _$UsualFromJson(json);

  Map<String, dynamic> toJson() => _$UsualToJson(this);

  Usual.empty();

}