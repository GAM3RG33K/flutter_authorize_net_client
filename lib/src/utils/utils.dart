import '../models/models.dart';

/// Method to remove the entries with null values to prevent any conflict in api process
Map<T, R> removeNullsFromMap<T, R>(Map<T, R> map) {
  if (map == null || map.isEmpty) return null;
  map..removeWhere((key, value) => value == null);
  return map;
}

/// Method to verify if the provided response contains success message or not
bool verifyTransactionSuccess(CreateTransactionResponse response) {
  final errorMessages = response?.transactionResponse?.errors;

  return (errorMessages == null || errorMessages.isEmpty) &&
      verifySuccessCode(response?.messages);
}

/// Method to verify if the provided message contains success code  or not
bool verifySuccessCode(ResponseMessages messages) {
  final resultCode = messages?.resultCode;
  return resultCode == ResponseMessages.STATUS_OK;
}

/// A getter to generate a unique reference ID based on the current date time value
String get uniqueReferenceID => '${DateTime.now().millisecondsSinceEpoch}';
