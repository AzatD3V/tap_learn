import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioService {
  static final AudioPlayer _player = AudioPlayer();

  static void play(String? path) async {
    // Check if path is null or empty
    if (path == null || path.isEmpty) {
      debugPrint("Audio path is null or empty");
      return;
    }

    try {
      // Check if audio player is already playing
      // Eğer zaten aynı ses çalıyorsa tekrar yükleme
      if (_player.playing &&
          _player.sequence != null &&
          _player.sequence!.first.tag == path) {
        return;
      }
      // Play audio

      await _player.setAsset(path);
      await _player.play();
    } catch (e) {
      debugPrint("Error playing audio: $e");
    }
  }

  static Future<void> stop() async {
    // Stop audio
    try {
      await _player.stop();
    } catch (e) {
      debugPrint("Error stopping audio: $e");
    }
  }

  static Future<void> dispose() async {
    // Dispose audio player
    try {
      await _player.dispose();
    } catch (e) {
      debugPrint("Error disposing audio player: $e");
    }
  }
}
