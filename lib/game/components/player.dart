import 'dart:math' as math;
import 'dart:ui';

import 'package:flame/components.dart';

class Player extends RectangleComponent {
  Player()
    : super(
        size: Vector2.all(40),
        paint: Paint()..color = const Color(0xFF42A5F5),
      );

  double _screenWidth = 0;

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
