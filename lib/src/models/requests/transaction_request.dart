import 'package:json_annotation/json_annotation.dart';

import '../../utils/utils.dart';
import '../data/additional_charge.dart';
import '../data/address.dart';
import '../data/payment.dart';

part 'transaction_request.g.dart';

@JsonSerializable(explicitToJson: true)
class TransactionRequest {
  static const String TAG_AUTH_CAPTURE_TRANSACTION = 'authCaptureTransaction';
  static const String TAG_AUTH_ONLY_TRANSACTION = 'authOnlyTransaction';
  static const String TAG_CAPTURE_PRE_AUTH_TRANSACTION =
      'priorAuthCaptureTransaction';
  static const String TAG_REFUND_TRANSACTION = 'refundTransaction';
  static const String TAG_VOID_TRANSACTION = 'voidTransaction';

  @JsonKey(name: 'transactionType')
  final String transactionType;
  @JsonKey(name: 'amount')
  final String amount; // int based value
  @JsonKey(name: 'currencyCode')
  final String currencyCode; // ISO-4217, 3 char currency code
  @JsonKey(name: 'payment')
  final Payment payment;
  @JsonKey(name: 'refTransId')
  final String refTransId;
  @JsonKey(name: 'tax')
  final AdditionalCharge tax;
  @JsonKey(name: 'duty')
  final AdditionalCharge duty;
  @JsonKey(name: 'shipping')
  final AdditionalCharge shipping;
  @JsonKey(name: 'billTo')
  final Address billTo;
  @JsonKey(name: 'shipTo')
  final Address shipTo;

  TransactionRequest(
    this.transactionType, {
    this.amount,
    this.currencyCode,
    this.payment,
    this.refTransId,
    this.billTo,
    this.shipTo,
    this.tax,
    this.duty,
    this.shipping,
  });

  factory TransactionRequest.authCaptureTransaction(
    String amount,
    String currencyCode,
    Payment payment, {
    Address billTo,
    Address shipTo,
    AdditionalCharge tax,
    AdditionalCharge duty,
    AdditionalCharge shipping,
  }) {
    return TransactionRequest(
      TAG_AUTH_CAPTURE_TRANSACTION,
      amount: amount,
      currencyCode: currencyCode,
      payment: payment,
      billTo: billTo,
      shipTo: shipTo,
      tax: tax,
      duty: duty,
      shipping: shipping,
    );
  }

  factory TransactionRequest.authOnlyTransaction(
    String amount,
    String currencyCode,
    Payment payment, {
    Address billTo,
    Address shipTo,
    AdditionalCharge tax,
    AdditionalCharge duty,
    AdditionalCharge shipping,
  }) {
    return TransactionRequest(
      TAG_AUTH_ONLY_TRANSACTION,
      amount: amount,
      currencyCode: currencyCode,
      payment: payment,
      billTo: billTo,
      shipTo: shipTo,
      tax: tax,
      duty: duty,
      shipping: shipping,
    );
  }

  factory TransactionRequest.priorAuthCaptureTransaction(
      String amount, String currencyCode, String referenceTransactionID) {
    return TransactionRequest(
      TAG_CAPTURE_PRE_AUTH_TRANSACTION,
      amount: amount,
      currencyCode: currencyCode,
      refTransId: referenceTransactionID,
    );
  }

  factory TransactionRequest.refundTransaction(String amount,
      String currencyCode, Payment payment, String referenceTransactionID) {
    return TransactionRequest(
      TAG_REFUND_TRANSACTION,
      amount: amount,
      currencyCode: currencyCode,
      payment: payment,
      refTransId: referenceTransactionID,
    );
  }

  factory TransactionRequest.voidTransaction(String referenceTransactionID) {
    return TransactionRequest(
      TAG_VOID_TRANSACTION,
      refTransId: referenceTransactionID,
    );
  }

  factory TransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$TransactionRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      removeNullsFromMap(_$TransactionRequestToJson(this));
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
