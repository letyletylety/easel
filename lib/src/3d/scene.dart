import 'package:vector_math/vector_math_64.dart';

import '../easel/easel.dart';

/// 3D
/// the set of objects you may be interested in rendering
class Scene {
  Camera camera = Camera();
  late Easel viewport; //= Easel(canvas, size);

  Scene();
}

class Camera extends SceneObject {}

class SceneObject with HasPosition {
  SceneObject() {
    pos = Vector3.zero();
  }
}

mixin HasPosition {
  late Vector3 pos;
}
