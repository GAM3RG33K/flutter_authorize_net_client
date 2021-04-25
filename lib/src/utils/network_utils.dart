import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

/// A simple method to execute the request to api & fetch a response
Future<String> executeRequest(String url, Map<String, dynamic> json) async {
  final response = await http.post(
    Uri.parse(url),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
    body: jsonEncode(json),
  );

  if (response.statusCode == HttpStatus.ok) {
    return response.body;
  }

  return null;
}
