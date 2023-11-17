import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'password_text_field_model.dart';
export 'password_text_field_model.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  const PasswordTextFieldWidget({
    Key? key,
    this.labelPara,
    this.actionPara,
    bool? readOnlyStatusPara,
    Color? filledColorPara,
  })  : this.readOnlyStatusPara = readOnlyStatusPara ?? false,
        this.filledColorPara = filledColorPara ?? Colors.transparent,
        super(key: key);

  final String? labelPara;
  final Future<dynamic> Function()? actionPara;
  final bool readOnlyStatusPara;
  final Color filledColorPara;

  @override
  _PasswordTextFieldWidgetState createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  late PasswordTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PasswordTextFieldModel());

    _model.textController ??= TextEditingController();
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
                'Password',
              ),
              style: FlutterFlowTheme.of(context).labelSmall,
            ),
          Container(
            width: double.infinity,
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.textController',
                Duration(milliseconds: 0),
                () async {
                  logFirebaseEvent('PASSWORD_TEXT_FIELD_TextField_d06w3uc8_O');
                  logFirebaseEvent('TextField_execute_callback');
                  await widget.actionPara?.call();
                },
              ),
              readOnly: widget.readOnlyStatusPara,
              obscureText: !_model.passwordVisibility,
              decoration: InputDecoration(
                isDense: true,
                hintText: FFLocalizations.of(context).getText(
                  'x76563jl' /* Password */,
                ),
                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).textfieldHint,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
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
                contentPadding:
                    EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                suffixIcon: InkWell(
                  onTap: () => setState(
                    () =>
                        _model.passwordVisibility = !_model.passwordVisibility,
                  ),
                  focusNode: FocusNode(skipTraversal: true),
                  child: Icon(
                    _model.passwordVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 15.0,
                  ),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).primaryText,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
              keyboardType: TextInputType.visiblePassword,
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
        ].divide(SizedBox(height: 5.0)),
      ),
    );
  }
}
