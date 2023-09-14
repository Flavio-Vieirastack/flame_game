import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_study/main.dart';

enum PlayerState {
  idle,
  running,
}

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<PixelAdventure> {
  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;
  final double stepTime = 0.05;
  final String character;
  Player({
    required this.character,
  });
  @override
  FutureOr<void> onLoad() {
    _loadAllAnimation();
    return super.onLoad();
  }

  void _loadAllAnimation() {
    idleAnimation = _getAnimation(
      character: character,
      animationType: 'Idle',
      amount: 11,
    );
    runningAnimation = _getAnimation(
      character: character,
      animationType: 'Run',
      amount: 12,
    );
    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.running: runningAnimation,
    };
    current = PlayerState.running;
  }

  SpriteAnimation _getAnimation({
    required String character,
    required String animationType,
    required int amount,
    Vector2? textureSize,
  }) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache(
        'Main Characters/$character/$animationType (32x32).png',
      ),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: textureSize ?? Vector2.all(32),
      ),
    );
  }
}
