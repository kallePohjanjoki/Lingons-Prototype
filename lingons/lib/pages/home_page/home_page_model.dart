import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;

  // Numeric language values
  int?
      targetLanguageCode; // Language to learn (1=English, 2=Finnish, 3=Spanish)
  int?
      instructionLanguageCode; // Language of instruction (1=English, 2=Finnish, 3=Spanish)

  /// Convert language selection to numeric code
  int? getLanguageCode(String? languageSelection) {
    if (languageSelection == null) return null;

    switch (languageSelection) {
      case 'Englanti 🇬🇧':
        return 1;
      case 'Suomi 🇫🇮':
        return 2;
      case 'Espanja 🇪🇸':
        return 3;
      default:
        return null;
    }
  }

  /// Update numeric language codes based on current selections
  void updateLanguageCodes() {
    targetLanguageCode = getLanguageCode(dropDownValue1);
    instructionLanguageCode = getLanguageCode(dropDownValue2);
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
