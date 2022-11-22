// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

FitbitData dataFromJson(String str) => FitbitData.fromJson(json.decode(str));
List<FitbitData> dataFromJson1(String str) => List<FitbitData>.from(json.decode(str));

String dataToJson(FitbitData data) => json.encode(data.toJson());

class FitbitData {
  FitbitData({
    required this.activities,
    required this.pagination,
  });

  List<Activity> activities;
  Pagination pagination;

  factory FitbitData.fromJson(Map<String, dynamic> json) => FitbitData(
    activities: List<Activity>.from(json["activities"].map((x) => Activity.fromJson(x))),
    pagination: Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "activities": List<dynamic>.from(activities.map((x) => x.toJson())),
    "pagination": pagination.toJson(),
  };
}

class Activity {
  Activity({
    this.activeDuration,
    this.activeZoneMinutes,
    this.activityLevel,
    this.activityName,
    this.activityTypeId,
    required this.calories,
    this.caloriesLink,
    this.duration,
    this.elevationGain,
    this.hasActiveZoneMinutes,
    this.lastModified,
    this.logId,
    this.logType,
    this.manualValuesSpecified,
    this.originalDuration,
    this.originalStartTime,
    this.startTime,
    required this.steps,
    this.tcxLink,
  });

  int? activeDuration;
  ActiveZoneMinutes? activeZoneMinutes;
  List<ActivityLevel>? activityLevel;
  String? activityName;
  int? activityTypeId;
  int calories;
  String? caloriesLink;
  int? duration;
  double? elevationGain;
  bool? hasActiveZoneMinutes;
  DateTime? lastModified;
  int? logId;
  String? logType;
  ManualValuesSpecified? manualValuesSpecified;
  int? originalDuration;
  DateTime? originalStartTime;
  DateTime? startTime;
  int steps;
  String? tcxLink;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
    activeDuration: json["activeDuration"],
    activeZoneMinutes: ActiveZoneMinutes.fromJson(json["activeZoneMinutes"]),
    activityLevel: List<ActivityLevel>.from(json["activityLevel"].map((x) => ActivityLevel.fromJson(x))),
    activityName: json["activityName"],
    activityTypeId: json["activityTypeId"],
    calories: json["calories"],
    caloriesLink: json["caloriesLink"],
    duration: json["duration"],
    elevationGain: json["elevationGain"].toDouble(),
    hasActiveZoneMinutes: json["hasActiveZoneMinutes"],
    lastModified: DateTime.parse(json["lastModified"]),
    logId: json["logId"],
    logType: json["logType"],
    manualValuesSpecified: ManualValuesSpecified.fromJson(json["manualValuesSpecified"]),
    originalDuration: json["originalDuration"],
    originalStartTime: DateTime.parse(json["originalStartTime"]),
    startTime: DateTime.parse(json["startTime"]),
    steps: json["steps"],
    tcxLink: json["tcxLink"],
  );

  Map<String, dynamic> toJson() => {
    "activeDuration": activeDuration,
    "activeZoneMinutes": activeZoneMinutes!.toJson(),
    "activityLevel": List<dynamic>.from(activityLevel!.map((x) => x.toJson())),
    "activityName": activityName,
    "activityTypeId": activityTypeId,
    "calories": calories,
    "caloriesLink": caloriesLink,
    "duration": duration,
    "elevationGain": elevationGain,
    "hasActiveZoneMinutes": hasActiveZoneMinutes,
    "lastModified": lastModified!.toIso8601String(),
    "logId": logId,
    "logType": logType,
    "manualValuesSpecified": manualValuesSpecified!.toJson(),
    "originalDuration": originalDuration,
    "originalStartTime": originalStartTime!.toIso8601String(),
    "startTime": startTime!.toIso8601String(),
    "steps": steps,
    "tcxLink": tcxLink,
  };

  @override
  String toString() {
    return 'Activity{activeDuration: $activeDuration, activeZoneMinutes: $activeZoneMinutes, activityLevel: $activityLevel, activityName: $activityName, activityTypeId: $activityTypeId, calories: $calories, caloriesLink: $caloriesLink, duration: $duration, elevationGain: $elevationGain, hasActiveZoneMinutes: $hasActiveZoneMinutes, lastModified: $lastModified, logId: $logId, logType: $logType, manualValuesSpecified: $manualValuesSpecified, originalDuration: $originalDuration, originalStartTime: $originalStartTime, startTime: $startTime, steps: $steps, tcxLink: $tcxLink}';
  }
}

