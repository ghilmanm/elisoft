// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.name,
    this.email,
    this.phoneNumber,
    this.created,
    this.uuid,
  });

  String? name;
  String? email;
  String? phoneNumber;
  Created? created;
  String? uuid;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        created: Created.fromJson(json["created"]),
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "created": created?.toJson(),
        "uuid": uuid,
      };
}

class Created {
  Created({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  DateTime? date;
  int? timezoneType;
  String? timezone;

  factory Created.fromJson(Map<String, dynamic> json) => Created(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}
