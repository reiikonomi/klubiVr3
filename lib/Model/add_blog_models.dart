import 'package:json_annotation/json_annotation.dart';

part 'add_blog_models.g.dart';

@JsonSerializable()
class AddBlogModel {
  String coverImage;
  int count;
  int share;
  int comment;
  @JsonKey(name: "_id")
  String id;
  String username;
  String title;
  String body;
  String createdAt;
  // CommentsModel comments;
  //added

  AddBlogModel({
    required this.coverImage,
    required this.count,
    required this.share,
    required this.comment,
    required this.id,
    required this.username,
    required this.body,
    required this.title,
    required this.createdAt,
    // required this.comments,
  });
  factory AddBlogModel.fromJson(Map<String, dynamic> json) =>
      _$AddBlogModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddBlogModelToJson(this);
}

// added
// class CommentsModel {
//   String text;
//   String postedBy;

//   CommentsModel({required this.text, required this.postedBy});

//   factory CommentsModel.fromJson(Map<String, dynamic> json) =>
//       _$CommentsModelFromJson(json);
//   Map<String, dynamic> toJson() => _$CommentsModelToJson(this);
// }

// CommentsModel _$CommentsModelFromJson(Map<String, dynamic> json) {
//   return CommentsModel(
//     text: json['text'] as String,
//     postedBy: json['text'] as String,
//   );
// }

// Map<String, dynamic> _$CommentsModelToJson(CommentsModel instance) =>
//     <String, dynamic>{
//       'text': instance.text,
//       'postedBy': instance.postedBy,
//     };
