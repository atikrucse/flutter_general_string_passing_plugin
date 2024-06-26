import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_plugin_gretting_message/test_plugin_gretting_message_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelTestPluginGrettingMessage platform = MethodChannelTestPluginGrettingMessage();
  const MethodChannel channel = MethodChannel('test_plugin_gretting_message');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
