import '../models/data/response_messages.dart';
import '../models/responses/create_transaction_response.dart';

Map<T, R> removeNullsFromMap<T, R>(Map<T, R> map) {
  if (map == null || map.isEmpty) return null;
  map..removeWhere((key, value) => value == null);
  return map;
}

bool verifySuccessCode(CreateTransactionResponse response) {
  final resultCode = response?.messages?.resultCode;
  final errorMessages = response?.transactionResponse?.errors;

  return (errorMessages == null || errorMessages.isEmpty) &&
      resultCode == ResponseMessages.STATUS_OK;
}

String get uniqueReferenceID => '${DateTime.now().millisecondsSinceEpoch}';
