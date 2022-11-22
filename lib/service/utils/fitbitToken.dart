// To parse this JSON data, do
//
//     final fitbitToken = fitbitTokenFromJson(jsonString);

import 'dart:convert';

FitbitToken fitbitTokenFromJson(String str) => FitbitToken.fromJson(json.decode(str));

String fitbitTokenToJson(FitbitToken data) => json.encode(data.toJson());

class FitbitToken {

  FitbitToken({
    this.accessToken,
    this.expiresIn,
    this.refreshToken,
    this.scope,
    this.tokenType,
    this.userId,

  });

  String? accessToken;
  int? expiresIn;
  String?refreshToken;
  String? scope;
  String? tokenType;
  String? userId;
  String? _authorization;
  String? _content_type;

  String get authorization => _authorization!;

  set authorization(String value) {
    _authorization = value;
  }

  String? _user_id;
  String? _encoded_code;

  factory FitbitToken.fromJson(Map<String, dynamic> json) => FitbitToken(
    accessToken: json["access_token"],
    expiresIn: json["expires_in"],
    refreshToken: json["refresh_token"],
    scope: json["scope"],
    tokenType: json["token_type"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "expires_in": expiresIn,
    "refresh_token": refreshToken,
    "scope": scope,
    "token_type": tokenType,
    "user_id": userId,
  };

  String get content_type => _content_type!;

  set content_type(String value) {
    _content_type = value;
  }

  String get user_id => _user_id!;

  set user_id(String value) {
    _user_id = value;
  }

  String get encoded_code => _encoded_code!;

  set encoded_code(String value) {
    _encoded_code = value;
  }

}
