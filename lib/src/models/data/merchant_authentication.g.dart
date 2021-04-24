// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantAuthentication _$MerchantAuthenticationFromJson(
    Map<String, dynamic> json) {
  return MerchantAuthentication(
    json['name'] as String,
    json['transactionKey'] as String,
  );
}

Map<String, dynamic> _$MerchantAuthenticationToJson(
        MerchantAuthentication instance) =>
    <String, dynamic>{
      'name': instance.name,
      'transactionKey': instance.transactionKey,
    };
