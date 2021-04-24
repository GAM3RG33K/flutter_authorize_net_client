// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_charge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalCharge _$AdditionalChargeFromJson(Map<String, dynamic> json) {
  return AdditionalCharge(
    json['amount'] as String,
    json['name'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$AdditionalChargeToJson(AdditionalCharge instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'name': instance.name,
      'description': instance.description,
    };
