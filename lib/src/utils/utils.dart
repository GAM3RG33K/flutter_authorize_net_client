import '../models/models.dart';

Map<T, R> removeNullsFromMap<T, R>(Map<T, R> map) {
  if (map == null || map.isEmpty) return null;
  map..removeWhere((key, value) => value == null);
  return map;
}

bool verifyTransactionSuccess(CreateTransactionResponse response) {
  final resultCode = response?.messages?.resultCode;
  final errorMessages = response?.transactionResponse?.errors;

  return (errorMessages == null || errorMessages.isEmpty) &&
      resultCode == ResponseMessages.STATUS_OK;
}

bool verifySuccessCode(ResponseMessages messages) {
  final resultCode = messages?.resultCode;
  return resultCode == ResponseMessages.STATUS_OK;
}

String get uniqueReferenceID => '${DateTime.now().millisecondsSinceEpoch}';
