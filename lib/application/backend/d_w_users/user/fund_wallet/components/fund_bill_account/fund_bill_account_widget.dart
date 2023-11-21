import '/application/backend/d_w_users/user/fund_wallet/components/modal_payment/modal_payment_widget.dart';
import '/application/components/forms/right_sided_amount_text_field/right_sided_amount_text_field_widget.dart';
import '/application/components/modals/modal_footer_column/modal_footer_column_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'fund_bill_account_model.dart';
export 'fund_bill_account_model.dart';

class FundBillAccountWidget extends StatefulWidget {
  const FundBillAccountWidget({
    Key? key,
    this.paymentChannel,
  }) : super(key: key);

  final String? paymentChannel;

  @override
  _FundBillAccountWidgetState createState() => _FundBillAccountWidgetState();
}

class _FundBillAccountWidgetState extends State<FundBillAccountWidget>
    with TickerProviderStateMixin {
  late FundBillAccountModel _model;

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
    _model = createModel(context, () => FundBillAccountModel());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
        child: Container(
          width: 400.0,
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              wrapWithModel(
                model: _model.modalHeaderModel,
                updateCallback: () => setState(() {}),
                child: ModalHeaderWidget(
                  headerTitlePara: 'Fund Account via ${widget.paymentChannel}',
                  headerTitleTextColorPara:
                      FlutterFlowTheme.of(context).primaryText,
                  headerActionPara: () async {
                    logFirebaseEvent(
                        'FUND_BILL_ACCOUNT_Container_oc78vyzg_CAL');
                    logFirebaseEvent('ModalHeader_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.rightSidedAmountTextFieldModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: RightSidedAmountTextFieldWidget(
                            labelPara: 'Amount',
                            hintPara: '100',
                            sidedText: 'NGN',
                            readOnlyStatusPara: false,
                            actionPara: () async {},
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 30.0)),
                ),
              ),
              wrapWithModel(
                model: _model.modalFooterColumnModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: ModalFooterColumnWidget(
                  cancelTextPara: 'Close',
                  proceedTextPara: 'Pay Now',
                  disableProceedBtnPara: _model.rightSidedAmountTextFieldModel
                              .textController.text ==
                          null ||
                      _model.rightSidedAmountTextFieldModel.textController
                              .text ==
                          '',
                  disableProceedBtnColorPara:
                      FlutterFlowTheme.of(context).disableColor,
                  proceedTextAction: () async {
                    logFirebaseEvent(
                        'FUND_BILL_ACCOUNT_Container_7voxehht_CAL');
                    var _shouldSetState = false;
                    // Action 1 - Validate form
                    logFirebaseEvent('ModalFooterColumn_Action1-Validateform');
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }
                    // Action 1 - Generate refence id
                    logFirebaseEvent(
                        'ModalFooterColumn_Action1-Generaterefenc');
                    setState(() {
                      _model.referenceID =
                          getCurrentTimestamp.microsecondsSinceEpoch.toString();
                    });
                    // Action 2 - Get App name
                    logFirebaseEvent('ModalFooterColumn_Action2-GetAppname');
                    _model.queryAppInfo = await queryDwAppRecordOnce(
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);
                    _shouldSetState = true;
                    // Action 4 - Get Flutterwave Api
                    logFirebaseEvent(
                        'ModalFooterColumn_Action4-GetFlutterwave');
                    _model.getFlutterwaveApiKey =
                        await queryBillpaymentSettingsRecordOnce(
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);
                    _shouldSetState = true;
                    if (widget.paymentChannel == 'Flutterwave') {
                      // Action 4 - Process flutterwave
                      logFirebaseEvent(
                          'ModalFooterColumn_Action4-Processflutter');
                      _model.apiResultForFlutterwave =
                          await FluttewaveApiGroup.standardPaymentCall.call(
                        amount: _model
                            .rightSidedAmountTextFieldModel.textController.text,
                        referenceId: _model.referenceID,
                        customerEmail: currentUserEmail,
                        customerPhonenumber: currentPhoneNumber,
                        customerFullname:
                            '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                        currency: _model.getFlutterwaveApiKey?.pluginCurrency,
                        appName: _model.queryAppInfo?.appName,
                        redirectUrl: _model
                            .getFlutterwaveApiKey?.providerPaymentRedirectUrl,
                        appSquareLogo: _model.queryAppInfo?.appLightSquareLogo,
                        apiKey:
                            _model.getFlutterwaveApiKey?.pluginProviderApiKey,
                      );
                      _shouldSetState = true;
                      if ((_model.apiResultForFlutterwave?.succeeded ?? true)) {
                        logFirebaseEvent('ModalFooterColumn_bottom_sheet');
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
                              child: ModalPaymentWidget(
                                paymentLink: getJsonField(
                                  (_model.apiResultForFlutterwave?.jsonBody ??
                                      ''),
                                  r'''$.data.link''',
                                ).toString(),
                              ),
                            ));
                          },
                        ).then((value) => safeSetState(() {}));

                        logFirebaseEvent('ModalFooterColumn_backend_call');
                        _model.verifyFlutterwavePayment =
                            await FluttewaveApiGroup.verifyStandardPaymentCall
                                .call(
                          referenceId: _model.referenceID,
                        );
                        _shouldSetState = true;
                        logFirebaseEvent('ModalFooterColumn_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                                child: AlertDialog(
                              title: Text('Transaction info'),
                              content: Text(
                                  (_model.verifyFlutterwavePayment?.jsonBody ??
                                          '')
                                      .toString()),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            ));
                          },
                        );
                        if (_shouldSetState) setState(() {});
                        return;
                      } else {
                        logFirebaseEvent('ModalFooterColumn_action_block');
                        await action_blocks.alertError(
                          context,
                          descPara: 'Error',
                        );
                        if (_shouldSetState) setState(() {});
                        return;
                      }
                    } else if (widget.paymentChannel == 'Paystack') {
                      if (_shouldSetState) setState(() {});
                      return;
                    } else {
                      if (_shouldSetState) setState(() {});
                      return;
                    }

                    if (_shouldSetState) setState(() {});
                  },
                ),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
