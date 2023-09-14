import 'dart:async';
import 'package:flame_study/player/player.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flame/components.dart';

class Level extends World {
  late final TiledComponent level;
  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load(
      'level_1.tmx',
      Vector2.all(16),
    );
    add(level);
    add(Player(character: 'Ninja Frog'));
    return super.onLoad();
  }
}
