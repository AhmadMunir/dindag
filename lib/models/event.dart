import 'models.dart';

class Event {
  Event({
    this.id,
    this.title,
    this.descriptions,
    this.eventStarted,
    this.eventEnded,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.user,
  });

  final String? id;
  final String? title;
  final String? descriptions;
  final DateTime? eventStarted;
  final DateTime? eventEnded;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final User? user;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        descriptions:
            json["descriptions"] == null ? null : json["descriptions"],
        eventStarted: json["event_started"] == null
            ? null
            : DateTime.parse(json["event_started"]),
        eventEnded: json["event_ended"] == null
            ? null
            : DateTime.parse(json["event_ended"]),
        userId: json["user_id"] == null ? null : json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "descriptions": descriptions == null ? null : descriptions,
        "event_started": eventStarted == null
            ? null
            : "${eventStarted!.year.toString().padLeft(4, '0')}-${eventStarted!.month.toString().padLeft(2, '0')}-${eventStarted!.day.toString().padLeft(2, '0')}",
        "event_ended": eventEnded == null
            ? null
            : "${eventEnded!.year.toString().padLeft(4, '0')}-${eventEnded!.month.toString().padLeft(2, '0')}-${eventEnded!.day.toString().padLeft(2, '0')}",
        "user_id": userId == null ? null : userId,
      };
}
