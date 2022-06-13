import 'package:flutter_test/flutter_test.dart';
import 'package:gg/gg.dart';
import 'package:gg/gg_platform_interface.dart';
import 'package:gg/gg_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGgPlatform 
    with MockPlatformInterfaceMixin
    implements GgPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final GgPlatform initialPlatform = GgPlatform.instance;

  test('$MethodChannelGg is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGg>());
  });

  test('getPlatformVersion', () async {
    Gg ggPlugin = Gg();
    MockGgPlatform fakePlatform = MockGgPlatform();
    GgPlatform.instance = fakePlatform;
  
    expect(await ggPlugin.getPlatformVersion(), '42');
  });
}
