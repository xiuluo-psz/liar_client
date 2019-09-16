import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class Login {
  String userId;
  String userName;
  String phoneNumber;
  String email;
  String password;
  String image;
  int version;
  int accessToken;
  String token;

  Login({
    this.userId,
    this.userName,
    this.phoneNumber,
    this.email,
    this.password,
    this.image,
    this.version,
    this.accessToken,
    this.token,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);

  Login.empty();
}
