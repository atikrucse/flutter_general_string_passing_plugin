import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'test_plugin_gretting_message_platform_interface.dart';

/// An implementation of [TestPluginGrettingMessagePlatform] that uses method channels.
class MethodChannelTestPluginGrettingMessage extends TestPluginGrettingMessagePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('test_plugin_gretting_message');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
