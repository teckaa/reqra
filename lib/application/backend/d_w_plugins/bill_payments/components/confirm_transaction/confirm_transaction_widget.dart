import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_transaction_model.dart';
export 'confirm_transaction_model.dart';

class ConfirmTransactionWidget extends StatefulWidget {
  const ConfirmTransactionWidget({
    Key? key,
    this.packageDetails,
    this.customerNumber,
    this.billerCode,
    this.itemCode,
    this.name,
    this.serviceProvider,
    String? serviceType,
    double? amount,
    this.shortName,
    int? providerFee,
    String? country,
    String? currency,
  })  : this.serviceType = serviceType ?? 'Airtime',
        this.amount = amount ?? 0.0,
        this.providerFee = providerFee ?? 0,
        this.country = country ?? 'NG',
        this.currency = currency ?? 'NGN',
        super(key: key);

  final dynamic packageDetails;
  final String? customerNumber;
  final String? billerCode;
  final String? itemCode;
  final String? name;
  final String? serviceProvider;
  final String serviceType;
  final double amount;
  final String? shortName;
  final int providerFee;
  final String country;
  final String currency;

  @override
  _ConfirmTransactionWidgetState createState() =>
      _ConfirmTransactionWidgetState();
}

class _ConfirmTransactionWidgetState extends State<ConfirmTransactionWidget>
    with TickerProviderStateMixin {
  late ConfirmTransactionModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 120.ms,
          begin: Offset(0.0, 45.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmTransactionModel());

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

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Container(
        width: 450.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 40.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
              spreadRadius: 1.0,
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              wrapWithModel(
                model: _model.modalHeaderModel,
                updateCallback: () => setState(() {}),
                child: ModalHeaderWidget(
                  headerTitlePara: 'Confirm Transaction',
                  headerTitleTextColorPara:
                      FlutterFlowTheme.of(context).primaryText,
                  headerActionPara: () async {
                    logFirebaseEvent(
                        'CONFIRM_TRANSACTION_Container_3c9mf9bb_C');
                    logFirebaseEvent('ModalHeader_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 0.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '8cuiu4ke' /* Amount */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                    Text(
                                      '${widget.currency} ${formatNumber(
                                        widget.amount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      )}',
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge,
                                    ),
                                  ].divide(SizedBox(height: 3.0)),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'q7q28ivz' /* Customer Number */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily),
                                        ),
                                  ),
                                  Text(
                                    widget.customerNumber!,
                                    textAlign: TextAlign.end,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'k1vy67qb' /* Product Name */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily),
                                        ),
                                  ),
                                  Text(
                                    widget.shortName!,
                                    textAlign: TextAlign.end,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ijrg9grr' /* Service Type */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily),
                                        ),
                                  ),
                                  Text(
                                    widget.serviceType,
                                    textAlign: TextAlign.end,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'pqtc2w72' /* Provider */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily),
                                        ),
                                  ),
                                  Text(
                                    widget.serviceProvider!,
                                    textAlign: TextAlign.end,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'xto9hzje' /* Provider Fee */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily),
                                        ),
                                  ),
                                  Text(
                                    '${widget.currency} ${widget.providerFee.toString()}',
                                    textAlign: TextAlign.end,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(height: 20.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).accent4,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (valueOrDefault(
                                currentUserDocument?.transactionPin, '') !=
                            null &&
                        valueOrDefault(
                                currentUserDocument?.transactionPin, '') !=
                            '')
                      AuthUserStreamWidget(
                        builder: (context) => Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'f8kfhs7j' /* Tap to enter your Transaction ... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                            ),
                            PinCodeTextField(
                              autoDisposeControllers: false,
                              appContext: context,
                              length: 4,
                              textStyle:
                                  FlutterFlowTheme.of(context).headlineSmall,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              enableActiveFill: false,
                              autoFocus: false,
                              enablePinAutofill: false,
                              errorTextSpace: 16.0,
                              showCursor: true,
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              obscureText: true,
                              obscuringCharacter: '*',
                              hintCharacter: '*',
                              keyboardType: TextInputType.number,
                              pinTheme: PinTheme(
                                fieldHeight: 44.0,
                                fieldWidth: 44.0,
                                borderWidth: 2.0,
                                borderRadius: BorderRadius.circular(8.0),
                                shape: PinCodeFieldShape.box,
                                activeColor:
                                    FlutterFlowTheme.of(context).accent2,
                                inactiveColor:
                                    FlutterFlowTheme.of(context).lineColor,
                                selectedColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                activeFillColor:
                                    FlutterFlowTheme.of(context).accent2,
                                inactiveFillColor:
                                    FlutterFlowTheme.of(context).lineColor,
                                selectedFillColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                              controller: _model.pinCodeController,
                              onChanged: (_) {},
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: _model.pinCodeControllerValidator
                                  .asValidator(context),
                            ),
                          ].divide(SizedBox(height: 20.0)),
                        ),
                      ),
                    AuthUserStreamWidget(
                      builder: (context) => wrapWithModel(
                        model: _model.primaryButtonLoadingModel,
                        updateCallback: () => setState(() {}),
                        child: PrimaryButtonLoadingWidget(
                          buttonText: 'Pay ',
                          buttonWidth: 450,
                          buttonHeight: 45,
                          disableStatusPara: valueOrDefault(
                                          currentUserDocument?.transactionPin,
                                          '') !=
                                      null &&
                                  valueOrDefault(
                                          currentUserDocument?.transactionPin,
                                          '') !=
                                      ''
                              ? (_model.pinCodeController!.text == null ||
                                  _model.pinCodeController!.text == '')
                              : false,
                          disableColorPara:
                              FlutterFlowTheme.of(context).disableColor,
                          buttonAction: () async {
                            logFirebaseEvent(
                                'CONFIRM_TRANSACTION_Container_270ye88l_C');
                            var _shouldSetState = false;
                            final firestoreBatch =
                                FirebaseFirestore.instance.batch();
                            try {
                              // Action 2 - Get app details
                              logFirebaseEvent(
                                  'PrimaryButtonLoading_Action2-Getappdetai');
                              _model.getAppInfo = await queryDwAppRecordOnce(
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _shouldSetState = true;
                              // Action 1 - Get Bill Key
                              logFirebaseEvent(
                                  'PrimaryButtonLoading_Action1-GetBillKey');
                              _model.getBillKey =
                                  await queryBillpaymentSettingsRecordOnce(
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              _shouldSetState = true;
                              if ((valueOrDefault(
                                              currentUserDocument
                                                  ?.transactionPin,
                                              '') !=
                                          null &&
                                      valueOrDefault(
                                              currentUserDocument
                                                  ?.transactionPin,
                                              '') !=
                                          '') &&
                                  (valueOrDefault(
                                          currentUserDocument?.transactionPin,
                                          '') ==
                                      _model.pinCodeController!.text)) {
                                // Action 3 - Validate number
                                logFirebaseEvent(
                                    'PrimaryButtonLoading_Action3-Validatenum');
                                _model.apiResultValidatePhoneNumber =
                                    await FluttewaveApiGroup
                                        .validateCustomerCall
                                        .call(
                                  itemCode: 'AA',
                                  billerCode: 'QQ',
                                  customerNumber: 'AAA',
                                  apiKey:
                                      _model.getBillKey?.pluginProviderApiKey,
                                );
                                _shouldSetState = true;
                                if ((_model.apiResultValidatePhoneNumber
                                        ?.succeeded ??
                                    true)) {
                                  // Action 4 - Validate and proceed
                                  logFirebaseEvent(
                                      'PrimaryButtonLoading_Action4-Validateand');
                                  _model.apiResultCreateBill =
                                      await FluttewaveApiGroup.createBillCall
                                          .call(
                                    customer: 'FFF',
                                    amount: 44,
                                    type: 'FFF',
                                    referenceId: getCurrentTimestamp
                                        .microsecondsSinceEpoch
                                        .toString(),
                                    apiKey:
                                        _model.getBillKey?.pluginProviderApiKey,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.apiResultCreateBill?.succeeded ??
                                      true)) {
                                    // Action 5 - Create bill
                                    logFirebaseEvent(
                                        'PrimaryButtonLoading_Action5-Createbill');

                                    firestoreBatch.set(
                                        BillpaymentOrdersRecord.collection
                                            .doc(),
                                        createBillpaymentOrdersRecordData(
                                          createdAt: getCurrentTimestamp,
                                          userRef: currentUserReference,
                                          serviceType: 'Airtime',
                                          serviceProvider: '345325',
                                          customerNumber: 455,
                                          amount: 44,
                                          currency: 'NGN',
                                          country: 'NG',
                                        ));
                                    // Action 6 - Update account balance
                                    logFirebaseEvent(
                                        'PrimaryButtonLoading_Action6-Updateaccou');

                                    firestoreBatch.update(
                                        currentUserReference!,
                                        createUsersRecordData(
                                          accountBalance: valueOrDefault(
                                                  currentUserDocument
                                                      ?.accountBalance,
                                                  0.0) -
                                              widget.amount,
                                        ));
                                    // Action 7 - Redirect to confirmation page
                                    logFirebaseEvent(
                                        'PrimaryButtonLoading_Action7-Redirecttoc');

                                    context.pushNamed(
                                      'OrderSuccessfulBill',
                                      queryParameters: {
                                        'typeOfRecipient': serializeParam(
                                          'Phone Number',
                                          ParamType.String,
                                        ),
                                        'productType': serializeParam(
                                          'DD',
                                          ParamType.String,
                                        ),
                                        'customerNumber': serializeParam(
                                          '444',
                                          ParamType.String,
                                        ),
                                        'amount': serializeParam(
                                          '44',
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );

                                    if (valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.emailNotification,
                                            false) ==
                                        true) {
                                      // Action 8 - Notify user via Email
                                      logFirebaseEvent(
                                          'PrimaryButtonLoading_Action8-Notifyuserv');
                                      await BrevoApiGroup.transactionEmailCall
                                          .call(
                                        appName: _model.getAppInfo?.appName,
                                        appEmail:
                                            _model.getAppInfo?.appGeneralEmail,
                                        customerName: currentUserDisplayName,
                                        customerEmail: currentUserEmail,
                                        subject: 'Transaction Notification',
                                        templateId: 5,
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else if (valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.pushNotification,
                                            false) ==
                                        true) {
                                      // Action 9 - Notify user via Push
                                      logFirebaseEvent(
                                          'PrimaryButtonLoading_Action9-Notifyuserv');
                                      triggerPushNotification(
                                        notificationTitle:
                                            'Transaction Notification',
                                        notificationText:
                                            'You just recharges  - ${widget.amount.toString()}',
                                        notificationSound: 'default',
                                        userRefs: [currentUserReference!],
                                        initialPageName: 'Dashboard',
                                        parameterData: {},
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                  } else {
                                    // Action 10 - Error and not valid
                                    logFirebaseEvent(
                                        'PrimaryButtonLoading_Action10-Errorandno');
                                    await action_blocks.alertError(
                                      context,
                                      descPara: 'Invalid Number',
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                } else {
                                  // Action 11 - Not valid
                                  logFirebaseEvent(
                                      'PrimaryButtonLoading_Action11-Notvalid');
                                  await action_blocks.alertError(
                                    context,
                                    descPara: 'Invalid Number',
                                  );
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                              } else {
                                logFirebaseEvent(
                                    'PrimaryButtonLoading_action_block');
                                await action_blocks.alertError(
                                  context,
                                  descPara: 'Incorrect pin',
                                );
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            } finally {
                              await firestoreBatch.commit();
                            }

                            if (_shouldSetState) setState(() {});
                          },
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
