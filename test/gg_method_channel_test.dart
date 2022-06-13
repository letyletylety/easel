import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gg/gg_method_channel.dart';

void main() {
  MethodChannelGg platform = MethodChannelGg();
  const MethodChannel channel = MethodChannel('gg');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
