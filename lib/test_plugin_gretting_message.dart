
import 'package:flutter/services.dart';
import 'test_plugin_gretting_message_platform_interface.dart';

class TestPluginGrettingMessage {
  static const MethodChannel _channel = MethodChannel('gretting_messgae_plugin');

  static Future<String?> sendString(String input) async {
    final String? result = await _channel.invokeMethod('sendString', input);
    return result;
  }
}
