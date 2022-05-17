import 'package:json_annotation/json_annotation.dart';

import 'entries_model.dart';
part 'public_api_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PublicApiModel {
  PublicApiModel({
    required this.count,
    required this.entries,
  });

  final int count;
  final List<EntryModel> entries;
  factory PublicApiModel.fromJson(Map<String, dynamic> json) => _$PublicApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$PublicApiModelToJson(this);
}
