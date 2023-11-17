import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/forms/country_text_field_with_flag/country_text_field_with_flag_widget.dart';
import '/application/components/forms/currency_text_field/currency_text_field_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'set_up_application_comp_model.dart';
export 'set_up_application_comp_model.dart';

class SetUpApplicationCompWidget extends StatefulWidget {
  const SetUpApplicationCompWidget({
    Key? key,
    String? parameter1,
  })  : this.parameter1 = parameter1 ?? 'Set Up',
        super(key: key);

  final String parameter1;

  @override
  _SetUpApplicationCompWidgetState createState() =>
      _SetUpApplicationCompWidgetState();
}

class _SetUpApplicationCompWidgetState extends State<SetUpApplicationCompWidget>
    with TickerProviderStateMixin {
  late SetUpApplicationCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetUpApplicationCompModel());

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

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).overlay,
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.00, 0.00),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'zvnd831y' /* Set Up Onboarding */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
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
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
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
                                                    key: _model.formKey,
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
                                                            'vd75swzs' /* Application Details */,
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
                                                            'z58luus3' /* Please fill in the application... */,
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
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SET_UP_APPLICATION_Row_dkpx7xpi_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Row_update_component_state');
                                                                  setState(() {
                                                                    _model.setupStep =
                                                                        'Set Up';
                                                                  });
                                                                },
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '14necxvc' /* Restart */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelSmallFamily,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                          ),
                                                                    ),
                                                                    Icon(
                                                                      FFIcons
                                                                          .krefresh,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          10.0)),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.00,
                                                                        0.00),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .primaryRoundedButtonModel1,
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
                                                                    disableStatusPara: (_model.inputTextFieldAppNameModel.textController.text ==
                                                                                null ||
                                                                            _model.inputTextFieldAppNameModel.textController.text ==
                                                                                '') ||
                                                                        (_model.inputTextFieldAppEmailModel.textController.text ==
                                                                            ''),
                                                                    disableColorPara:
                                                                        FlutterFlowTheme.of(context)
                                                                            .disableColor,
                                                                    buttonAction:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'SET_UP_APPLICATION_Container_b3gj5xls_CA');
                                                                      logFirebaseEvent(
                                                                          'PrimaryRoundedButton_update_component_st');
                                                                      setState(
                                                                          () {
                                                                        _model.setupStep =
                                                                            'Configure';
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 20.0)),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            } else if (_model.setupStep ==
                                                'Configure') {
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
                                                        '46lqxoc7' /* Configure Your App */,
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
                                                        'avvo9696' /* You're just moments away from ... */,
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
                                                            'Begin Setup',
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
                                                        disableStatusPara:
                                                            false,
                                                        disableColorPara:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .disableColor,
                                                        buttonAction: () async {
                                                          logFirebaseEvent(
                                                              'SET_UP_APPLICATION_Container_3k5ch28g_CA');
                                                          final firestoreBatch =
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .batch();
                                                          try {
                                                            // Action 1 - Create App Info
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_Action1-Crea');
                                                            unawaited(
                                                              () async {
                                                                firestoreBatch
                                                                    .set(
                                                                        DwAppRecord
                                                                            .collection
                                                                            .doc(),
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
                                                                          appTheme:
                                                                              'Abuja',
                                                                        ));
                                                              }(),
                                                            );
                                                            // Action 2 - Create Blog Settings
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_Action2-Crea');

                                                            firestoreBatch.set(
                                                                DwPostsSettingsRecord
                                                                    .collection
                                                                    .doc(),
                                                                createDwPostsSettingsRecordData(
                                                                  blogName:
                                                                      '${_model.inputTextFieldAppNameModel.textController.text}Blog',
                                                                  blogTitle:
                                                                      'Welcome to ${_model.inputTextFieldAppNameModel.textController.text}Blog',
                                                                  blogDesc:
                                                                      'Explore the fascinating world of cryptocurrencies and stay up to date with the latest trends, news, and insights. Our blog is your go-to resource for valuable information, expert opinions, and educational content about digital assets, blockchain technology, trading strategies, and more.',
                                                                  blogWidth:
                                                                      1100,
                                                                ));
                                                            // Action 2 - Create First Post
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_Action2-Crea');

                                                            firestoreBatch.set(
                                                                DwPostsRecord
                                                                    .collection
                                                                    .doc(),
                                                                createDwPostsRecordData(
                                                                  createdAt:
                                                                      getCurrentTimestamp,
                                                                  modifiedAt:
                                                                      getCurrentTimestamp,
                                                                  userRef:
                                                                      currentUserReference,
                                                                  postType:
                                                                      'post',
                                                                  postPublishStatus:
                                                                      'Published',
                                                                  postTitle:
                                                                      'Hello World',
                                                                  postDescription:
                                                                      'Experience the simplicity of our innovative app, designed to bring the world to your fingertips. Say \'Hello\' to a new era of possibilities as you explore, connect, and engage effortlessly.',
                                                                ));
                                                            // Action 3 - Email Templates
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_Action3-Emai');

                                                            firestoreBatch.set(
                                                                DwEmailTemplatesRecord
                                                                    .collection
                                                                    .doc(),
                                                                createDwEmailTemplatesRecordData(
                                                                  brandName: _model
                                                                      .inputTextFieldAppNameModel
                                                                      .textController
                                                                      .text,
                                                                  fromEmail: _model
                                                                      .inputTextFieldAppEmailModel
                                                                      .textController
                                                                      .text,
                                                                  footerText: _model
                                                                      .inputTextFieldAppNameModel
                                                                      .textController
                                                                      .text,
                                                                  brandColor:
                                                                      '#0E6FFB',
                                                                  backgroundColor:
                                                                      '#F1F4F8',
                                                                  contentBackgroundColor:
                                                                      '#FFFFFF',
                                                                  contentTextColor:
                                                                      '#000',
                                                                ));
                                                            // Action 4 - Create BillPayments Settings
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_Action4-Crea');

                                                            firestoreBatch.set(
                                                                BillpaymentSettingsRecord
                                                                    .collection
                                                                    .doc(),
                                                                createBillpaymentSettingsRecordData(
                                                                  createdAt:
                                                                      getCurrentTimestamp,
                                                                ));
                                                            // Action 4 - Create Crypto Settings
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_Action4-Crea');

                                                            firestoreBatch.set(
                                                                CryptoSettingsRecord
                                                                    .collection
                                                                    .doc(),
                                                                createCryptoSettingsRecordData(
                                                                  createdAt:
                                                                      getCurrentTimestamp,
                                                                ));
                                                            // Action 4 - Create eCommerce Settings
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_Action4-Crea');

                                                            firestoreBatch.set(
                                                                EcommerceSettingsRecord
                                                                    .collection
                                                                    .doc(),
                                                                createEcommerceSettingsRecordData(
                                                                  createdAt:
                                                                      getCurrentTimestamp,
                                                                ));
                                                            // Action 4 - Create Fintech Settings
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_Action4-Crea');

                                                            firestoreBatch.set(
                                                                FintechSettingsRecord
                                                                    .collection
                                                                    .doc(),
                                                                createFintechSettingsRecordData(
                                                                  createdAt:
                                                                      getCurrentTimestamp,
                                                                ));
                                                            // Action 4 - Create Giftcards Settings
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_Action4-Crea');

                                                            firestoreBatch.set(
                                                                GiftcardSettingsRecord
                                                                    .collection
                                                                    .doc(),
                                                                createGiftcardSettingsRecordData(
                                                                  createdAt:
                                                                      getCurrentTimestamp,
                                                                ));
                                                            // Action 4 - Create App Email Api
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_Action4-Crea');

                                                            firestoreBatch.set(
                                                                DwAppEmailApiRecord
                                                                    .collection
                                                                    .doc(),
                                                                createDwAppEmailApiRecordData(
                                                                  createdAt:
                                                                      getCurrentTimestamp,
                                                                ));
                                                            // Action 4 - Create App Chat Api
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_Action4-Crea');

                                                            firestoreBatch.set(
                                                                DwAppLiveChatApiRecord
                                                                    .collection
                                                                    .doc(),
                                                                createDwAppLiveChatApiRecordData(
                                                                  createdAt:
                                                                      getCurrentTimestamp,
                                                                ));
                                                            // Action 4 - Create App SMS Api
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_Action4-Crea');

                                                            firestoreBatch.set(
                                                                DwAppSmsApiRecord
                                                                    .collection
                                                                    .doc(),
                                                                createDwAppSmsApiRecordData(
                                                                  createdAt:
                                                                      getCurrentTimestamp,
                                                                ));
                                                            // Action 4 - Create App Help Api
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_Action4-Crea');

                                                            firestoreBatch.set(
                                                                DwAppHelpCenterRecord
                                                                    .collection
                                                                    .doc(),
                                                                createDwAppHelpCenterRecordData(
                                                                  createdAt:
                                                                      getCurrentTimestamp,
                                                                ));
                                                            // Action 4 - Create App Photo Api
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_Action4-Crea');

                                                            firestoreBatch.set(
                                                                AppPhotosApiRecord
                                                                    .collection
                                                                    .doc(),
                                                                createAppPhotosApiRecordData(
                                                                  createdAt:
                                                                      getCurrentTimestamp,
                                                                ));
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_custom_actio');
                                                            await actions
                                                                .createAppBillProviders();
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_custom_actio');
                                                            await actions
                                                                .createAppBillServices();
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_custom_actio');
                                                            await actions
                                                                .createAppCustomEmailTemplates();
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_custom_actio');
                                                            await actions
                                                                .createAppLinks();
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_custom_actio');
                                                            await actions
                                                                .createAppPermissions();
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_custom_actio');
                                                            await actions
                                                                .createAppPlugins();
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_custom_actio');
                                                            await actions
                                                                .createAppRecipients();
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_custom_actio');
                                                            await actions
                                                                .createAppThemes();
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_update_compo');
                                                            setState(() {
                                                              _model.setupStep =
                                                                  'Completed';
                                                            });
                                                          } finally {
                                                            await firestoreBatch
                                                                .commit();
                                                          }
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
                                                            'SET_UP_APPLICATION_Text_uhuoijzh_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Text_update_component_state');
                                                        setState(() {
                                                          _model.setupStep =
                                                              'Set Up';
                                                        });
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'igkebnfq' /* Back */,
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
                                                        'yfs57tcm' /* Setup Successfully Completed */,
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
                                                        '0wq8sazf' /* Your app is now ready. Click t... */,
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
                                                            .primaryRoundedButtonModel2,
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
                                                                'SET_UP_APPLICATION_Container_ck3vgati_CA');
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButton_navigate_to');

                                                            context.pushNamed(
                                                                'Dashboard');
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
                                                        'fslkvsyt' /* Seamless Installation */,
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
                                                        'x7591rib' /* Effortlessly set up our user-f... */,
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
                                                            .primaryRoundedButtonModel3,
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
                                                                'SET_UP_APPLICATION_Container_khvmvvu9_CA');
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButton_update_component_st');
                                                            setState(() {
                                                              _model.setupStep =
                                                                  'Register App';
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
                        ),
                      ],
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
