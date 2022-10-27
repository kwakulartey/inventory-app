import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  factory UserProfile({
    required String id,
    required String name,
    required String email,
    required String phonenumber,
    required String company,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
class UserProfileDTO with _$UserProfileDTO {
  factory UserProfileDTO({
    required String name,
    required String email,
    required String password,
    required String phonenumber,
    String? company,
  }) = _UserProfileDTO;

  factory UserProfileDTO.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDTOFromJson(json);
}
