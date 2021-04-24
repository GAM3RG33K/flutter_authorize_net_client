// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseMessage _$ResponseMessageFromJson(Map<String, dynamic> json) {
  return ResponseMessage(
    json['code'] as String,
    json['text'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$ResponseMessageToJson(ResponseMessage instance) =>
    <String, dynamic>{
      'code': instance.code,
      'text': instance.text,
      'description': instance.description,
    };
