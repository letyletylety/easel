import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'gg_method_channel.dart';

abstract class GgPlatform extends PlatformInterface {
  /// Constructs a GgPlatform.
  GgPlatform() : super(token: _token);

  static final Object _token = Object();

  static GgPlatform _instance = MethodChannelGg();

  /// The default instance of [GgPlatform] to use.
  ///
  /// Defaults to [MethodChannelGg].
  static GgPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GgPlatform] when
  /// they register themselves.
  static set instance(GgPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
