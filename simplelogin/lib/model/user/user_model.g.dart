// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['Id'] as String?,
    firstName: json['FirstName'] as String?,
    lastName: json['LastName'] as String?,
    fullName: json['FullName'] as String?,
    email: json['Email'] as String?,
    birthDate: json['BirthDate'] == null
        ? null
        : DateTime.parse(json['BirthDate'] as String),
    profilePhoto: json['ProfilePhoto'] as String?,
    friendIds:
        (json['FriendIds'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'Id': instance.id,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'FullName': instance.fullName,
      'Email': instance.email,
      'BirthDate': instance.birthDate?.toIso8601String(),
      'ProfilePhoto': instance.profilePhoto,
      'FriendIds': instance.friendIds,
    };
