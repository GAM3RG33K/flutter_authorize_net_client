// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) {
  return TransactionResponse(
    json['responseCode'] as String,
    json['authCode'] as String,
    json['avsResultCode'] as String,
    json['cvvResultCode'] as String,
    json['cavvResultCode'] as String,
    json['transId'] as String,
    json['refTransID'] as String,
    json['transHash'] as String,
    json['testRequest'] as String,
    json['accountNumber'] as String,
    json['accountType'] as String,
    (json['messages'] as List)
        ?.map((e) => e == null
            ? null
            : ResponseMessage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['transHashSha2'] as String,
    json['SupplementalDataQualificationIndicator'] as int,
  )..errors = (json['errors'] as List)
      ?.map((e) =>
          e == null ? null : ErrorMessage.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$TransactionResponseToJson(
        TransactionResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'authCode': instance.authCode,
      'avsResultCode': instance.avsResultCode,
      'cvvResultCode': instance.cvvResultCode,
      'cavvResultCode': instance.cavvResultCode,
      'transId': instance.transId,
      'refTransID': instance.refTransID,
      'transHash': instance.transHash,
      'testRequest': instance.testRequest,
      'accountNumber': instance.accountNumber,
      'accountType': instance.accountType,
      'messages': instance.messages?.map((e) => e?.toJson())?.toList(),
      'errors': instance.errors?.map((e) => e?.toJson())?.toList(),
      'transHashSha2': instance.transHashSha2,
      'SupplementalDataQualificationIndicator':
          instance.supplementalDataQualificationIndicator,
    };
