import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_field_dropdown_model.dart';
export 'text_field_dropdown_model.dart';

class TextFieldDropdownWidget extends StatefulWidget {
  const TextFieldDropdownWidget({
    Key? key,
    this.labelPara,
    this.hintPara,
    this.valuePara,
    bool? readOnlyStatusPara,
    Color? filledColorPara,
    this.actionPara,
  })  : this.readOnlyStatusPara = readOnlyStatusPara ?? false,
        this.filledColorPara = filledColorPara ?? Colors.transparent,
        super(key: key);

  final String? labelPara;
  final String? hintPara;
  final String? valuePara;
  final bool readOnlyStatusPara;
  final Color filledColorPara;
  final Future<dynamic> Function()? actionPara;

  @override
  _TextFieldDropdownWidgetState createState() =>
      _TextFieldDropdownWidgetState();
}

class _TextFieldDropdownWidgetState extends State<TextFieldDropdownWidget> {
  late TextFieldDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldDropdownModel());

    _model.textFieldController ??=
        TextEditingController(text: widget.valuePara);
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
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('TEXT_FIELD_DROPDOWN_Container_pikastmu_O');
              logFirebaseEvent('Container_execute_callback');
              await widget.actionPara?.call();
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.textFieldController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textFieldController',
                        Duration(milliseconds: 0),
                        () => setState(() {}),
                      ),
                      readOnly: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: widget.hintPara,
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
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).lineColor,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryText,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: widget.filledColorPara,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall,
                      keyboardType: TextInputType.phone,
                      validator: _model.textFieldControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                      child: Icon(
                        FFIcons.karrowDown1,
                        color: FlutterFlowTheme.of(context).accent1,
                        size: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ].divide(SizedBox(height: 5.0)),
      ),
    );
  }
}
