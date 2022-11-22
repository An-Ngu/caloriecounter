// To parse this JSON data, do
//
//     final fitbitDaily = fitbitDailyFromJson(jsonString);

import 'dart:convert';

FitbitDaily fitbitDailyFromJson(String str) => FitbitDaily.fromJson(json.decode(str));

String fitbitDailyToJson(FitbitDaily data) => json.encode(data.toJson());

class FitbitDaily {
  FitbitDaily({
    required this.activities,
    required this.goals,
    required this.summary,
  });

  List<Activity> activities;
  Goals goals;
  Summary summary;

  factory FitbitDaily.fromJson(Map<String, dynamic> json) => FitbitDaily(
    activities: List<Activity>.from(json["activities"].map((x) => Activity.fromJson(x))),
    goals: Goals.fromJson(json["goals"]),
    summary: Summary.fromJson(json["summary"]),
  );

  Map<String, dynamic> toJson() => {
    "activities": List<dynamic>.from(activities.map((x) => x.toJson())),
    "goals": goals.toJson(),
    "summary": summary.toJson(),
  };
}

class Activity {
  Activity({
    required this.activityId,
    required this.activityParentId,
    required this.activityParentName,
    required this.calories,
    required this.description,
    required this.duration,
    required this.hasActiveZoneMinutes,
    required this.hasStartTime,
    required this.isFavorite,
    required this.lastModified,
    required this.logId,
    required this.name,
    required this.startDate,
    required this.startTime,
    required this.steps,
  });

  int activityId;
  int activityParentId;
  String activityParentName;
  int calories;
  String description;
  int duration;
  bool hasActiveZoneMinutes;
  bool hasStartTime;
  bool isFavorite;
  DateTime lastModified;
  int logId;
  String name;
  DateTime startDate;
  String startTime;
  int steps;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
    activityId: json["activityId"],
    activityParentId: json["activityParentId"],
    activityParentName: json["activityParentName"],
    calories: json["calories"],
    description: json["description"],
    duration: json["duration"],
    hasActiveZoneMinutes: json["hasActiveZoneMinutes"],
    hasStartTime: json["hasStartTime"],
    isFavorite: json["isFavorite"],
    lastModified: DateTime.parse(json["lastModified"]),
    logId: json["logId"],
    name: json["name"],
    startDate: DateTime.parse(json["startDate"]),
    startTime: json["startTime"],
    steps: json["steps"],
  );

  Map<String, dynamic> toJson() => {
    "activityId": activityId,
    "activityParentId": activityParentId,
    "activityParentName": activityParentName,
    "calories": calories,
    "description": description,
    "duration": duration,
    "hasActiveZoneMinutes": hasActiveZoneMinutes,
    "hasStartTime": hasStartTime,
    "isFavorite": isFavorite,
    "lastModified": lastModified.toIso8601String(),
    "logId": logId,
    "name": name,
    "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "startTime": startTime,
    "steps": steps,
  };
}

class Goals {
  Goals({
    required this.activeMinutes,
    required this.caloriesOut,
    required this.distance,
    required this.floors,
    required this.steps,
  });

  int activeMinutes;
  int caloriesOut;
  double distance;
  int floors;
  int steps;

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
    activeMinutes: json["activeMinutes"],
    caloriesOut: json["caloriesOut"],
    distance: json["distance"].toDouble(),
    floors: json["floors"],
    steps: json["steps"],
  );

  Map<String, dynamic> toJson() => {
    "activeMinutes": activeMinutes,
    "caloriesOut": caloriesOut,
    "distance": distance,
    "floors": floors,
    "steps": steps,
  };
}

class Summary {
  Summary({
    required this.activeScore,
    required this.activityCalories,
    required this.caloriesBmr,
    required this.caloriesOut,
    required this.distances,
    required this.elevation,
    required this.fairlyActiveMinutes,
    required this.floors,
    required this.lightlyActiveMinutes,
    required this.marginalCalories,
    required this.sedentaryMinutes,
    required this.steps,
    required this.veryActiveMinutes,
  });

  int activeScore;
  int activityCalories;
  int caloriesBmr;
  int caloriesOut;
  List<Distance> distances;
  double elevation;
  int fairlyActiveMinutes;
  int floors;
  int lightlyActiveMinutes;
  int marginalCalories;
  int sedentaryMinutes;
  int steps;
  int veryActiveMinutes;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    activeScore: json["activeScore"],
    activityCalories: json["activityCalories"],
    caloriesBmr: json["caloriesBMR"],
    caloriesOut: json["caloriesOut"],
    distances: List<Distance>.from(json["distances"].map((x) => Distance.fromJson(x))),
    elevation: json["elevation"].toDouble(),
    fairlyActiveMinutes: json["fairlyActiveMinutes"],
    floors: json["floors"],
    lightlyActiveMinutes: json["lightlyActiveMinutes"],
    marginalCalories: json["marginalCalories"],
    sedentaryMinutes: json["sedentaryMinutes"],
    steps: json["steps"],
    veryActiveMinutes: json["veryActiveMinutes"],
  );

  Map<String, dynamic> toJson() => {
    "activeScore": activeScore,
    "activityCalories": activityCalories,
    "caloriesBMR": caloriesBmr,
    "caloriesOut": caloriesOut,
    "distances": List<dynamic>.from(distances.map((x) => x.toJson())),
    "elevation": elevation,
    "fairlyActiveMinutes": fairlyActiveMinutes,
    "floors": floors,
    "lightlyActiveMinutes": lightlyActiveMinutes,
    "marginalCalories": marginalCalories,
    "sedentaryMinutes": sedentaryMinutes,
    "steps": steps,
    "veryActiveMinutes": veryActiveMinutes,
  };
}

class Distance {
  Distance({
    required this.activity,
    required this.distance,
  });

  String activity;
  double distance;

  factory Distance.fromJson(Map<String, dynamic> json) => Distance(
    activity: json["activity"],
    distance: json["distance"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "activity": activity,
    "distance": distance,
  };
}
