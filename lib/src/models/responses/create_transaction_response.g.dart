// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTransactionResponse _$CreateTransactionResponseFromJson(
    Map<String, dynamic> json) {
  return CreateTransactionResponse(
    json['transactionResponse'] == null
        ? null
        : TransactionResponse.fromJson(
            json['transactionResponse'] as Map<String, dynamic>),
    json['messages'] == null
        ? null
        : ResponseMessages.fromJson(json['messages'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateTransactionResponseToJson(
        CreateTransactionResponse instance) =>
    <String, dynamic>{
      'transactionResponse': instance.transactionResponse?.toJson(),
      'messages': instance.messages?.toJson(),
    };
