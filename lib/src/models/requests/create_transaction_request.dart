import 'package:json_annotation/json_annotation.dart';

import '../../utils/utils.dart';
import '../data/merchant_authentication.dart';
import 'transaction_request.dart';

part 'create_transaction_request.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateTransactionRequest {
  static const String Tag = 'createTransactionRequest';

  @JsonKey(name: 'merchantAuthentication')
  final MerchantAuthentication merchantAuthentication;

  @JsonKey(name: 'transactionRequest')
  final TransactionRequest transactionRequest;

  @JsonKey(name: 'refId')
  final String referenceID;

  CreateTransactionRequest(
    this.merchantAuthentication,
    this.transactionRequest, {
    this.referenceID,
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
