import 'package:flutter/material.dart';
import 'package:flutter_authorize_net_client/flutter_authorize_net_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthorizeNetClient _client;
  String _refID;

  @override
  void initState() {
    super.initState();
    _client = AuthorizeNetClient('5KP3u95bQpv', '346HZ32z3fP4hTG2');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              ElevatedButton(
                child: Text('Charge card'),
                onPressed: () async {
                  final response = await _client.chargeCreditCard(
                    '5',
                    'USD'.toLowerCase(),
                    '5424000000000015',
                    '2022-12',
                    '123',
                  );
                  print('response: \n${response.toJson()}');
                },
              ),
              ElevatedButton(
                child: Text('Authorize card payment'),
                onPressed: () async {
                  final response = await _client.authorizeCardPayment(
                    '5',
                    'USD'.toLowerCase(),
                    '5424000000000015',
                    '2022-12',
                    '123',
                  );
                  print('response: \n${response.toJson()}');
                  _refID = response?.transactionResponse?.refTransID;
                },
              ),
              ElevatedButton(
                child: Text('Charge Pre-Authorized payment'),
                onPressed: () async {
                  assert(_refID != null,
                      'Transaction Reference ID should not be null.');
                  final response = await _client.priorAuthCaptureTransaction(
                    '5',
                    'USD'.toLowerCase(),
                    _refID,
                  );
                  print('response: \n${response.toJson()}');
                },
              ),
              // ElevatedButton(
              //   child: Text('Charge Pre-Authorized payment'),
              //   onPressed: () async {
              //     assert(_refID != null, 'Transaction Reference ID should not be null.');
              //     final response = await _client.priorAuthCaptureTransaction(
              //       '5',
              //       'USD'.toLowerCase(),
              //       _refID,
              //     );
              //     print('response: \n${response.toJson()}');
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
