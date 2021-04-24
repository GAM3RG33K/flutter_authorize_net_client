import 'package:json_annotation/json_annotation.dart';

import '../../utils/utils.dart';
import 'response_message.dart';

part 'response_messages.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseMessages {
  static const String STATUS_OK = 'Ok';

  @JsonKey(name: 'resultCode')
  final String resultCode;
  @JsonKey(name: 'message')
  final List<ResponseMessage> message;

  ResponseMessages(this.resultCode, this.message);

  factory ResponseMessages.fromJson(Map<String, dynamic> json) =>
      _$ResponseMessagesFromJson(json);

  Map<String, dynamic> toJson() =>
      removeNullsFromMap(_$ResponseMessagesToJson(this));
}

/*{
        "resultCode": "Ok",
        "message": [
            {
                "code": "I00001",
                "text": "Successful."
            }
        ]
    }*/
