import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'components/player.dart';
import 'obstacle_spawner.dart';

class RunnerGame extends FlameGame with DragCallbacks, HasCollisionDetection {
  final Player _player = Player();
  bool _isGameOver = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await add(_player);
    await add(ObstacleSpawner());
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    if (_isGameOver) return;
    _player.moveHorizontally(event.canvasDelta.x);
  }

  void onPlayerHit() {
    if (_isGameOver) return;
    _isGameOver = true;
    pauseEngine();
  }
}
