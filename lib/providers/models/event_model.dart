import 'dart:convert';

class EventModel {
  final String eventName;
  final String? eventDesc;

  final String eventDateTime;
  // final String? eventType;
  final String createdBy;
  final bool isCompleted;
  final String? mob;
  final String eventId;

  EventModel(
      {required this.eventName,
      required this.eventDateTime,
      this.eventDesc,
      // this.eventType,
      this.isCompleted = false,
      this.mob,
      required this.eventId,
      required this.createdBy});

  EventModel copyWith({
    String? eventName,
    String? eventDateTime,
    String? eventType,
    bool? isCompleted,
  }) =>
      EventModel(
          eventName: eventName ?? this.eventName,
          eventDateTime: eventDateTime ?? this.eventDateTime,
          eventDesc: eventDesc,
          // eventType: eventType ?? this.eventType,
          isCompleted: isCompleted ?? this.isCompleted,
          eventId: eventId,
          createdBy: createdBy);

  factory EventModel.fromRawJson(String str) =>
      EventModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
      eventName: json["eventName"],
      eventDateTime: json["eventDateTime"],
      // eventType: json["eventType"],
      isCompleted: json["isCompleted"],
      mob: json["mob"],
      eventDesc: json["eventDesc"],
      eventId: json["eventId"],
      createdBy: json["createdBy"]);

  Map<String, dynamic> toJson() => {
        "eventName": eventName,
        "eventDateTime": eventDateTime,
        // "eventType": eventType,
        "isCompleted": isCompleted,
        "createdBy": createdBy,
        "mob": mob,
        "eventId": eventId,
        "eventDesc": eventDesc
      };
}
