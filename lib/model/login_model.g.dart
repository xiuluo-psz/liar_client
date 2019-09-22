// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModeFromJson(Map<String, dynamic> json) {
  return LoginModel(
    userId: json['userId'] as String,
    userName: json['userName'] as String,
    phoneNumber: json['phoneNumber'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    image: json['image'] as String,
    version: json['version'] as int,
    accessTime: json['accessTime'] as int,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$LoginModeToJson(LoginModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'password': instance.password,
      'image': instance.image,
      'version': instance.version,
      'accessTime': instance.accessTime,
      'token': instance.token,
    };
