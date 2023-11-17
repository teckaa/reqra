import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'left_sided_amount_text_field_model.dart';
export 'left_sided_amount_text_field_model.dart';

class LeftSidedAmountTextFieldWidget extends StatefulWidget {
  const LeftSidedAmountTextFieldWidget({
    Key? key,
    this.labelPara,
    this.hintPara,
    this.valuePara,
    this.actionPara,
    this.sidedText,
    bool? readOnlyStatusPara,
    Color? filledColorPara,
  })  : this.readOnlyStatusPara = readOnlyStatusPara ?? false,
        this.filledColorPara = filledColorPara ?? Colors.transparent,
        super(key: key);

  final String? labelPara;
  final String? hintPara;
  final String? valuePara;
  final Future<dynamic> Function()? actionPara;
  final String? sidedText;
  final bool readOnlyStatusPara;
  final Color filledColorPara;

  @override
  _LeftSidedAmountTextFieldWidgetState createState() =>
      _LeftSidedAmountTextFieldWidgetState();
}

class _LeftSidedAmountTextFieldWidgetState
    extends State<LeftSidedAmountTextFieldWidget> {
  late LeftSidedAmountTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeftSidedAmountTextFieldModel());

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
      width: 150.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelPara != null && widget.labelPara != '')
            Text(
              widget.labelPara!,
              style: FlutterFlowTheme.of(context).labelSmall,
            ),
          Container(
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: 50.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Text(
                      widget.sidedText!,
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelSmallFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).labelSmallFamily),
                          ),
                    ),
                  ),
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
                        logFirebaseEvent(
                            'LEFT_SIDED_AMOUNT_TEXT_FIELD_TextField_6');
                        logFirebaseEvent('TextField_execute_callback');
                        await widget.actionPara?.call();
                      },
                    ),
                    textCapitalization: TextCapitalization.none,
                    readOnly: widget.readOnlyStatusPara,
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
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          50.0, 16.0, 16.0, 16.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator:
                        _model.textControllerValidator.asValidator(context),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
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
