import 'package:json_annotation/json_annotation.dart';

import '../../utils/utils.dart';
import '../data/response_messages.dart';

part 'authentication_test_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthenticationTestResponse {
  @JsonKey(name: 'messages')
  final ResponseMessages messages;

  AuthenticationTestResponse(this.messages);

  factory AuthenticationTestResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationTestResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      removeNullsFromMap(_$AuthenticationTestResponseToJson(this));

  bool get isSuccessful => verifySuccessCode(messages);
}

/*{
    "messages": {
        "resultCode": "Ok",
        "message": [
            {
                "code": "I00001",
                "text": "Successful."
            }
        ]
    }
}*/
