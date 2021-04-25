library flutter_authorize_net_client;

import 'dart:convert';

import 'src/models/data/merchant_authentication.dart';
import 'src/models/data/payment.dart';
import 'src/models/requests/authentication_test_request.dart';
import 'src/models/requests/create_transaction_request.dart';
import 'src/models/requests/transaction_request.dart';
import 'src/models/responses/authentication_test_response.dart';
import 'src/models/responses/create_transaction_response.dart';
import 'src/utils/network_utils.dart';
import 'src/utils/utils.dart';

class AuthorizeNetClient {
  static const ENV_PRODUCTION = 'production';
  static const ENV_TEST = 'sandbox';

  final String environment;
  final String merchantName;
  final String transactionKey;

  AuthorizeNetClient(
    this.merchantName,
    this.transactionKey, {
    this.environment = ENV_TEST,
  });

  get baseApi => environment == ENV_PRODUCTION
      ? 'https://api.authorize.net/xml/v1/request.api'
      : 'https://apitest.authorize.net/xml/v1/request.api';

  MerchantAuthentication get merchantAuthentication =>
      MerchantAuthentication(merchantName, transactionKey);

  Future<AuthenticationTestResponse> authenticationTest() async {
    final authenticationTestRequest =
        AuthenticationTestRequest(merchantAuthentication);

    var responseJson = await executeRequest(
      baseApi,
      authenticationTestRequest.getRequestJson(),
    );
    print('responseJson: ' + responseJson);
    final response =
        AuthenticationTestResponse.fromJson(jsonDecode(responseJson));
    return response;
  }

  Future<CreateTransactionResponse> chargeCreditCard(
    String amount,
    String currencyCode,
    String cardNumber,
    String expirationDate,
    String cardCode, {
    String referenceID,
  }) async {
    final transactionRequest = TransactionRequest.authCaptureTransaction(amount,
        currencyCode, Payment.creditCard(cardNumber, expirationDate, cardCode));
    final createTransactionRequest = CreateTransactionRequest(
      merchantAuthentication,
      referenceID: referenceID ?? uniqueReferenceID,
      transactionRequest: transactionRequest,
    );

    var responseJson = await executeRequest(
      baseApi,
      createTransactionRequest.getRequestJson(),
    );
    print('responseJson: ' + responseJson);
    final response =
        CreateTransactionResponse.fromJson(jsonDecode(responseJson));
    return response;
  }

  Future<CreateTransactionResponse> authorizeCardPayment(
    String amount,
    String currencyCode,
    String cardNumber,
    String expirationDate,
    String cardCode, {
    String referenceID,
  }) async {
    final transactionRequest = TransactionRequest.authOnlyTransaction(amount,
        currencyCode, Payment.creditCard(cardNumber, expirationDate, cardCode));
    final createTransactionRequest = CreateTransactionRequest(
      merchantAuthentication,
      referenceID: referenceID ?? uniqueReferenceID,
      transactionRequest: transactionRequest,
    );

    var responseJson = await executeRequest(
      baseApi,
      createTransactionRequest.getRequestJson(),
    );
    print('responseJson: ' + responseJson);
    final response =
        CreateTransactionResponse.fromJson(jsonDecode(responseJson));
    return response;
  }

  Future<CreateTransactionResponse> priorAuthCaptureTransaction(
    String amount,
    String currencyCode,
    String referenceTransactionID, {
    String referenceID,
  }) async {
    final transactionRequest = TransactionRequest.priorAuthCaptureTransaction(
      amount,
      currencyCode,
      referenceTransactionID,
    );
    final createTransactionRequest = CreateTransactionRequest(
      merchantAuthentication,
      referenceID: referenceID ?? uniqueReferenceID,
      transactionRequest: transactionRequest,
    );

    var responseJson = await executeRequest(
      baseApi,
      createTransactionRequest.getRequestJson(),
    );
    print('responseJson: ' + responseJson);
    final response =
        CreateTransactionResponse.fromJson(jsonDecode(responseJson));
    return response;
  }

  Future<CreateTransactionResponse> refundTransaction(
    String amount,
    String currencyCode,
    String cardNumber,
    String expirationDate,
    String cardCode,
    String referenceTransactionID, {
    String referenceID,
  }) async {
    final transactionRequest = TransactionRequest.refundTransaction(
      amount,
      currencyCode,
      Payment.creditCard(
        cardNumber,
        expirationDate,
        cardCode,
      ),
      referenceTransactionID,
    );
    final createTransactionRequest = CreateTransactionRequest(
      merchantAuthentication,
      referenceID: referenceID ?? uniqueReferenceID,
      transactionRequest: transactionRequest,
    );

    var responseJson = await executeRequest(
      baseApi,
      createTransactionRequest.getRequestJson(),
    );
    print('responseJson: ' + responseJson);
    final response =
        CreateTransactionResponse.fromJson(jsonDecode(responseJson));
    return response;
  }

  Future<CreateTransactionResponse> voidTransaction(
    String referenceTransactionID, {
    String referenceID,
  }) async {
    final transactionRequest = TransactionRequest.voidTransaction(
      referenceTransactionID,
    );
    final createTransactionRequest = CreateTransactionRequest(
      merchantAuthentication,
      referenceID: referenceID ?? uniqueReferenceID,
      transactionRequest: transactionRequest,
    );

    var responseJson = await executeRequest(
      baseApi,
      createTransactionRequest.getRequestJson(),
    );
    print('responseJson: ' + responseJson);
    final response =
        CreateTransactionResponse.fromJson(jsonDecode(responseJson));
    return response;
  }
}
