// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phonenumber: json['phonenumber'] as String,
      company: json['company'] as String,
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phonenumber': instance.phonenumber,
      'company': instance.company,
    };

_$_UserProfileDTO _$$_UserProfileDTOFromJson(Map<String, dynamic> json) =>
    _$_UserProfileDTO(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phonenumber: json['phonenumber'] as String,
      company: json['company'] as String?,
    );

Map<String, dynamic> _$$_UserProfileDTOToJson(_$_UserProfileDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phonenumber': instance.phonenumber,
      'company': instance.company,
    };
