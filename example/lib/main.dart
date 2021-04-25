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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            '* = depends on referenceID stored in memory',
            textAlign: TextAlign.start,
            softWrap: true,
            maxLines: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: Text('Test Authenticate Client'),
                onPressed: () async {
                  final response = await _client.authenticationTest();
                  print('response: \n${response.toJson()}');
                  addLog('isSuccessFul: ${response.isSuccessful}');
                  addLog(jsonEncode(response.toJson()));
                },
              ),
              ElevatedButton(
                child: Text('Clear Logs'),
                onPressed: () async {
                  _logs.value = 'Initial Log';
                },
              ),
            ],
          ),
          ElevatedButton(
            child: Text('1. Charge card'),
            onPressed: () async {
              final response = await _client.chargeCreditCard(
                '5',
                'USD'.toLowerCase(),
                '5424000000000015',
                '2022-12',
                '123',
              );
              print('response: \n${response.toJson()}');
              addLog('isSuccessFul: ${response.isSuccessful}');
              addLog(jsonEncode(response.toJson()));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: Text('2.1 Authorize payment *'),
                onPressed: () async {
                  final response = await _client.authorizeCardPayment(
                    '5',
                    'USD'.toLowerCase(),
                    '5424000000000015',
                    '2022-12',
                    '123',
                  );
                  print('response: \n${response.toJson()}');
                  addLog('isSuccessFul: ${response.isSuccessful}');
                  addLog(jsonEncode(response.toJson()));
                  _refID = response?.transactionResponse?.transId;
                },
              ),
              ElevatedButton(
                child: Text('2.2 Charge Pre-Authorized payment *'),
                onPressed: () async {
                  assert(_refID != null,
                  'Transaction Reference ID should not be null.');
                  final response = await _client.priorAuthCaptureTransaction(
                    '5',
                    'USD'.toLowerCase(),
                    _refID,
                  );
                  print('response: \n${response.toJson()}');
                  addLog('isSuccessFul: ${response.isSuccessful}');
                  addLog(jsonEncode(response.toJson()));
                },
              ),
            ],
          ),
          ElevatedButton(
            child: Text('3. Void Payment *'),
            onPressed: () async {
              assert(_refID != null,
              'Transaction Reference ID should not be null.');
              final response = await _client.voidTransaction(_refID);
              print('response: \n${response.toJson()}');
              addLog('isSuccessFul: ${response.isSuccessful}');
              addLog(jsonEncode(response.toJson()));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: Text('Print reference ID *'),
                onPressed: () async {
                  addLog('Reference ID: $_refID');
                },
              ),
              ElevatedButton(
                child: Text('Clear local reference ID *'),
                onPressed: () async {
                  _refID = null;
                  addLog('Reference ID cleared');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLogView() {
    return LogView();
  }
}

void addLog(String logText) {
  _logs.value = '\n${DateTime.now()}:\n\n$logText\n======\n${_logs.value}\n';
}

ValueNotifier<String> _logs = ValueNotifier('Initial Log');

class LogView extends StatefulWidget {
  @override
  _LogViewState createState() => _LogViewState();
}

class _LogViewState extends State<LogView> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    // _logs.addListener(() {
    //   print('_LogViewState: initState: _logs.addListener: --------------------->');
    //   _controller.animateTo(_controller.position.maxScrollExtent,
    //       duration: Duration(milliseconds: 500), curve: Curves.ease);
    // });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
        valueListenable: _logs,
        builder: (context, value, child) {
          return SingleChildScrollView(
            controller: _controller,
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
