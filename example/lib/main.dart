import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:test_plugin_gretting_message/test_plugin_gretting_message.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _response = '';
  TextEditingController _inputStringController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _sendString() async {
    String inputString = '${_inputStringController.text} ';
    String? response;
    try {
      response = await TestPluginGrettingMessage.sendString(inputString);
    } on PlatformException {
      response = 'Failed to get response.';
    }

    if (!mounted) return;

    setState(() {
      _response = response ?? 'No response';
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('General String Passing'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _inputStringController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Text',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _sendString,
                child: const Text('Send String'),
              ),
              const SizedBox(height: 30,),
              const Text('Response from plugin', style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('$_response\n', style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
