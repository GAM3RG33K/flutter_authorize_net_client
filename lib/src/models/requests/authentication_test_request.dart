import 'package:json_annotation/json_annotation.dart';

import '../../utils/utils.dart';
import '../data/merchant_authentication.dart';

part 'authentication_test_request.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthenticationTestRequest {
  static const String Tag = 'authenticateTestRequest';
  @JsonKey(name: 'merchantAuthentication')
  final MerchantAuthentication merchantAuthentication;

  AuthenticationTestRequest(this.merchantAuthentication);

  factory AuthenticationTestRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationTestRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      removeNullsFromMap(_$AuthenticationTestRequestToJson(this));

  Map<String, dynamic> getRequestJson() {
    return {
      AuthenticationTestRequest.Tag: toJson(),
    };
  }
}

/*{
    "merchantAuthentication": {
        "name": "64WQd2w7Nn",
        "transactionKey": "8YUQ737Jgkd4j93u"
        }
    }*/
