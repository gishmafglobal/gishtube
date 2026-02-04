import 'package:audioplayers/audioplayers.dart';

class BackgroundMusic {
  static AudioPlayer? _player;

  static Future<void> play() async {
    _player ??= AudioPlayer();
    await _player!.setReleaseMode(ReleaseMode.loop);
    await _player!.setVolume(0.2);
    await _player!.play(
      AssetSource('audio/cinematic_bg.mp3'),
    );
  }

  static Future<void> pause() async {
    await _player?.pause();
  }

  static Future<void> stop() async {
    await _player?.stop();
    _player = null;
  }
}
