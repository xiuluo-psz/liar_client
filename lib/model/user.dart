import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String userId;
  String userName;
  String phoneNumber;
  String email;
  String password;
  String image;
  String version;

  User({
    this.userId,
    this.userName,
    this.phoneNumber,
    this.email,
    this.password,
    this.image,
    this.version,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User.empty();
}
