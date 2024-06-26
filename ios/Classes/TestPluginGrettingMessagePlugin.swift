import Flutter
import UIKit

public class TestPluginGrettingMessagePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "gretting_messgae_plugin", binaryMessenger: registrar.messenger())
    let instance = TestPluginGrettingMessagePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "sendString" {
      if let inputString = call.arguments as? String {
        let modifiedString = "\(inputString) \n [Replay from iOS Swift]"
        result(modifiedString)
      } else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "Input was not a string", details: nil))
      }
    } else {
      result(FlutterMethodNotImplemented)
    }
  }
}
