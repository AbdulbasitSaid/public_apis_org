import 'package:json_annotation/json_annotation.dart';

part 'entries_model.g.dart';

@JsonSerializable(explicitToJson: true)
class EntryModel {
  EntryModel({
    required this.api,
    required this.description,
    required this.auth,
    required this.https,
    required this.cors,
    required this.link,
    required this.category,
  });

  final String? api;
  final String? description;
  final String? auth;
  final bool? https;
  final String? cors;
  final String? link;
  final String? category;
  factory EntryModel.fromJson(Map<String, dynamic> json) =>
      _$EntryModelFromJson(json);
  Map<String, dynamic> toJson() => _$EntryModelToJson(this);

  @override
  String toString() {
    return 'EntryModel(api: $api, description: $description, auth: $auth, https: $https, cors: $cors, link: $link, category: $category)';
  }
}
