import '/application/components/countries_data_lists/list_of_countries/list_of_countries_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'country_text_field_with_flag_model.dart';
export 'country_text_field_with_flag_model.dart';

class CountryTextFieldWithFlagWidget extends StatefulWidget {
  const CountryTextFieldWithFlagWidget({
    Key? key,
    this.labelPara,
    this.hintPara,
    String? valuePara,
    bool? readOnlyStatusPara,
    Color? filledColorPara,
    String? isoCodePara,
    String? isoFlagPara,
    this.actionPara,
  })  : this.valuePara = valuePara ?? 'Nigeria',
        this.readOnlyStatusPara = readOnlyStatusPara ?? false,
        this.filledColorPara = filledColorPara ?? Colors.transparent,
        this.isoCodePara = isoCodePara ?? 'ng',
        this.isoFlagPara = isoFlagPara ?? 'https://flagcdn.com/w80/ng.png',
        super(key: key);

  final String? labelPara;
  final String? hintPara;
  final String valuePara;
  final bool readOnlyStatusPara;
  final Color filledColorPara;
  final String isoCodePara;
  final String isoFlagPara;
  final Future<dynamic> Function()? actionPara;

  @override
  _CountryTextFieldWithFlagWidgetState createState() =>
      _CountryTextFieldWithFlagWidgetState();
}

class _CountryTextFieldWithFlagWidgetState
    extends State<CountryTextFieldWithFlagWidget> {
  late CountryTextFieldWithFlagModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CountryTextFieldWithFlagModel());

    _model.textFieldCountryController ??=
        TextEditingController(text: widget.valuePara);
    _model.textFieldCountryFocusNode ??= FocusNode();

    _model.textFieldIsoCodeController ??= TextEditingController(
        text: functions.allLetterLowerCase(widget.isoCodePara));
    _model.textFieldIsoCodeFocusNode ??= FocusNode();

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
              logFirebaseEvent('COUNTRY_TEXT_FIELD_WITH_FLAG_Container_g');
              logFirebaseEvent('Container_bottom_sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                isDismissible: false,
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return WebViewAware(
                      child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: ListOfCountriesWidget(),
                  ));
                },
              ).then((value) =>
                  safeSetState(() => _model.countryNameOutput = value));

              logFirebaseEvent('Container_set_form_field');
              setState(() {
                _model.textFieldIsoCodeController?.text =
                    functions.allLetterLowerCase(getJsonField(
                  _model.countryNameOutput,
                  r'''$.alpha_2_code''',
                ).toString())!;
              });
              logFirebaseEvent('Container_set_form_field');
              setState(() {
                _model.textFieldCountryController?.text = getJsonField(
                  _model.countryNameOutput,
                  r'''$.name''',
                ).toString();
              });

              setState(() {});
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.textFieldCountryController,
                      focusNode: _model.textFieldCountryFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textFieldCountryController',
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
                            55.0, 16.0, 16.0, 16.0),
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall,
                      keyboardType: TextInputType.phone,
                      validator: _model.textFieldCountryControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(7.0, 1.0, 0.0, 0.0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          getCORSProxyUrl(
                            valueOrDefault<String>(
                              'https://flagcdn.com/w80/${_model.textFieldIsoCodeController.text != null && _model.textFieldIsoCodeController.text != '' ? _model.textFieldIsoCodeController.text : widget.isoCodePara}.png',
                              'https://flagcdn.com/w80/ng.png',
                            ),
                          ),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/error_image.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
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
                controller: _model.textFieldIsoCodeController,
                focusNode: _model.textFieldIsoCodeFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textFieldIsoCodeController',
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
                validator: _model.textFieldIsoCodeControllerValidator
                    .asValidator(context),
              ),
            ),
        ].divide(SizedBox(height: 5.0)),
      ),
    );
  }
}
