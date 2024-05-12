import 'dart:convert';

class EventCategoryModel {
  final List<String>? categoriesList;

  EventCategoryModel({
    this.categoriesList,
  });

  EventCategoryModel copyWith({
    List<String>? categoriesList,
  }) =>
      EventCategoryModel(
        categoriesList: categoriesList ?? this.categoriesList,
      );

  factory EventCategoryModel.fromRawJson(String str) =>
      EventCategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventCategoryModel.fromJson(Map<String, dynamic> json) =>
      EventCategoryModel(
        categoriesList: List<String>.from(json["categoriesList"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "categoriesList": List<dynamic>.from(categoriesList!.map((x) => x)),
      };
}
