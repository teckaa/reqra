import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/forms/country_text_field_with_flag/country_text_field_with_flag_widget.dart';
import '/application/components/forms/currency_text_field/currency_text_field_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/password_text_field/password_text_field_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'setup_application2_model.dart';
export 'setup_application2_model.dart';

class SetupApplication2Widget extends StatefulWidget {
  const SetupApplication2Widget({Key? key}) : super(key: key);

  @override
  _SetupApplication2WidgetState createState() =>
      _SetupApplication2WidgetState();
}

class _SetupApplication2WidgetState extends State<SetupApplication2Widget>
    with TickerProviderStateMixin {
  late SetupApplication2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetupApplication2Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SetupApplication2'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Title(
        title: 'Set Up your Application',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Stack(
              children: [
                if (responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                ))
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFEDF5FF),
                          FlutterFlowTheme.of(context).secondaryBackground
                        ],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.03, -1.0),
                        end: AlignmentDirectional(-0.03, 1.0),
                      ),
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      width: 800.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/flow-background.png',
                          ).image,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFEDF5FF),
                            FlutterFlowTheme.of(context).secondaryBackground
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.03, -1.0),
                          end: AlignmentDirectional(-0.03, 1.0),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '2b02l34i' /* DoorWay */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall,
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SETUP_APPLICATION2_Row_4tkhey38_ON_TAP');
                                        logFirebaseEvent(
                                            'Row_update_page_state');
                                        setState(() {
                                          _model.setupStep = 'Set Up';
                                        });
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'altmswth' /* Restart */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmallFamily,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmallFamily),
                                                ),
                                          ),
                                          Icon(
                                            FFIcons.krefresh,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                        ].divide(SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ),
                              Divider(
                                height: 5.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).accent4,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 20.0),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.setupStep ==
                                                'Verification') {
                                              return Container(
                                                width: 500.0,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'rafi6v6t' /* Preparation Steps: Firebase Ac... */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                                letterSpacing:
                                                                    0.6,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleLargeFamily),
                                                                lineHeight: 1.5,
                                                              ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'u9ifakcq' /* Before proceeding, kindly ensu... */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.6,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                                lineHeight: 1.5,
                                                              ),
                                                    ),
                                                    Image.asset(
                                                      'assets/images/flutterflow_and_firebase.png',
                                                      width: 350.0,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                    Wrap(
                                                      spacing: 20.0,
                                                      runSpacing: 20.0,
                                                      alignment:
                                                          WrapAlignment.center,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        wrapWithModel(
                                                          model: _model
                                                              .primaryRoundedButtonModel1,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          updateOnChange: true,
                                                          child:
                                                              PrimaryRoundedButtonWidget(
                                                            buttonText:
                                                                'Continue',
                                                            buttonWidth: 150,
                                                            disableStatusPara:
                                                                false,
                                                            buttonAction:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'SETUP_APPLICATION2_Container_8u0vq65a_CA');
                                                              logFirebaseEvent(
                                                                  'PrimaryRoundedButton_update_page_state');
                                                              setState(() {
                                                                _model.setupStep =
                                                                    'Register App';
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .primaryRoundedButtonModel2,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          updateOnChange: true,
                                                          child:
                                                              PrimaryRoundedButtonWidget(
                                                            buttonText:
                                                                'Firebase and Flutterflow Config',
                                                            buttonBgColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                            buttonTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            buttonWidth: 250,
                                                            disableStatusPara:
                                                                false,
                                                            buttonAction:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'SETUP_APPLICATION2_Container_mancf2pj_CA');
                                                              logFirebaseEvent(
                                                                  'PrimaryRoundedButton_update_page_state');
                                                              setState(() {
                                                                _model.setupStep =
                                                                    'Firebase and Flutterflow Config';
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 20.0)),
                                                ),
                                              );
                                            } else if (_model.setupStep ==
                                                'Firebase and Flutterflow Config') {
                                              return Container(
                                                width: 600.0,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'm017luak' /* Firebase Account Setup: */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                                letterSpacing:
                                                                    0.6,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleLargeFamily),
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '3szrjs84' /* 1) Go to the Firebase website.... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.6,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 10.0)),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'fxtcdo4m' /* FlutterFlow Configuration: */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                                letterSpacing:
                                                                    0.6,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleLargeFamily),
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '52jtzaa9' /* 1) Log in to your FlutterFlow ... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.6,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 10.0)),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    30.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'rgj52nk7' /* Yes, I have completed the setu... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall,
                                                            ),
                                                            wrapWithModel(
                                                              model: _model
                                                                  .primaryRoundedButtonModel3,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  PrimaryRoundedButtonWidget(
                                                                buttonText:
                                                                    'Please continue',
                                                                buttonWidth:
                                                                    150,
                                                                disableStatusPara:
                                                                    false,
                                                                buttonAction:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SETUP_APPLICATION2_Container_wl4pbm0r_CA');
                                                                  logFirebaseEvent(
                                                                      'PrimaryRoundedButton_update_page_state');
                                                                  setState(() {
                                                                    _model.setupStep =
                                                                        'Register App';
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 20.0)),
                                                ),
                                              );
                                            } else if (_model.setupStep ==
                                                'Register App') {
                                              return Container(
                                                width: 500.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(25.0, 25.0,
                                                          25.0, 25.0),
                                                  child: Form(
                                                    key: _model.formKey1,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .disabled,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'pw5n0gei' /* Application Details */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                                letterSpacing:
                                                                    0.6,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleLargeFamily),
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'byzs6kuw' /* Please fill in the application... */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.6,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .inputTextFieldAppNameModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          updateOnChange: true,
                                                          child:
                                                              InputTextFieldWidget(
                                                            labelPara:
                                                                'Application Name',
                                                            hintPara:
                                                                'Business Name',
                                                            readOnlyStatusPara:
                                                                false,
                                                            actionPara:
                                                                () async {},
                                                          ),
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .inputTextFieldAppEmailModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          updateOnChange: true,
                                                          child:
                                                              InputTextFieldWidget(
                                                            labelPara:
                                                                'Application Email',
                                                            hintPara:
                                                                'hello@example.com',
                                                            readOnlyStatusPara:
                                                                false,
                                                            actionPara:
                                                                () async {},
                                                          ),
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .countryTextFieldWithFlagAppCountryModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          updateOnChange: true,
                                                          child:
                                                              CountryTextFieldWithFlagWidget(
                                                            labelPara:
                                                                'Which country is your app designed to serve?',
                                                            readOnlyStatusPara:
                                                                false,
                                                            actionPara:
                                                                () async {},
                                                          ),
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .currencyTextFieldAppCurrencyModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          updateOnChange: true,
                                                          child:
                                                              CurrencyTextFieldWidget(
                                                            labelPara:
                                                                'Currency',
                                                            hintPara:
                                                                'Choose your currency',
                                                            valuePara: 'NGN',
                                                            readOnlyStatusPara:
                                                                true,
                                                            filledColorPara:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .disableColor,
                                                            actionPara:
                                                                () async {},
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.00, 0.00),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        20.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .primaryRoundedButtonModel4,
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  PrimaryRoundedButtonWidget(
                                                                buttonText:
                                                                    'Continue',
                                                                buttonWidth:
                                                                    150,
                                                                disableStatusPara:
                                                                    false,
                                                                buttonAction:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SETUP_APPLICATION2_Container_4t54s88y_CA');
                                                                  logFirebaseEvent(
                                                                      'PrimaryRoundedButton_update_page_state');
                                                                  setState(() {
                                                                    _model.setupStep =
                                                                        'Register Owner';
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 20.0)),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            } else if (_model.setupStep ==
                                                'Register Owner') {
                                              return Container(
                                                width: 500.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    25.0,
                                                                    25.0,
                                                                    25.0,
                                                                    25.0),
                                                        child: Form(
                                                          key: _model.formKey2,
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .disabled,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'vpl21ohh' /* Owner Information & First User... */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleLargeFamily,
                                                                          letterSpacing:
                                                                              0.6,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleLargeFamily),
                                                                          lineHeight:
                                                                              1.5,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'dmjuwq7y' /* You are the first user and own... */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodySmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.6,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                          lineHeight:
                                                                              1.5,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        15.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          200.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .textFieldWithLabelFirstnameModel,
                                                                        updateCallback:
                                                                            () =>
                                                                                setState(() {}),
                                                                        updateOnChange:
                                                                            true,
                                                                        child:
                                                                            InputTextFieldWidget(
                                                                          labelPara:
                                                                              'Firstname',
                                                                          hintPara:
                                                                              'Enter firstname',
                                                                          readOnlyStatusPara:
                                                                              false,
                                                                          actionPara:
                                                                              () async {},
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          200.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          wrapWithModel(
                                                                        model: _model
                                                                            .textFieldWithLabelLastnameModel,
                                                                        updateCallback:
                                                                            () =>
                                                                                setState(() {}),
                                                                        updateOnChange:
                                                                            true,
                                                                        child:
                                                                            InputTextFieldWidget(
                                                                          labelPara:
                                                                              'Lastname',
                                                                          hintPara:
                                                                              'Enter lastname',
                                                                          readOnlyStatusPara:
                                                                              false,
                                                                          actionPara:
                                                                              () async {},
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        20.0)),
                                                              ),
                                                              wrapWithModel(
                                                                model: _model
                                                                    .emailTextFieldEmailModel,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                updateOnChange:
                                                                    true,
                                                                child:
                                                                    EmailTextFieldWidget(
                                                                  labelPara:
                                                                      'Email address',
                                                                  hintPara:
                                                                      'Email',
                                                                  readOnlyStatusPara:
                                                                      false,
                                                                  actionPara:
                                                                      () async {},
                                                                ),
                                                              ),
                                                              wrapWithModel(
                                                                model: _model
                                                                    .passwordTextFieldPasswordModel,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                updateOnChange:
                                                                    true,
                                                                child:
                                                                    PasswordTextFieldWidget(
                                                                  labelPara:
                                                                      'Password',
                                                                  readOnlyStatusPara:
                                                                      false,
                                                                  actionPara:
                                                                      () async {},
                                                                ),
                                                              ),
                                                              wrapWithModel(
                                                                model: _model
                                                                    .textFieldWithLabelConfirmPasswordModel,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                updateOnChange:
                                                                    true,
                                                                child:
                                                                    PasswordTextFieldWidget(
                                                                  labelPara:
                                                                      'Confirm password',
                                                                  readOnlyStatusPara:
                                                                      false,
                                                                  actionPara:
                                                                      () async {},
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'SETUP_APPLICATION2_Text_s76mxtai_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Text_update_page_state');
                                                                        setState(
                                                                            () {
                                                                          _model.setupStep =
                                                                              'Register App';
                                                                        });
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'qkwqimau' /* Back to App Information? */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                              decoration: TextDecoration.underline,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    wrapWithModel(
                                                                      model: _model
                                                                          .primaryRoundedButtonModel5,
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          PrimaryRoundedButtonWidget(
                                                                        buttonText:
                                                                            'Continue',
                                                                        buttonWidth:
                                                                            120,
                                                                        buttonHeight:
                                                                            45,
                                                                        disableStatusPara:
                                                                            false,
                                                                        buttonAction:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'SETUP_APPLICATION2_Container_fkqugwg0_CA');
                                                                          logFirebaseEvent(
                                                                              'PrimaryRoundedButton_update_page_state');
                                                                          setState(
                                                                              () {
                                                                            _model.setupStep =
                                                                                'Install';
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 15.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            } else if (_model.setupStep ==
                                                'Install') {
                                              return Container(
                                                width: 500.0,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '1xn5jd6h' /* Install DoorWay */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                                letterSpacing:
                                                                    0.6,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleLargeFamily),
                                                                lineHeight: 1.5,
                                                              ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ts83qqzu' /* You're moments away from creat... */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.6,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                                lineHeight: 1.5,
                                                              ),
                                                    ),
                                                    Image.asset(
                                                      'assets/images/doorway_installing_app.png',
                                                      width: 300.0,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .primaryRoundedButtonLoadingModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          PrimaryRoundedButtonLoadingWidget(
                                                        buttonText:
                                                            'Install Now',
                                                        buttonBgColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        buttonTextColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        buttonWidth: 150,
                                                        buttonHeight: 45,
                                                        disableStatusPara: true,
                                                        disableColorPara:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .disableColor,
                                                        buttonAction: () async {
                                                          logFirebaseEvent(
                                                              'SETUP_APPLICATION2_Container_jioiom7t_CA');
                                                          // Action 1 - Create App Info
                                                          logFirebaseEvent(
                                                              'PrimaryRoundedButtonLoading_Action1-Crea');

                                                          await DwAppRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  createDwAppRecordData(
                                                                appName: _model
                                                                    .inputTextFieldAppNameModel
                                                                    .textController
                                                                    .text,
                                                                appGeneralEmail: _model
                                                                    .inputTextFieldAppEmailModel
                                                                    .textController
                                                                    .text,
                                                                appCountry: _model
                                                                    .countryTextFieldWithFlagAppCountryModel
                                                                    .textFieldCountryController
                                                                    .text,
                                                                appCurrency: _model
                                                                    .currencyTextFieldAppCurrencyModel
                                                                    .textController
                                                                    .text,
                                                              ));
                                                          logFirebaseEvent(
                                                              'PrimaryRoundedButtonLoading_update_page_');
                                                          setState(() {
                                                            _model.setupStep =
                                                                'Completed';
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'SETUP_APPLICATION2_Text_9zni58am_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Text_update_page_state');
                                                        setState(() {
                                                          _model.setupStep =
                                                              'Register Owner';
                                                        });
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '2kg0bc48' /* Back */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 20.0)),
                                                ),
                                              );
                                            } else if (_model.setupStep ==
                                                'Completed') {
                                              return Container(
                                                width: 500.0,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'iz587t3z' /* Installation Completed */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                                letterSpacing:
                                                                    0.6,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleLargeFamily),
                                                                lineHeight: 1.5,
                                                              ),
                                                    ),
                                                    Image.asset(
                                                      'assets/images/Teckaa_pay_check_mark.png',
                                                      width: 150.0,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'dkqi1dcp' /* Your app is now ready. Click t... */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.6,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                                lineHeight: 1.5,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .primaryRoundedButtonModel6,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        updateOnChange: true,
                                                        child:
                                                            PrimaryRoundedButtonWidget(
                                                          buttonText:
                                                              'Go to Dashboard',
                                                          buttonWidth: 150,
                                                          disableStatusPara:
                                                              false,
                                                          buttonAction:
                                                              () async {
                                                            logFirebaseEvent(
                                                                'SETUP_APPLICATION2_Container_gam7jb2g_CA');
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButton_action_block');
                                                            await action_blocks
                                                                .loginAction(
                                                                    context);
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 15.0)),
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                width: 500.0,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'xmble5ka' /* Seamless Installation */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLargeFamily,
                                                                letterSpacing:
                                                                    0.6,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleLargeFamily),
                                                                lineHeight: 1.5,
                                                              ),
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'okldhne9' /* Effortlessly set up our user-f... */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.6,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily),
                                                                lineHeight: 1.5,
                                                              ),
                                                    ),
                                                    Image.asset(
                                                      'assets/images/doorway_welcome_image.png',
                                                      width: 300.0,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .primaryRoundedButtonModel7,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        updateOnChange: true,
                                                        child:
                                                            PrimaryRoundedButtonWidget(
                                                          buttonText:
                                                              'Get Started',
                                                          buttonWidth: 150,
                                                          disableStatusPara:
                                                              false,
                                                          buttonAction:
                                                              () async {
                                                            logFirebaseEvent(
                                                                'SETUP_APPLICATION2_Container_jwr8qo7m_CA');
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButton_update_page_state');
                                                            setState(() {
                                                              _model.setupStep =
                                                                  'Verification';
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 15.0)),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
