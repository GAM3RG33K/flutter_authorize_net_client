// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorMessage _$ErrorMessageFromJson(Map<String, dynamic> json) {
  return ErrorMessage(
    json['errorCode'] as String,
    json['errorText'] as String,
  );
}

Map<String, dynamic> _$ErrorMessageToJson(ErrorMessage instance) =>
    <String, dynamic>{
      'errorCode': instance.code,
      'errorText': instance.text,
    };
