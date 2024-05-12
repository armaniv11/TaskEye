import 'dart:convert';

class ExpenseModel {
  final String expenseName;
  final double amount;
  final bool isDeleted;
  final bool isCompleted;
  final String createdBy;
  final String? completedAt;
  final String expenseId;
  final String? eventId;
  final String createdAt;
  final String? updatedAt;
  final String expenseNote;
  final String? category;

  ExpenseModel(
      {required this.expenseName,
      required this.amount,
      this.isDeleted = false,
      this.isCompleted = false,
      required this.createdBy,
      this.completedAt,
      required this.expenseId,
      this.eventId,
      required this.createdAt,
      this.updatedAt,
      required this.expenseNote,
      this.category = "OTHER"});

  ExpenseModel copyWith({
    String? expenseName,
    double? amount,
    bool? isDeleted,
    bool? isCompleted,
    String? createdBy,
    String? completedAt,
    String? expenseId,
    String? eventId,
    String? createdAt,
    String? updatedAt,
    String? expenseNote,
  }) =>
      ExpenseModel(
        expenseName: expenseName ?? this.expenseName,
        amount: amount ?? this.amount,
        isDeleted: isDeleted ?? this.isDeleted,
        isCompleted: isCompleted ?? this.isCompleted,
        createdBy: createdBy ?? this.createdBy,
        completedAt: completedAt ?? this.completedAt,
        expenseId: expenseId ?? this.expenseId,
        eventId: eventId ?? this.eventId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        expenseNote: expenseNote ?? this.expenseNote,
      );

  factory ExpenseModel.fromRawJson(String str) =>
      ExpenseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
      expenseName: json["expenseName"],
      amount: json["amount"],
      isDeleted: json["isDeleted"],
      isCompleted: json["isCompleted"],
      createdBy: json["createdBy"],
      completedAt: json["completedAt"],
      expenseId: json["expenseId"],
      eventId: json["eventId"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      expenseNote: json["expenseNote"],
      category: json["category"]);

  Map<String, dynamic> toJson() => {
        "expenseName": expenseName,
        "amount": amount,
        "isDeleted": isDeleted,
        "isCompleted": isCompleted,
        "createdBy": createdBy,
        "completedAt": completedAt,
        "expenseId": expenseId,
        "eventId": eventId,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "expenseNote": expenseNote,
        "category": category
      };
}
