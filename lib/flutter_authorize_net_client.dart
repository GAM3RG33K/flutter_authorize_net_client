library flutter_authorize_net_client;

import 'dart:convert';

import 'src/models/models.dart';
import 'src/utils/network_utils.dart';
import 'src/utils/utils.dart';

/// Class that represents AuthorizeNet Client
///
/// This class provides an interface to interact with Authorize.net
/// API with ease
///
/// The requests & responses are converted to a models based interaction, instead
/// of plain json which is the input & output of the API
///
/// Supported Operations:
/// - Testing Authentication of the client using credentials
/// - Charge a credit card
/// - Create an authorized payment for future transaction
/// - execute pre-authorized payment transaction
/// - void an existing authorized transaction
///
///
/// Note: This class implements Singleton pattern, i.e only one instance of the
/// AuthorizeNetClient will be created for whole app
class AuthorizeNetClient {
  /// String value that represent Production environment
  static const ENV_PRODUCTION = 'production';

  /// String value that represent testing environment
  static const ENV_TEST = 'sandbox';

  /// String value which represents current environment of the client
  final String environment;

  /// String value which represents merchant name(API ID) of the client
  final String merchantName;

  /// String value which represents transaction key(API SECRET) of the client
  final String transactionKey;

  /// Internal constructor
  AuthorizeNetClient._(
    this.merchantName,
    this.transactionKey,
    this.environment,
  );

  /// static instance to implement singleton pattern
  static AuthorizeNetClient _instance;

  /// factory method to check & instantiate AuthorizeNetClient instance only once
  factory AuthorizeNetClient(
    String merchantName,
    String transactionKey, {
    String environment = ENV_TEST,
  }) {
    if (_instance == null) {
      _instance = AuthorizeNetClient._(
        merchantName,
        transactionKey,
        environment,
      );
    }
    return _instance;
  }

  /// Getter for api url, value is based on the current type of [environment]
  String get baseApi => environment == ENV_PRODUCTION
      ? 'https://api.authorize.net/xml/v1/request.api'
      : 'https://apitest.authorize.net/xml/v1/request.api';

  /// A getter to facilitate instantiating a [MerchantAuthentication] object
  /// when needed
  MerchantAuthentication get merchantAuthentication =>
      MerchantAuthentication(merchantName, transactionKey);

  /// -------- API Methods -------- ///

  /// Method to test current configuration of the client using provided
  /// credentials & environment
  ///
  /// Response of this method is useful to know if the current configuration
  /// is working properly or not
  ///
  /// If not then it will provide some error information to resolve the issue
  ///
  /// https://developer.authorize.net/api/reference/index.html#gettingstarted-section-section-header
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

  /// A Method to execute a transaction using the provided credit card details
  ///
  /// This method will use the provide card data, i.e. [cardNumber], [expirationDate] & [cardCode]
  /// & [amount], [currencyCode] to create a transaction request that will charge the
  /// given credit card the provided [amount]
  ///
  ///
  /// An optional [referenceID] can be provided to track & verify the transactions
  ///
  /// **Note**:
  ///  Make sure that the provided amount includes all tax, shipping, duty etc charges
  ///
  /// Reference: https://developer.authorize.net/api/reference/index.html#gettingstarted-section-section-header
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

  /// A Method to Pre-Authorize a transaction to execute in future
  ///
  /// This method will use the provide card data, i.e. [cardNumber], [expirationDate] & [cardCode]
  /// & [amount], [currencyCode] to create a transaction request that will generate
  /// a transactionID value that can be used in future to execute a transaction.
  ///
  /// An optional [referenceID] can be provided to track & verify the transactions
  ///
  /// Reference: https://developer.authorize.net/api/reference/index.html#payment-transactions-authorize-a-credit-card
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

  /// A Method to execute Pre-Authorized transaction
  ///
  ///
  /// This method will use the provide transaction data, i.e. [amount], [currencyCode]
  /// & [referenceTransactionID] to execute a pre-authorized transaction request that will charge the
  /// credit card used for pre-authorization
  ///
  /// An optional [referenceID] can be provided to track & verify the transactions
  ///
  /// Reference: https://developer.authorize.net/api/reference/index.html#payment-transactions-capture-funds-authorized-through-another-channel
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

  /// A Method to Void/Discard a Pre-Authorized transaction
  ///
  ///
  /// This method will void a pre-authorization transaction using the  [referenceTransactionID]
  ///
  /// After the transaction is void, it can not be used to charge the credit card used
  /// for the pre-authorization.
  ///
  /// A new transaction must happen in order to charge the credit card.
  ///
  /// An optional [referenceID] can be provided to track & verify the transactions
  ///
  /// Reference: https://developer.authorize.net/api/reference/index.html#payment-transactions-void-a-transaction
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
