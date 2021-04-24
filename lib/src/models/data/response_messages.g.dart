// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseMessages _$ResponseMessagesFromJson(Map<String, dynamic> json) {
  return ResponseMessages(
    json['resultCode'] as String,
    (json['message'] as List)
        ?.map((e) => e == null
            ? null
            : ResponseMessage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseMessagesToJson(ResponseMessages instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'message': instance.message?.map((e) => e?.toJson())?.toList(),
    };
