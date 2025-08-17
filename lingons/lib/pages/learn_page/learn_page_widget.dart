import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/nav/nav.dart';
import '/flutter_flow/nav/serialization_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'learn_page_model.dart';
export 'learn_page_model.dart';

class LearnPageWidget extends StatefulWidget {
  const LearnPageWidget({super.key, this.params});

  static String routeName = 'LearnPage';
  static String routePath = '/learnPage';

  final FFParameters? params;

  @override
  State<LearnPageWidget> createState() => _LearnPageWidgetState();
}

class _LearnPageWidgetState extends State<LearnPageWidget> {
  late LearnPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearnPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get parameters from FFParameters
    if (widget.params != null) {
      // Access parameters from FFParameters
      final targetLanguage =
          widget.params!.getParam<String>('targetLanguage', ParamType.String);
      final instructionLanguage = widget.params!
          .getParam<String>('instructionLanguage', ParamType.String);

      if (targetLanguage != null || instructionLanguage != null) {
        _model.parseLanguageCodes({
          'targetLanguage': targetLanguage,
          'instructionLanguage': instructionLanguage,
        });
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFFEF3947),
          automaticallyImplyLeading: false,
          title: Text(
            'Opiskelu',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 20.0, 20.0, 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Valitut kieliasetukset:',
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    fontSize: 18.0,
                                  ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            Icon(
                              Icons.language,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20.0,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              'Opiskeltava kieli: ',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              _model.getLanguageName(_model.targetLanguageCode),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontWeight: FontWeight.w600,
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(
                              Icons.school,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20.0,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              'Ohjeiden kieli: ',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              _model.getLanguageName(
                                  _model.instructionLanguageCode),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontWeight: FontWeight.w600,
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          'Numeeriset koodit: ${_model.targetLanguageCode} (opiskeltava), ${_model.instructionLanguageCode} (ohjeet)',
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              Text(
                'Tässä voit jatkaa kielten opiskelua!',
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      font: GoogleFonts.inter(
                        fontSize: 16.0,
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
