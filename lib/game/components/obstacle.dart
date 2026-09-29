import 'dart:ui';

import 'package:flame/components.dart';

class Obstacle extends RectangleComponent with HasGameReference {
  Obstacle({required double x, required double width})
    : super(
        position: Vector2(x, -30),
        size: Vector2(width, 30),
        paint: Paint()..color = const Color(0xFFFF7043),
      );

  static const double speed = 180;

  @override
  void update(double dt) {
    super.update(dt);
    position.y += speed * dt;

    if (position.y > game.size.y) {
      removeFromParent();
    }
  }
}
