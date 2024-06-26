import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'test_plugin_gretting_message_method_channel.dart';

abstract class TestPluginGrettingMessagePlatform extends PlatformInterface {
  /// Constructs a TestPluginGrettingMessagePlatform.
  TestPluginGrettingMessagePlatform() : super(token: _token);

  static final Object _token = Object();

  static TestPluginGrettingMessagePlatform _instance = MethodChannelTestPluginGrettingMessage();

  /// The default instance of [TestPluginGrettingMessagePlatform] to use.
  ///
  /// Defaults to [MethodChannelTestPluginGrettingMessage].
  static TestPluginGrettingMessagePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TestPluginGrettingMessagePlatform] when
  /// they register themselves.
  static set instance(TestPluginGrettingMessagePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
