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
    referenceID: json['refId'] as String,
    transactionRequest: json['transactionRequest'] == null
        ? null
        : TransactionRequest.fromJson(
            json['transactionRequest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateTransactionRequestToJson(
        CreateTransactionRequest instance) =>
    <String, dynamic>{
      'merchantAuthentication': instance.merchantAuthentication?.toJson(),
      'refId': instance.referenceID,
      'transactionRequest': instance.transactionRequest?.toJson(),
    };
