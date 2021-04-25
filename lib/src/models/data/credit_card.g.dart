// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCard _$CreditCardFromJson(Map<String, dynamic> json) {
  return CreditCard(
    cardNumber: json['cardNumber'] as String,
    expirationDate: json['expirationDate'] as String,
    cardCode: json['cardCode'] as String,
  );
}

Map<String, dynamic> _$CreditCardToJson(CreditCard instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'expirationDate': instance.expirationDate,
      'cardCode': instance.cardCode,
    };