class ActiveZoneMinutes {
  ActiveZoneMinutes({
    this.minutesInHeartRateZones,
    this.totalMinutes,
  });

  List<MinutesInHeartRateZone>? minutesInHeartRateZones;
  int? totalMinutes;

  factory ActiveZoneMinutes.fromJson(Map<String, dynamic> json) => ActiveZoneMinutes(
    minutesInHeartRateZones: List<MinutesInHeartRateZone>.from(json["minutesInHeartRateZones"].map((x) => MinutesInHeartRateZone.fromJson(x))),
    totalMinutes: json["totalMinutes"],
  );

  Map<String, dynamic> toJson() => {
    "minutesInHeartRateZones": List<dynamic>.from(minutesInHeartRateZones!.map((x) => x.toJson())),
    "totalMinutes": totalMinutes,
  };
}

class MinutesInHeartRateZone {
  MinutesInHeartRateZone({
    this.minuteMultiplier,
    this.minutes,
    this.order,
    this.type,
    this.zoneName,
  });

  int? minuteMultiplier;
  int? minutes;
  int? order;
  String? type;
  String? zoneName;

  factory MinutesInHeartRateZone.fromJson(Map<String, dynamic> json) => MinutesInHeartRateZone(
    minuteMultiplier: json["minuteMultiplier"],
    minutes: json["minutes"],
    order: json["order"],
    type: json["type"],
    zoneName: json["zoneName"],
  );

  Map<String, dynamic> toJson() => {
    "minuteMultiplier": minuteMultiplier,
    "minutes": minutes,
    "order": order,
    "type": type,
    "zoneName": zoneName,
  };
}

class ActivityLevel {
  ActivityLevel({
    this.minutes,
    this.name,
  });

  int? minutes;
  String? name;

  factory ActivityLevel.fromJson(Map<String, dynamic> json) => ActivityLevel(
    minutes: json["minutes"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "minutes": minutes,
    "name": name,
  };
}

class ManualValuesSpecified {
  ManualValuesSpecified({
    this.calories,
    this.distance,
    this.steps,
  });

  bool? calories;
  bool? distance;
  bool? steps;

  factory ManualValuesSpecified.fromJson(Map<String, dynamic> json) => ManualValuesSpecified(
    calories: json["calories"],
    distance: json["distance"],
    steps: json["steps"],
  );

  Map<String, dynamic> toJson() => {
    "calories": calories,
    "distance": distance,
    "steps": steps,
  };
}

class Pagination {
  Pagination({
    required this.afterDate,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.sort,
  });

  DateTime afterDate;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  String? sort;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    afterDate: DateTime.parse(json["afterDate"]),
    limit: json["limit"],
    next: json["next"],
    offset: json["offset"],
    previous: json["previous"],
    sort: json["sort"],
  );

  Map<String, dynamic> toJson() => {
    "afterDate": "${afterDate.year.toString().padLeft(4, '0')}-${afterDate.month.toString().padLeft(2, '0')}-${afterDate.day.toString().padLeft(2, '0')}",
    "limit": limit,
    "next": next,
    "offset": offset,
    "previous": previous,
    "sort": sort,
  };

  @override
  String toString() {
    return 'Pagination{afterDate: $afterDate, limit: $limit, next: $next, offset: $offset, previous: $previous, sort: $sort}';
  }
}
