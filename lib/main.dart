import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  // final channel = WebSocketChannel.connect(
  //   Uri.parse('wss://ws-feed.pro.coinbase.com'),
  // );

  // print(WebSocketChannel.connect(
  //   Uri.parse('wss://ws-feed.pro.coinbase.com'),
  // ));

  // channel.sink.add('eldiiar');

  // channel.stream.listen(
  //   (data) {
  //     print('data $data');
  //   },
  //   onError: (error) => print('error $error'),
  // );

  runApp(MyApp(settingsController: settingsController));
}
