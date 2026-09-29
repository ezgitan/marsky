import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'components/player.dart';
import 'obstacle_spawner.dart';

class RunnerGame extends FlameGame with DragCallbacks {
  final Player _player = Player();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await add(_player);
    await add(ObstacleSpawner());
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    _player.moveHorizontally(event.canvasDelta.x);
  }
}
