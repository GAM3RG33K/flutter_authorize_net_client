// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionRequest _$TransactionRequestFromJson(Map<String, dynamic> json) {
  return TransactionRequest(
    json['transactionType'] as String,
    amount: json['amount'] as String,
    currencyCode: json['currencyCode'] as String,
    payment: json['payment'] == null
        ? null
        : Payment.fromJson(json['payment'] as Map<String, dynamic>),
    refTransId: json['refTransId'] as String,
    billTo: json['billTo'] == null
        ? null
        : Address.fromJson(json['billTo'] as Map<String, dynamic>),
    shipTo: json['shipTo'] == null
        ? null
        : Address.fromJson(json['shipTo'] as Map<String, dynamic>),
    tax: json['tax'] == null
        ? null
        : AdditionalCharge.fromJson(json['tax'] as Map<String, dynamic>),
    duty: json['duty'] == null
        ? null
        : AdditionalCharge.fromJson(json['duty'] as Map<String, dynamic>),
    shipping: json['shipping'] == null
        ? null
        : AdditionalCharge.fromJson(json['shipping'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TransactionRequestToJson(TransactionRequest instance) =>
    <String, dynamic>{
      'transactionType': instance.transactionType,
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
      'payment': instance.payment?.toJson(),
      'refTransId': instance.refTransId,
      'tax': instance.tax?.toJson(),
      'duty': instance.duty?.toJson(),
      'shipping': instance.shipping?.toJson(),
      'billTo': instance.billTo?.toJson(),
      'shipTo': instance.shipTo?.toJson(),
    };
