import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/collisions.dart';

import '../runner_game.dart';
import 'obstacle.dart';

class Player extends RectangleComponent
    with HasGameReference<RunnerGame>, CollisionCallbacks {
  Player()
    : super(
        size: Vector2.all(40),
        paint: Paint()..color = const Color(0xFF42A5F5),
      );

  double _screenWidth = 0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await add(RectangleHitbox());
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Obstacle) {
      game.onPlayerHit();
    }
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    this.size.setValues(math.min(40, size.x), math.min(40, size.y));
    if (_screenWidth == 0) {
      position.x = (size.x - width) / 2;
    }
    _screenWidth = size.x;
    position.y = math.max(0, size.y - height - 48);
    moveHorizontally(0);
  }

  void moveHorizontally(double delta) {
    position.x = (position.x + delta).clamp(
      0,
      math.max(0, _screenWidth - width),
    );
  }
}
