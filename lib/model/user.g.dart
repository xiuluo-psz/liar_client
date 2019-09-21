// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    userId: json['userId'] as String,
    userName: json['userName'] as String,
    phoneNumber: json['phoneNumber'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    image: json['image'] as String,
    version: json['version'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'password': instance.password,
      'image': instance.image,
      'version': instance.version,
    };
