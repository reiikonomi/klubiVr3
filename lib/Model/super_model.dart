
import 'package:klubivr3/Model/add_blog_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'super_model.g.dart';

@JsonSerializable()
class SuperModel {
  List<AddBlogModel> data;
  SuperModel({required this.data});
  factory SuperModel.fromJson(Map<String, dynamic> json) =>
      _$SuperModelFromJson(json);
  Map<String, dynamic> toJson() => _$SuperModelToJson(this);
}