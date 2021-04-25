import 'package:json_annotation/json_annotation.dart';

import '../../utils/utils.dart';

part 'error_message.g.dart';

/// A model to represent an error message provided by the api
@JsonSerializable(explicitToJson: true)
class ErrorMessage {
  @JsonKey(name: 'errorCode')
  final String code;
  @JsonKey(name: 'errorText')
  final String text;

  ErrorMessage(this.code, this.text);

  factory ErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$ErrorMessageFromJson(json);

  Map<String, dynamic> toJson() =>
      removeNullsFromMap(_$ErrorMessageToJson(this));
}

/* {
                "errorCode": "8",
                "errorText": "The credit card has expired."
            }*/
