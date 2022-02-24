
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ProfileModel {
  String name;
  String username;
  // ignore: non_constant_identifier_names
  String DOB;
  String about;
  ProfileModel(
      // ignore: non_constant_identifier_names
      {  required this.DOB,
        required this.about,
        required this.name,
        required this.username});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}



ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    DOB: json['DOB'] as String,
    about: json['about'] as String,
    name: json['name'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'DOB': instance.DOB,
      'about': instance.about,
    };
