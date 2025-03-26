import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioService {
  static void play(String? path) async {
    // Play audio
    try {
      final player = AudioPlayer();
      await player.setAsset(path!);
      await player.play();
    } catch (e) {
      debugPrint("Error playing audio: $e");
    }
  }
}
