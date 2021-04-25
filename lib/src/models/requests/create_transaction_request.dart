import 'package:json_annotation/json_annotation.dart';

import '../../utils/utils.dart';
import '../data/merchant_authentication.dart';
import 'transaction_request.dart';

part 'create_transaction_request.g.dart';

/// A model that represents the general implementation of Transaction request
/// for the api
///
/// This model wraps the actual transaction details for the api & also contains
/// the merchant details & custom referenceID, if provided by the client
///
@JsonSerializable(explicitToJson: true)
class CreateTransactionRequest {
  static const String Tag = 'createTransactionRequest';

  @JsonKey(name: 'merchantAuthentication')
  final MerchantAuthentication merchantAuthentication;

  @JsonKey(name: 'refId')
  final String referenceID;

  @JsonKey(name: 'transactionRequest')
  final TransactionRequest transactionRequest;

  CreateTransactionRequest(
    this.merchantAuthentication, {
    this.referenceID,
    this.transactionRequest,
  });

  Map<String, dynamic> toJson() =>
      removeNullsFromMap(_$CreateTransactionRequestToJson(this));

  factory CreateTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionRequestFromJson(json);

  Map<String, dynamic> getRequestJson() {
    return {
      CreateTransactionRequest.Tag: toJson(),
    };
  }
}
