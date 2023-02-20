import 'package:flame/collisions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'box_stack.dart';
import 'ground.dart';
import 'player.dart';
import 'sky.dart';

class FlappyEmberGame extends FlameGame
    with HasCollisionDetection, TapDetector {
  FlappyEmberGame();

  double speed = 200;
  late final Player _player;

  @override
  Future<void> onLoad() async {
    // Add your components here
    add(_player = Player());
    add(Sky());
    //add(Ground());
    add(ScreenHitbox());
  }

  @override
  void onTap() {
    _player.fly();
  }

  double _timeSinceBox = 0;
  double _boxInterval = 1.3;

  @override
  void update(double dt) {
    super.update(dt);
    _timeSinceBox += dt;
    if (_timeSinceBox > _boxInterval) {
      add(BoxStack());
      _timeSinceBox = 0;
    }
  }
}
