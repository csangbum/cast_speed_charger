import 'package:flutter/services.dart';

class RebootPlugin {
  static const MethodChannel _channel = MethodChannel('reboot_plugin');

  static Future<void> reboot() async {
    try {
      await _channel.invokeMethod('reboot');
    } catch (e) {
      print('Failed to reboot: $e');
    }
  }
}