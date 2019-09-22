import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  String userId;
  String userName;
  String phoneNumber;
  String email;
  String password;
  String image;
  int version;
  int accessTime;
  String token;

  LoginModel({
    this.userId,
    this.userName,
    this.phoneNumber,
    this.email,
    this.password,
    this.image,
    this.version,
    this.accessTime,
    this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModeFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModeToJson(this);

  LoginModel.empty();
}
