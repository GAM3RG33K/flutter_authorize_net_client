// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTransactionRequest _$CreateTransactionRequestFromJson(
    Map<String, dynamic> json) {
  return CreateTransactionRequest(
    json['merchantAuthentication'] == null
        ? null
        : MerchantAuthentication.fromJson(
            json['merchantAuthentication'] as Map<String, dynamic>),
    json['transactionRequest'] == null
        ? null
        : TransactionRequest.fromJson(
            json['transactionRequest'] as Map<String, dynamic>),
    referenceID: json['refId'] as String,
  );
}

Map<String, dynamic> _$CreateTransactionRequestToJson(
        CreateTransactionRequest instance) =>
    <String, dynamic>{
      'merchantAuthentication': instance.merchantAuthentication?.toJson(),
      'transactionRequest': instance.transactionRequest?.toJson(),
      'refId': instance.referenceID,
    };
