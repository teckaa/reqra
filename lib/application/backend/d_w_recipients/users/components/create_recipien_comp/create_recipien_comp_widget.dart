import '/application/backend/d_w_recipients/users/components/list_of_banks/list_of_banks_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/tel_text_field/tel_text_field_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_recipien_comp_model.dart';
export 'create_recipien_comp_model.dart';

class CreateRecipienCompWidget extends StatefulWidget {
  const CreateRecipienCompWidget({
    Key? key,
    this.submitActionPara,
    this.typePara,
    this.numberPara,
    this.namePara,
    this.bankNamePara,
    this.customerNamePara,
  }) : super(key: key);

  final Future<dynamic> Function()? submitActionPara;
  final String? typePara;
  final String? numberPara;
  final String? namePara;
  final String? bankNamePara;
  final String? customerNamePara;

  @override
  _CreateRecipienCompWidgetState createState() =>
      _CreateRecipienCompWidgetState();
}

class _CreateRecipienCompWidgetState extends State<CreateRecipienCompWidget> {
  late CreateRecipienCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateRecipienCompModel());

    _model.textFieldBankNameController ??= TextEditingController();
    _model.textFieldBankNameFocusNode ??= FocusNode();

    _model.textFieldAccountNumberController ??= TextEditingController();
    _model.textFieldAccountNumberFocusNode ??= FocusNode();

    _model.textFieldAccountNameController ??= TextEditingController();
    _model.textFieldAccountNameFocusNode ??= FocusNode();

    _model.textFieldProviderController ??= TextEditingController();
    _model.textFieldProviderFocusNode ??= FocusNode();

    _model.textFieldCustomerNumberController ??= TextEditingController();
    _model.textFieldCustomerNumberFocusNode ??= FocusNode();

    _model.textFieldCustomerNameController ??= TextEditingController();
    _model.textFieldCustomerNameFocusNode ??= FocusNode();

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
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '5ejz7m1s' /* Type of Recipient */,
                ),
                style: FlutterFlowTheme.of(context).labelSmall,
              ),
              FlutterFlowDropDown<String>(
                controller: _model.dropDownTypeOfNumberValueController ??=
                    FormFieldController<String>(
                  _model.dropDownTypeOfNumberValue ??= widget.typePara,
                ),
                options: [
                  FFLocalizations.of(context).getText(
                    'tuvg2ebw' /* Bank Account */,
                  ),
                  FFLocalizations.of(context).getText(
                    'htidlvxy' /* Username Tag */,
                  ),
                  FFLocalizations.of(context).getText(
                    'x1pkmldx' /* Phone Number */,
                  ),
                  FFLocalizations.of(context).getText(
                    'kcm3y8du' /* Smart Card Number */,
                  ),
                  FFLocalizations.of(context).getText(
                    'pq7qickw' /* Meter Number */,
                  ),
                  FFLocalizations.of(context).getText(
                    '1g3jiy46' /* Wifi Number */,
                  ),
                  FFLocalizations.of(context).getText(
                    '2thyf9n0' /* Toll Number */,
                  )
                ],
                onChanged: (val) async {
                  setState(() => _model.dropDownTypeOfNumberValue = val);
                  logFirebaseEvent('CREATE_RECIPIEN_DropDown-TypeOfNumber_ON');
                  logFirebaseEvent('DropDown-TypeOfNumber_reset_form_fields');
                  setState(() {
                    _model.textFieldBankNameController?.clear();
                    _model.textFieldAccountNumberController?.clear();
                    _model.textFieldAccountNameController?.clear();
                    _model.textFieldProviderController?.clear();
                    _model.textFieldCustomerNumberController?.clear();
                    _model.textFieldCustomerNameController?.clear();
                  });
                },
                width: double.infinity,
                height: 43.0,
                textStyle: FlutterFlowTheme.of(context).bodyMedium,
                hintText: FFLocalizations.of(context).getText(
                  'c1r0fusg' /* Type of number... */,
                ),
                icon: Icon(
                  FFIcons.karrowDown1,
                  color: FlutterFlowTheme.of(context).accent2,
                  size: 18.0,
                ),
                elevation: 0.0,
                borderColor: FlutterFlowTheme.of(context).lineColor,
                borderWidth: 1.0,
                borderRadius: 8.0,
                margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                hidesUnderline: true,
                isSearchable: false,
                isMultiSelect: false,
              ),
            ].divide(SizedBox(height: 5.0)),
          ),
          Builder(
            builder: (context) {
              if (_model.dropDownTypeOfNumberValue == 'Bank Account') {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Form(
                        key: _model.formKey2,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '4ggzprap' /* Bank Name */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'CREATE_RECIPIEN_Stack_3k145xxn_ON_TAP');
                                    logFirebaseEvent('Stack_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor:
                                          FlutterFlowTheme.of(context).overlay,
                                      isDismissible: false,
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                            child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ListOfBanksWidget(),
                                        ));
                                      },
                                    ).then((value) => safeSetState(
                                        () => _model.getBankNameCode = value));

                                    logFirebaseEvent('Stack_set_form_field');
                                    setState(() {
                                      _model.textFieldBankNameController?.text =
                                          getJsonField(
                                        _model.getBankNameCode,
                                        r'''$.name''',
                                      ).toString();
                                    });

                                    setState(() {});
                                  },
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 7.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 26.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .lineColor,
                                            icon: Icon(
                                              FFIcons.kbank,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 10.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ),
                                      ),
                                      TextFormField(
                                        controller:
                                            _model.textFieldBankNameController,
                                        focusNode:
                                            _model.textFieldBankNameFocusNode,
                                        readOnly: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'hxdojtr4' /* Bank Name */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  50.0, 16.0, 16.0, 16.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        validator: _model
                                            .textFieldBankNameControllerValidator
                                            .asValidator(context),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 10.0, 0.0),
                                          child: Icon(
                                            FFIcons.karrowDown1,
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            size: 18.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'f76e651w' /* Enter Account Number */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                TextFormField(
                                  controller:
                                      _model.textFieldAccountNumberController,
                                  focusNode:
                                      _model.textFieldAccountNumberFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textFieldAccountNumberController',
                                    Duration(milliseconds: 0),
                                    () async {
                                      logFirebaseEvent(
                                          'CREATE_RECIPIEN_TextField-AccountNumber_');
                                      var _shouldSetState = false;
                                      logFirebaseEvent(
                                          'TextField-AccountNumber_backend_call');
                                      _model.apiResultVerifyAccount =
                                          await FluttewaveApiGroup
                                              .accountResolveCall
                                              .call(
                                        accountNumber: _model
                                            .textFieldAccountNumberController
                                            .text,
                                        accountBank: getJsonField(
                                          _model.getBankNameCode,
                                          r'''$.code''',
                                        ).toString(),
                                      );
                                      _shouldSetState = true;
                                      if ((_model.apiResultVerifyAccount
                                              ?.succeeded ??
                                          true)) {
                                        logFirebaseEvent(
                                            'TextField-AccountNumber_set_form_field');
                                        setState(() {
                                          _model.textFieldAccountNameController
                                                  ?.text =
                                              functions.firstLetterUpperCase(
                                                  getJsonField(
                                            (_model.apiResultVerifyAccount
                                                    ?.jsonBody ??
                                                ''),
                                            r'''$.data.account_name''',
                                          ).toString())!;
                                        });
                                        logFirebaseEvent(
                                            'TextField-AccountNumber_update_component');
                                        setState(() {
                                          _model.checkAccountNumberError =
                                              false;
                                        });
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        logFirebaseEvent(
                                            'TextField-AccountNumber_update_component');
                                        setState(() {
                                          _model.checkAccountNumberError = true;
                                        });
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) setState(() {});
                                    },
                                  ),
                                  textInputAction: TextInputAction.send,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'tbowi40w' /* 0123456789 */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
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
                            if (_model.checkAccountNumberError ?? true)
                              Text(
                                FFLocalizations.of(context).getText(
                                  'whpg12wj' /* Your account number or bank is... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      color: FlutterFlowTheme.of(context).error,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                              ),
                            if ((_model.apiResultVerifyAccount?.succeeded ??
                                    true) ==
                                true)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '0mx02sbn' /* Name on Account */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  TextFormField(
                                    controller:
                                        _model.textFieldAccountNameController,
                                    focusNode:
                                        _model.textFieldAccountNameFocusNode,
                                    textInputAction: TextInputAction.search,
                                    readOnly: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16.0, 16.0, 16.0, 16.0),
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
                                        .textFieldAccountNameControllerValidator
                                        .asValidator(context),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                          ]
                              .divide(SizedBox(height: 15.0))
                              .around(SizedBox(height: 15.0)),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: wrapWithModel(
                              model: _model.primaryButtonLoadingModel1,
                              updateCallback: () => setState(() {}),
                              child: PrimaryButtonLoadingWidget(
                                buttonText: 'Save',
                                buttonWidth: 200,
                                buttonHeight: 50,
                                disableStatusPara: (_model
                                                .textFieldBankNameController
                                                .text ==
                                            null ||
                                        _model.textFieldBankNameController
                                                .text ==
                                            '') ||
                                    (_model.textFieldAccountNumberController
                                                .text ==
                                            null ||
                                        _model.textFieldAccountNumberController
                                                .text ==
                                            '') ||
                                    (_model.textFieldAccountNameController
                                                .text ==
                                            null ||
                                        _model.textFieldAccountNameController
                                                .text ==
                                            ''),
                                disableColorPara:
                                    FlutterFlowTheme.of(context).disableColor,
                                buttonAction: () async {
                                  logFirebaseEvent(
                                      'CREATE_RECIPIEN_Container_i886v5uz_CALLB');
                                  logFirebaseEvent(
                                      'PrimaryButtonLoading_execute_callback');
                                  await widget.submitActionPara?.call();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else if (_model.dropDownTypeOfNumberValue == 'Username Tag') {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                );
              } else if (_model.dropDownTypeOfNumberValue ==
                  'Smart Card Number') {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Form(
                        key: _model.formKey3,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    TextFormField(
                                      controller:
                                          _model.textFieldProviderController,
                                      focusNode:
                                          _model.textFieldProviderFocusNode,
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
                                          .textFieldProviderControllerValidator
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
                                                    borderColor:
                                                        Colors.transparent,
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
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '677hdfpb' /* Select Bank */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
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
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'xmenrgew' /* Enter Account Number */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                TextFormField(
                                  controller:
                                      _model.textFieldCustomerNumberController,
                                  focusNode:
                                      _model.textFieldCustomerNumberFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textFieldCustomerNumberController',
                                    Duration(milliseconds: 0),
                                    () => setState(() {}),
                                  ),
                                  textInputAction: TextInputAction.send,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'up9m5a01' /* 0123456789 */,
                                    ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
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
                                      .textFieldCustomerNumberControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [
                                    _model.textFieldCustomerNumberMask
                                  ],
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'om5q6xl1' /* Enter Account Number */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                TextFormField(
                                  controller:
                                      _model.textFieldCustomerNameController,
                                  focusNode:
                                      _model.textFieldCustomerNameFocusNode,
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
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 0.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    filled: true,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            14.0, 14.0, 14.0, 14.0),
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
                                  validator: _model
                                      .textFieldCustomerNameControllerValidator
                                      .asValidator(context),
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'r923wcb4' /* Your account number or bank is... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).error,
                                    fontSize: 12.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ].divide(SizedBox(height: 15.0)),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (_model.dropDownTypeOfNumberValue == 'Meter Number') {
                return Form(
                  key: _model.formKey1,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.telTextFieldPhoneNumberModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: TelTextFieldWidget(
                            labelPara: valueOrDefault<String>(
                              _model.dropDownTypeOfNumberValue,
                              'Customer Number',
                            ),
                            hintPara: valueOrDefault<String>(
                              () {
                                if (_model.dropDownTypeOfNumberValue ==
                                    'Phone number') {
                                  return '08123456789';
                                } else if (_model.dropDownTypeOfNumberValue ==
                                    'Smart card number') {
                                  return '01234567890';
                                } else if (_model.dropDownTypeOfNumberValue ==
                                    'Meter number') {
                                  return '01234567890';
                                } else if (_model.dropDownTypeOfNumberValue ==
                                    'Wifi number') {
                                  return '1234567890';
                                } else {
                                  return '08123456789';
                                }
                              }(),
                              '08123456789',
                            ),
                            valuePara: widget.numberPara,
                            readOnlyStatusPara: false,
                            actionPara: () async {},
                          ),
                        ),
                        wrapWithModel(
                          model: _model.inputTextFieldPhoneNameModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: InputTextFieldWidget(
                            labelPara: 'Enter Name',
                            hintPara: 'Enter Name',
                            valuePara: widget.namePara,
                            readOnlyStatusPara: false,
                            actionPara: () async {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
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
                                        'CREATE_RECIPIEN_Container_nm6lyh5t_ON_TA');
                                    logFirebaseEvent(
                                        'PrimaryButtonLoading_execute_callback');
                                    await widget.submitActionPara?.call();
                                  },
                                  child: wrapWithModel(
                                    model: _model.primaryButtonLoadingModel2,
                                    updateCallback: () => setState(() {}),
                                    updateOnChange: true,
                                    child: PrimaryButtonLoadingWidget(
                                      buttonText: 'Save',
                                      buttonHeight: 50,
                                      disableStatusPara: (_model
                                                      .telTextFieldPhoneNumberModel
                                                      .textController
                                                      .text ==
                                                  null ||
                                              _model.telTextFieldPhoneNumberModel
                                                      .textController.text ==
                                                  '') ||
                                          (_model.inputTextFieldPhoneNameModel
                                                      .textController.text ==
                                                  null ||
                                              _model.inputTextFieldPhoneNameModel
                                                      .textController.text ==
                                                  ''),
                                      disableColorPara:
                                          FlutterFlowTheme.of(context).accent3,
                                      buttonAction: () async {
                                        logFirebaseEvent(
                                            'CREATE_RECIPIEN_Container_nm6lyh5t_CALLB');
                                        logFirebaseEvent(
                                            'PrimaryButtonLoading_validate_form');
                                        if (_model.formKey1.currentState ==
                                                null ||
                                            !_model.formKey1.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        logFirebaseEvent(
                                            'PrimaryButtonLoading_execute_callback');
                                        await widget.submitActionPara?.call();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 15.0))
                          .around(SizedBox(height: 15.0)),
                    ),
                  ),
                );
              } else if (_model.dropDownTypeOfNumberValue == 'Phone Number') {
                return Text(
                  FFLocalizations.of(context).getText(
                    '6lb79mo1' /* Hello World */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                );
              } else if (_model.dropDownTypeOfNumberValue == 'Wifi Number') {
                return Text(
                  FFLocalizations.of(context).getText(
                    '39dfqta2' /* Hello World */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                );
              } else {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'rx1g4ycn' /* Phone Number */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'sipu8dun' /* Wifi Number */,
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                      ),
                    ].divide(SizedBox(height: 15.0)),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
