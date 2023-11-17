import '/application/components/countries_data_lists/list_of_countries_dial_code/list_of_countries_dial_code_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'tel_text_field_with_dial_code_model.dart';
export 'tel_text_field_with_dial_code_model.dart';

class TelTextFieldWithDialCodeWidget extends StatefulWidget {
  const TelTextFieldWithDialCodeWidget({
    Key? key,
    this.labelPara,
    this.hintPara,
    this.valuePara,
    bool? readOnlyStatusPara,
    Color? filledColorPara,
    String? dialCodePara,
    this.actionPara,
  })  : this.readOnlyStatusPara = readOnlyStatusPara ?? false,
        this.filledColorPara = filledColorPara ?? Colors.transparent,
        this.dialCodePara = dialCodePara ?? '+234',
        super(key: key);

  final String? labelPara;
  final String? hintPara;
  final String? valuePara;
  final bool readOnlyStatusPara;
  final Color filledColorPara;
  final String dialCodePara;
  final Future<dynamic> Function()? actionPara;

  @override
  _TelTextFieldWithDialCodeWidgetState createState() =>
      _TelTextFieldWithDialCodeWidgetState();
}

class _TelTextFieldWithDialCodeWidgetState
    extends State<TelTextFieldWithDialCodeWidget> {
  late TelTextFieldWithDialCodeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelTextFieldWithDialCodeModel());

    _model.textFieldPhoneNumberController ??=
        TextEditingController(text: widget.valuePara);
    _model.textFieldPhoneNumberFocusNode ??= FocusNode();

    _model.textFieldDialCodeController ??=
        TextEditingController(text: widget.dialCodePara);
    _model.textFieldDialCodeFocusNode ??= FocusNode();

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
              Container(
                width: double.infinity,
                child: TextFormField(
                  controller: _model.textFieldPhoneNumberController,
                  focusNode: _model.textFieldPhoneNumberFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textFieldPhoneNumberController',
                    Duration(milliseconds: 0),
                    () => setState(() {}),
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
                    fillColor: widget.filledColorPara,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(55.0, 16.0, 16.0, 16.0),
                  ),
                  style: FlutterFlowTheme.of(context).labelSmall,
                  maxLength: 10,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  buildCounter: (context,
                          {required currentLength,
                          required isFocused,
                          maxLength}) =>
                      null,
                  keyboardType: TextInputType.phone,
                  validator: _model.textFieldPhoneNumberControllerValidator
                      .asValidator(context),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'TEL_TEXT_FIELD_WITH_DIAL_CODE_Container-');
                    logFirebaseEvent('Container-DialCode_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: FlutterFlowTheme.of(context).overlay,
                      isDismissible: false,
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                            child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: ListOfCountriesDialCodeWidget(),
                        ));
                      },
                    ).then((value) =>
                        safeSetState(() => _model.countryInfoOutput = value));

                    logFirebaseEvent('Container-DialCode_set_form_field');
                    setState(() {
                      _model.textFieldDialCodeController?.text =
                          _model.countryInfoOutput!;
                    });

                    setState(() {});
                  },
                  child: Container(
                    width: 60.0,
                    height: 40.0,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Text(
                        _model.textFieldDialCodeController.text != null &&
                                _model.textFieldDialCodeController.text != ''
                            ? _model.textFieldDialCodeController.text
                            : widget.dialCodePara,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ))
            Container(
              width: double.infinity,
              child: TextFormField(
                controller: _model.textFieldDialCodeController,
                focusNode: _model.textFieldDialCodeFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textFieldDialCodeController',
                  Duration(milliseconds: 0),
                  () => setState(() {}),
                ),
                readOnly: true,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: widget.hintPara,
                  hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).secondaryText,
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
                ),
                style: FlutterFlowTheme.of(context).labelSmall,
                keyboardType: TextInputType.phone,
                validator: _model.textFieldDialCodeControllerValidator
                    .asValidator(context),
              ),
            ),
        ].divide(SizedBox(height: 5.0)),
      ),
    );
  }
}
