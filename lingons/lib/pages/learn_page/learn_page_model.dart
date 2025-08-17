import '/flutter_flow/flutter_flow_util.dart';
import 'learn_page_widget.dart' show LearnPageWidget;
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class LearnPageModel extends FlutterFlowModel<LearnPageWidget> {
  // Language codes received from home page
  int?
      targetLanguageCode; // Language to learn (1=English, 2=Finnish, 3=Spanish)
  int?
      instructionLanguageCode; // Language of instruction (1=English, 2=Finnish, 3=Spanish)

  // Audio player
  AudioPlayer? audioPlayer;
  bool isPlaying = false;
  int currentWordIndex = 1;
  int maxWords = 51; // Maximum word number based on available files
  bool isPlayingTargetLanguage =
      true; // true = target language, false = instruction language

  // Callback to notify UI of state changes
  VoidCallback? onStateChanged;

  /// Parse language codes from query parameters
  void parseLanguageCodes(Map<String, String>? queryParameters) {
    if (queryParameters != null) {
      targetLanguageCode =
          int.tryParse(queryParameters['targetLanguage'] ?? '');
      instructionLanguageCode =
          int.tryParse(queryParameters['instructionLanguage'] ?? '');
    }
  }

  /// Get language name from code
  String getLanguageName(int? code) {
    switch (code) {
      case 1:
        return 'Englanti';
      case 2:
        return 'Suomi';
      case 3:
        return 'Espanja';
      default:
        return 'Tuntematon';
    }
  }

  /// Initialize audio player
  void initAudioPlayer() {
    audioPlayer = AudioPlayer();
    audioPlayer!.onPlayerComplete.listen((event) {
      // When audio finishes, play the next one after 2 second delay
      Future.delayed(const Duration(seconds: 2), () {
        playNextAudio();
      });
    });
  }

  /// Start playing audio files in sequence
  void startAudioSequence() {
    if (targetLanguageCode == null || instructionLanguageCode == null) return;

    currentWordIndex = 1;
    isPlayingTargetLanguage = true;
    isPlaying = true;
    onStateChanged?.call();
    playCurrentAudio();
  }

  /// Play current audio (target language or instruction language)
  void playCurrentAudio() {
    if (currentWordIndex > maxWords || !isPlaying) {
      isPlaying = false;
      onStateChanged?.call();
      return;
    }

    int languageCode;
    if (isPlayingTargetLanguage) {
      languageCode = targetLanguageCode!;
    } else {
      languageCode = instructionLanguageCode!;
    }

    final fileName = '$currentWordIndex-$languageCode.mp3';
    final audioPath = 'audios/$fileName';

    print(
        'Playing: $audioPath (${isPlayingTargetLanguage ? "target" : "instruction"} language)');

    audioPlayer?.play(AssetSource(audioPath));
  }

  /// Play next audio in sequence
  void playNextAudio() {
    if (currentWordIndex > maxWords || !isPlaying) {
      isPlaying = false;
      onStateChanged?.call();
      return;
    }

    if (isPlayingTargetLanguage) {
      // First play target language, then switch to instruction language
      isPlayingTargetLanguage = false;
      onStateChanged?.call();
      playCurrentAudio();
    } else {
      // After instruction language, move to next word and start with target language
      isPlayingTargetLanguage = true;
      currentWordIndex++;
      onStateChanged?.call();
      playCurrentAudio();
    }
  }

  /// Stop audio sequence
  void stopAudioSequence() {
    isPlaying = false;
    isPlayingTargetLanguage = true;
    audioPlayer?.stop();
    onStateChanged?.call();
  }

  /// Pause audio
  void pauseAudio() {
    audioPlayer?.pause();
    onStateChanged?.call();
  }

  /// Resume audio
  void resumeAudio() {
    audioPlayer?.resume();
    onStateChanged?.call();
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    audioPlayer?.dispose();
  }
}
