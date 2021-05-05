import 'package:flutter_authorize_net_client/src/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/utils.dart';
import '../data/error_message.dart';
import '../data/response_message.dart';

part 'transaction_response.g.dart';

/// A model to represent structure of the transaction details of the [CreateTransactionResponse]
///
/// It contains many important data like, [responseCode], [authCode], [transId],
/// [refTransID], etc.
///
/// [messages] contains a list of messages to describe the issues or transaction details
/// [errors] contains a list of error messages to describe the errors that occurred during
/// the execution of the request
@JsonSerializable(explicitToJson: true)
class TransactionResponse {
  @JsonKey(name: 'responseCode')
  final String responseCode;
  @JsonKey(name: 'authCode')
  final String authCode;
  @JsonKey(name: 'avsResultCode')
  final String avsResultCode;
  @JsonKey(name: 'cvvResultCode')
  final String cvvResultCode;
  @JsonKey(name: 'cavvResultCode')
  final String cavvResultCode;
  @JsonKey(name: 'transId')
  final String transId;
  @JsonKey(name: 'refTransID')
  final String refTransID;
  @JsonKey(name: 'transHash')
  final String transHash;
  @JsonKey(name: 'testRequest')
  final String testRequest;
  @JsonKey(name: 'accountNumber')
  final String accountNumber;
  @JsonKey(name: 'accountType')
  final String accountType;
  @JsonKey(name: 'messages')
  List<ResponseMessage> messages;
  @JsonKey(name: 'errors')
  List<ErrorMessage> errors;
  @JsonKey(name: 'transHashSha2')
  final String transHashSha2;
  @JsonKey(name: 'SupplementalDataQualificationIndicator')
  final int supplementalDataQualificationIndicator;

  TransactionResponse(
      this.responseCode,
      this.authCode,
      this.avsResultCode,
      this.cvvResultCode,
      this.cavvResultCode,
      this.transId,
      this.refTransID,
      this.transHash,
      this.testRequest,
      this.accountNumber,
      this.accountType,
      this.messages,
      this.transHashSha2,
      this.supplementalDataQualificationIndicator);

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      removeNullsFromMap(_$TransactionResponseToJson(this));
}

/*{
"transactionType": "authCaptureTransaction",
"amount": "5",
"payment": {
    "creditCard": {
        "cardNumber": "5424000000000015",
        "expirationDate": "2020-12",
        "cardCode": "999"
    }
},
"lineItems": {
    "lineItem": {
        "itemId": "1",
        "name": "vase",
        "description": "Cannes logo",
        "quantity": "18",
        "unitPrice": "45.00"
    }
},
"tax": {
    "amount": "4.26",
    "name": "level2 tax name",
    "description": "level2 tax"
},
"duty": {
    "amount": "8.55",
    "name": "duty name",
    "description": "duty description"
},
"shipping": {
    "amount": "4.26",
    "name": "level2 tax name",
    "description": "level2 tax"
},
"poNumber": "456654",
"customer": {
    "id": "99999456654"
},
"billTo": {
    "firstName": "Ellen",
    "lastName": "Johnson",
    "company": "Souveniropolis",
    "address": "14 Main Street",
    "city": "Pecan Springs",
    "state": "TX",
    "zip": "44628",
    "country": "US"
},
"shipTo": {
    "firstName": "China",
    "lastName": "Bayles",
    "company": "Thyme for Tea",
    "address": "12 Main Street",
    "city": "Pecan Springs",
    "state": "TX",
    "zip": "44628",
    "country": "US"
},
"customerIP": "192.168.1.1",
"transactionSettings": {
    "setting": {
        "settingName": "testRequest",
        "settingValue": "false"
    }
},
"userFields": {
    "userField": [
        {
            "name": "MerchantDefinedFieldName1",
            "value": "MerchantDefinedFieldValue1"
        },
        {
            "name": "favorite_color",
            "value": "blue"
        }
    ]
}*/
