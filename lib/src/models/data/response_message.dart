import 'package:json_annotation/json_annotation.dart';

import '../../utils/utils.dart';

part 'response_message.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseMessage {
  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'text')
  final String text;
  @JsonKey(name: 'description')
  final String description;

  ResponseMessage(this.code, this.text, this.description);

  factory ResponseMessage.fromJson(Map<String, dynamic> json) =>
      _$ResponseMessageFromJson(json);

  Map<String, dynamic> toJson() =>
      removeNullsFromMap(_$ResponseMessageToJson(this));
}

/* {
                "code": "1",
                "description": "This transaction has been approved."
            }*/
