import 'dart:math' as math;

import 'package:flame/components.dart';

import 'components/obstacle.dart';

class ObstacleSpawner extends TimerComponent with HasGameReference {
  ObstacleSpawner() : super(period: 1.2, repeat: true);

  final math.Random _random = math.Random();

  @override
  void onTick() {
    final width = math.min(64.0, game.size.x);
    final x = _random.nextDouble() * (game.size.x - width);
    game.add(Obstacle(x: x, width: width));
  }
}
