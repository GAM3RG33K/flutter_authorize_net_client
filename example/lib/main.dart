import 'dart:convert';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: buildListView(),
              ),
              Expanded(
                flex: 3,
                child: buildLogView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListView() {
    return ListView(
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
            addLog(jsonEncode(response.toJson()));
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
            addLog(jsonEncode(response.toJson()));
            _refID = response?.transactionResponse?.transId;
          },
        ),
        ElevatedButton(
          child: Text('Charge Pre-Authorized payment'),
          onPressed: () async {
            assert(
                _refID != null, 'Transaction Reference ID should not be null.');
            final response = await _client.priorAuthCaptureTransaction(
              '5',
              'USD'.toLowerCase(),
              _refID,
            );
            print('response: \n${response.toJson()}');
            addLog(jsonEncode(response.toJson()));
          },
        ),
      ],
    );
  }

  Widget buildLogView() {
    return LogView();
  }
}

void addLog(String logText) {
  _logs.value += '\n\n${DateTime.now()} \n\n$logText \n======';
}

ValueNotifier<String> _logs = ValueNotifier('Initial Log');

class LogView extends StatefulWidget {
  @override
  _LogViewState createState() => _LogViewState();
}

class _LogViewState extends State<LogView> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
        valueListenable: _logs,
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                value,
                softWrap: true,
                textAlign: TextAlign.start,
              ),
            ),
          );
        });
  }
}
