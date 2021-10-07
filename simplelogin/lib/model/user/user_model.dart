import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel with Store {
  @JsonKey(name: "Id")
  String? id;

  @JsonKey(name: "FirstName")
  String? firstName;

  @JsonKey(name: "LastName")
  String? lastName;

  @JsonKey(name: "FullName")
  String? fullName;

  @JsonKey(name: "Email")
  String? email;

  @JsonKey(name: "BirthDate")
  DateTime? birthDate;

  @JsonKey(name: "ProfilePhoto")
  String? profilePhoto;

  @JsonKey(name: "FriendIds")
  List<String>? friendIds;
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.birthDate,
    this.profilePhoto,
    this.friendIds,
  });

  factory UserModel.fromJson(var json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}
