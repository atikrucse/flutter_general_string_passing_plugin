import 'package:flutter_test/flutter_test.dart';
import 'package:test_plugin_gretting_message/test_plugin_gretting_message.dart';
import 'package:test_plugin_gretting_message/test_plugin_gretting_message_platform_interface.dart';
import 'package:test_plugin_gretting_message/test_plugin_gretting_message_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTestPluginGrettingMessagePlatform
    with MockPlatformInterfaceMixin
    implements TestPluginGrettingMessagePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TestPluginGrettingMessagePlatform initialPlatform = TestPluginGrettingMessagePlatform.instance;

  test('$MethodChannelTestPluginGrettingMessage is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTestPluginGrettingMessage>());
  });

  test('getPlatformVersion', () async {
    TestPluginGrettingMessage testPluginGrettingMessagePlugin = TestPluginGrettingMessage();
    MockTestPluginGrettingMessagePlatform fakePlatform = MockTestPluginGrettingMessagePlatform();
    TestPluginGrettingMessagePlatform.instance = fakePlatform;

    expect(await testPluginGrettingMessagePlugin.getPlatformVersion(), '42');
  });
}
