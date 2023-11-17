import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'color_text_field_model.dart';
export 'color_text_field_model.dart';

class ColorTextFieldWidget extends StatefulWidget {
  const ColorTextFieldWidget({
    Key? key,
    this.labelPara,
    this.hintPara,
    this.valuePara,
    this.actionPara,
    bool? readOnlyStatusPara,
    Color? filledColorPara,
  })  : this.readOnlyStatusPara = readOnlyStatusPara ?? false,
        this.filledColorPara = filledColorPara ?? Colors.transparent,
        super(key: key);

  final String? labelPara;
  final String? hintPara;
  final String? valuePara;
  final Future<dynamic> Function()? actionPara;
  final bool readOnlyStatusPara;
  final Color filledColorPara;

  @override
  _ColorTextFieldWidgetState createState() => _ColorTextFieldWidgetState();
}

class _ColorTextFieldWidgetState extends State<ColorTextFieldWidget> {
  late ColorTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColorTextFieldModel());

    _model.textController ??= TextEditingController(text: widget.valuePara);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 180.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelPara != null && widget.labelPara != '')
            Text(
              valueOrDefault<String>(
                widget.labelPara,
                'Label here',
              ),
              style: FlutterFlowTheme.of(context).labelSmall,
            ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).lineColor,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(7.0, 5.0, 0.0, 5.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'COLOR_TEXT_FIELD_Container_17sqqc6c_ON_T');
                        logFirebaseEvent('Container_color_picker');
                        final _colorPickedColor = await showFFColorPicker(
                          context,
                          currentColor: _model.colorPicked ??=
                              FlutterFlowTheme.of(context).primary,
                          showRecentColors: true,
                          allowOpacity: false,
                          textColor: FlutterFlowTheme.of(context).primaryText,
                          secondaryTextColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          primaryButtonBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          primaryButtonTextColor: Colors.white,
                          primaryButtonBorderColor: Colors.transparent,
                          displayAsBottomSheet: isMobileWidth(context),
                        );

                        if (_colorPickedColor != null) {
                          safeSetState(() => _model.colorPicked =
                              _colorPickedColor.withOpacity(1.0));
                        }
                      },
                      child: Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: colorFromCssString(
                            _model.textController.text != null &&
                                    _model.textController.text != ''
                                ? _model.textController.text
                                : widget.valuePara!,
                            defaultColor: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).lineColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 200.0,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 0),
                        () => setState(() {}),
                      ),
                      readOnly: widget.readOnlyStatusPara,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: FFLocalizations.of(context).getText(
                          'todsve9v' /* #fffff */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).textfieldHint,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ].divide(SizedBox(height: 5.0)),
      ),
    );
  }
}
