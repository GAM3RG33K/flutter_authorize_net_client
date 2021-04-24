// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_test_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationTestResponse _$AuthenticationTestResponseFromJson(
    Map<String, dynamic> json) {
  return AuthenticationTestResponse(
    json['messages'] == null
        ? null
        : ResponseMessages.fromJson(json['messages'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthenticationTestResponseToJson(
        AuthenticationTestResponse instance) =>
    <String, dynamic>{
      'messages': instance.messages?.toJson(),
    };
