import 'dart:convert';

class TodoModel {
  String todoName;
  bool? isDeleted;
  bool? isCompleted;
  String createdBy;
  String? completedAt;
  String? eventId;
  String todoId;
  String? createdAt;
  String? updatedAt;
  String? category;
  String? reminderTime;

  TodoModel(
      {required this.todoName,
      this.isDeleted = false,
      this.isCompleted = false,
      required this.createdBy,
      this.completedAt,
      this.eventId,
      this.createdAt,
      this.updatedAt,
      required this.todoId,
      this.reminderTime,
      this.category});

  TodoModel copyWith(
          {String? todoName,
          bool? isDeleted,
          bool? isCompleted,
          String? createdBy,
          String? completedAt,
          String? eventId,
          String? createdAt,
          String? updatedAt,
          String? todoId,
          String? category,
          String? reminderTime}) =>
      TodoModel(
          todoName: todoName ?? this.todoName,
          isDeleted: isDeleted ?? this.isDeleted,
          isCompleted: isCompleted ?? this.isCompleted,
          createdBy: createdBy ?? this.createdBy,
          completedAt: completedAt ?? this.completedAt,
          eventId: eventId ?? this.eventId,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          todoId: todoId ?? this.todoId,
          category: category ?? this.category,
          reminderTime: reminderTime ?? this.reminderTime);

  factory TodoModel.fromRawJson(String str) =>
      TodoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
      todoName: json["todoName"],
      isDeleted: json["isDeleted"],
      isCompleted: json["isCompleted"],
      createdBy: json["createdBy"],
      completedAt: json["completedAt"],
      eventId: json["eventId"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      todoId: json["todoId"],
      category: json["category"],
      reminderTime: json["reminderTime"]);

  Map<String, dynamic> toJson() => {
        "todoName": todoName,
        "isDeleted": isDeleted,
        "isCompleted": isCompleted,
        "createdBy": createdBy,
        "completedAt": completedAt,
        "eventId": eventId,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "todoId": todoId,
        "category": category,
        "reminderTime": reminderTime
      };
}
