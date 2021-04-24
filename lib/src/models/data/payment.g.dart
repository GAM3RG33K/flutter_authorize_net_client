// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return Payment(
    creditCard: json['creditCard'] == null
        ? null
        : CreditCard.fromJson(json['creditCard'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'creditCard': instance.creditCard?.toJson(),
    };
