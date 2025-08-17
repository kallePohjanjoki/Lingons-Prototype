import '/flutter_flow/flutter_flow_util.dart';
import 'learn_page_widget.dart' show LearnPageWidget;
import 'package:flutter/material.dart';

class LearnPageModel extends FlutterFlowModel<LearnPageWidget> {
  // Language codes received from home page
  int?
      targetLanguageCode; // Language to learn (1=English, 2=Finnish, 3=Spanish)
  int?
      instructionLanguageCode; // Language of instruction (1=English, 2=Finnish, 3=Spanish)

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
