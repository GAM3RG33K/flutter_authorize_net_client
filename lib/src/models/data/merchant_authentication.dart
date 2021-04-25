import 'package:json_annotation/json_annotation.dart';

import '../../utils/utils.dart';

part 'merchant_authentication.g.dart';

/// A model to represent merchant authentication details,
/// i.e. merchant name (API ID) & transactionKey (API SECRET)
@JsonSerializable(explicitToJson: true)
class MerchantAuthentication {
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'transactionKey')
  final String transactionKey;

  MerchantAuthentication(this.name, this.transactionKey);

  Map<String, dynamic> toJson() =>
      removeNullsFromMap(_$MerchantAuthenticationToJson(this));

  factory MerchantAuthentication.fromJson(Map<String, dynamic> json) =>
      _$MerchantAuthenticationFromJson(json);
}

/*
{
    "name": "639jDcH2jcM",
    "transactionKey": "4nhHy32y86RGY44R"
}*/
