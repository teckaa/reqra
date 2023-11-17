import '/application/components/countries_data_lists/list_of_currencies/list_of_currencies_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'currency_text_field_model.dart';
export 'currency_text_field_model.dart';

class CurrencyTextFieldWidget extends StatefulWidget {
  const CurrencyTextFieldWidget({
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
  _CurrencyTextFieldWidgetState createState() =>
      _CurrencyTextFieldWidgetState();
}

class _CurrencyTextFieldWidgetState extends State<CurrencyTextFieldWidget> {
  late CurrencyTextFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrencyTextFieldModel());

    _model.textController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.valuePara,
      'NGN',
    ));
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
          Stack(
            children: [
              TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController',
                  Duration(milliseconds: 0),
                  () async {
                    logFirebaseEvent(
                        'CURRENCY_TEXT_FIELD_TextField_ren1wwaf_O');
                    logFirebaseEvent('TextField_execute_callback');
                    await widget.actionPara?.call();
                  },
                ),
                readOnly: widget.readOnlyStatusPara,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: widget.hintPara,
                  hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  fillColor: Colors.transparent,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).primaryText,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
                validator: _model.textControllerValidator.asValidator(context),
              ),
              if (widget.readOnlyStatusPara == false)
                Align(
                  alignment: AlignmentDirectional(1.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 10.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'CURRENCY_TEXT_FIELD_Icon_o1k0nfsi_ON_TAP');
                        logFirebaseEvent('Icon_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: FlutterFlowTheme.of(context).overlay,
                          useSafeArea: true,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                                child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: ListOfCurrenciesWidget(),
                            ));
                          },
                        ).then((value) =>
                            safeSetState(() => _model.getCurrencyData = value));

                        logFirebaseEvent('Icon_set_form_field');
                        setState(() {
                          _model.textController?.text = _model.getCurrencyData!;
                        });

                        setState(() {});
                      },
                      child: Icon(
                        FFIcons.karrowDown1,
                        color: FlutterFlowTheme.of(context).accent2,
                        size: 22.0,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ].divide(SizedBox(height: 5.0)),
      ),
    );
  }
}
