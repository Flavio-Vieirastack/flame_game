import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_study/levels/level.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device
    ..fullScreen()
    ..setLandscape();
  runApp(
    GameWidget(
      game: PixelAdventure(),
    ),
  );
}

class PixelAdventure extends FlameGame {
  late final CameraComponent cameraComponent;
  final world = Level();
  @override
  Color backgroundColor() {
    return const Color(0xff211f30);
  }

  @override
  FutureOr<void> onLoad() async {
    //salva em cache
    await images.loadAllImages();
    cameraComponent = CameraComponent.withFixedResolution(
      width: 640,
      height: 360,
      world: world,
    );
    cameraComponent.viewfinder.anchor = Anchor.topLeft;
    addAll(
      [
        cameraComponent,
        world,
      ],
    );
    return super.onLoad();
  }
}
