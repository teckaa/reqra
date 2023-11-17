import '/application/backend/d_w_recipients/users/components/list_of_banks/list_of_banks_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_recipient_comp_model.dart';
export 'create_recipient_comp_model.dart';

class CreateRecipientCompWidget extends StatefulWidget {
  const CreateRecipientCompWidget({
    Key? key,
    this.submitActionPara,
    this.accountOwnerPara,
    this.bankNamePara,
    this.accountNumberPara,
    this.accountNamePara,
  }) : super(key: key);

  final Future<dynamic> Function()? submitActionPara;
  final String? accountOwnerPara;
  final String? bankNamePara;
  final String? accountNumberPara;
  final String? accountNamePara;

  @override
  _CreateRecipientCompWidgetState createState() =>
      _CreateRecipientCompWidgetState();
}

class _CreateRecipientCompWidgetState extends State<CreateRecipientCompWidget> {
  late CreateRecipientCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateRecipientCompModel());

    _model.textFieldBankNameController ??= TextEditingController();
    _model.textFieldBankNameFocusNode ??= FocusNode();

    _model.textFieldAccountNumberController ??= TextEditingController();
    _model.textFieldAccountNumberFocusNode ??= FocusNode();

    _model.textFieldAccountNameController ??= TextEditingController();
    _model.textFieldAccountNameFocusNode ??= FocusNode();

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
      width: 500.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'q3iqvmpk' /* Country */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 12.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              FlutterFlowDropDown<String>(
                                controller:
                                    _model.dropDownCountryValueController ??=
                                        FormFieldController<String>(
                                  _model.dropDownCountryValue ??= 'NG',
                                ),
                                options: List<String>.from(['NG']),
                                optionLabels: [
                                  FFLocalizations.of(context).getText(
                                    'zqvxcxid' /* Nigeria */,
                                  )
                                ],
                                onChanged: (val) => setState(
                                    () => _model.dropDownCountryValue = val),
                                width: double.infinity,
                                height: 40.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'msk49wpc' /* Please select... */,
                                ),
                                icon: Icon(
                                  FFIcons.karrowDown1,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 18.0,
                                ),
                                elevation: 0.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).lineColor,
                                borderWidth: 1.0,
                                borderRadius: 4.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ].divide(SizedBox(height: 5.0)),
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Builder(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CREATE_RECIPIENT_Stack_0t3hueey_ON_TAP');
                                  logFirebaseEvent('Stack_alert_dialog');
                                  await showAlignedDialog(
                                    context: context,
                                    isGlobal: true,
                                    avoidOverflow: false,
                                    targetAnchor: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    followerAnchor: AlignmentDirectional(
                                            0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    builder: (dialogContext) {
                                      return Material(
                                        color: Colors.transparent,
                                        child: WebViewAware(
                                            child: Container(
                                          width: 360.0,
                                          child: ListOfBanksWidget(),
                                        )),
                                      );
                                    },
                                  ).then((value) => setState(() {}));

                                  logFirebaseEvent(
                                      'Stack_clear_text_fields_pin_codes');
                                  setState(() {
                                    _model.textFieldAccountNumberController
                                        ?.clear();
                                    _model.textFieldAccountNameController
                                        ?.clear();
                                  });
                                },
                                child: Stack(
                                  children: [
                                    TextFormField(
                                      controller:
                                          _model.textFieldBankNameController,
                                      focusNode:
                                          _model.textFieldBankNameFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      validator: _model
                                          .textFieldBankNameControllerValidator
                                          .asValidator(context),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.00, 0.00),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 26.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .lineColor,
                                                    icon: Icon(
                                                      FFIcons.kbank,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 10.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                ].divide(SizedBox(width: 15.0)),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.00, -1.00),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.00, 0.00),
                                                    child: Icon(
                                                      FFIcons.karrowDown1,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                's5o2c0bq' /* Who’s your New Recipient? */,
                              ),
                              style: FlutterFlowTheme.of(context).labelSmall,
                            ),
                            FlutterFlowDropDown<String>(
                              controller:
                                  _model.dropDownAccountOwnerValueController ??=
                                      FormFieldController<String>(
                                _model.dropDownAccountOwnerValue ??=
                                    FFLocalizations.of(context).getText(
                                  '6kln8nhs' /* Myself */,
                                ),
                              ),
                              options: [
                                FFLocalizations.of(context).getText(
                                  '7uqf8nnj' /* Myself */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'adhd91g3' /* Someone else */,
                                )
                              ],
                              onChanged: (val) => setState(
                                  () => _model.dropDownAccountOwnerValue = val),
                              height: 45.0,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: FFLocalizations.of(context).getText(
                                'nbhtggvy' /* Select... */,
                              ),
                              icon: Icon(
                                FFIcons.karrowDown1,
                                size: 18.0,
                              ),
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).lineColor,
                              borderWidth: 1.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 4.0, 10.0, 4.0),
                              hidesUnderline: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ].divide(SizedBox(height: 5.0)),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'mwpob8cz' /* Enter Account Number */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            TextFormField(
                              controller:
                                  _model.textFieldAccountNumberController,
                              focusNode: _model.textFieldAccountNumberFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textFieldAccountNumberController',
                                Duration(milliseconds: 0),
                                () async {
                                  logFirebaseEvent(
                                      'CREATE_RECIPIENT_TextField-AccountNumber');
                                  logFirebaseEvent(
                                      'TextField-AccountNumber_validate_form');
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  logFirebaseEvent(
                                      'TextField-AccountNumber_backend_call');
                                  _model.verifyBankapiResult =
                                      await FluttewaveApiGroup
                                          .accountResolveCall
                                          .call(
                                    accountNumber:
                                        _model.dropDownAccountOwnerValue,
                                    accountBank:
                                        _model.textFieldBankNameController.text,
                                  );
                                  if ((_model.verifyBankapiResult?.succeeded ??
                                      true)) {
                                    logFirebaseEvent(
                                        'TextField-AccountNumber_set_form_field');
                                    setState(() {
                                      _model.textFieldAccountNameController
                                              ?.text =
                                          functions.allFirstLetterUpperCase(
                                              functions.firstLetterUpperCase(
                                                  functions.allLetterLowerCase(
                                                      getJsonField(
                                        (_model.verifyBankapiResult?.jsonBody ??
                                            ''),
                                        r'''$.account_name''',
                                      ).toString())))!;
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'TextField-AccountNumber_update_component');
                                    setState(() {
                                      _model.verifyBankDetailsError = true;
                                    });
                                    logFirebaseEvent(
                                        'TextField-AccountNumber_reset_form_field');
                                    setState(() {
                                      _model.textFieldAccountNameController
                                          ?.clear();
                                    });
                                  }

                                  setState(() {});
                                },
                              ),
                              textInputAction: TextInputAction.send,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: FFLocalizations.of(context).getText(
                                  '0bvyhy30' /* 0123456789 */,
                                ),
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 0.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 16.0, 16.0, 16.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              keyboardType: TextInputType.number,
                              validator: _model
                                  .textFieldAccountNumberControllerValidator
                                  .asValidator(context),
                              inputFormatters: [
                                _model.textFieldAccountNumberMask
                              ],
                            ),
                          ].divide(SizedBox(height: 5.0)),
                        ),
                        if (valueOrDefault<bool>(
                          (_model.verifyBankapiResult?.succeeded ?? true) ==
                              true,
                          true,
                        ))
                          TextFormField(
                            controller: _model.textFieldAccountNameController,
                            focusNode: _model.textFieldAccountNameFocusNode,
                            textInputAction: TextInputAction.search,
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              filled: true,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  14.0, 14.0, 14.0, 14.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            validator: _model
                                .textFieldAccountNameControllerValidator
                                .asValidator(context),
                          ),
                        if (_model.verifyBankDetailsError == true)
                          Text(
                            FFLocalizations.of(context).getText(
                              'ul3d2rlo' /* Your account number or bank is... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).error,
                                  fontSize: 12.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                      ].divide(SizedBox(height: 15.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'CREATE_RECIPIENT_Container_jlmcylok_ON_T');
                      logFirebaseEvent('PrimaryButtonLoading_execute_callback');
                      await widget.submitActionPara?.call();
                    },
                    child: wrapWithModel(
                      model: _model.primaryButtonLoadingModel,
                      updateCallback: () => setState(() {}),
                      child: PrimaryButtonLoadingWidget(
                        buttonText: 'Save',
                        buttonHeight: 50,
                        disableStatusPara:
                            (_model.verifyBankapiResult?.succeeded ?? true),
                        buttonAction: () async {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
