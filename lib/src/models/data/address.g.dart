// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    json['firstName'] as String,
    json['lastName'] as String,
    json['company'] as String,
    json['address'] as String,
    json['city'] as String,
    json['state'] as String,
    json['zip'] as String,
    json['country'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'company': instance.company,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'zip': instance.zip,
      'country': instance.country,
    };
