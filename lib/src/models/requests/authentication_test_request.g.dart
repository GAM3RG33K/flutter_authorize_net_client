// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_test_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationTestRequest _$AuthenticationTestRequestFromJson(
    Map<String, dynamic> json) {
  return AuthenticationTestRequest(
    json['merchantAuthentication'] == null
        ? null
        : MerchantAuthentication.fromJson(
            json['merchantAuthentication'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthenticationTestRequestToJson(
        AuthenticationTestRequest instance) =>
    <String, dynamic>{
      'merchantAuthentication': instance.merchantAuthentication?.toJson(),
    };
