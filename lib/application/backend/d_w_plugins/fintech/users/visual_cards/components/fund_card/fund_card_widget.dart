import '/application/components/forms/right_sided_amount_text_field/right_sided_amount_text_field_widget.dart';
import '/application/components/modals/modal_footer_row/modal_footer_row_widget.dart';
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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fund_card_model.dart';
export 'fund_card_model.dart';

class FundCardWidget extends StatefulWidget {
  const FundCardWidget({Key? key}) : super(key: key);

  @override
  _FundCardWidgetState createState() => _FundCardWidgetState();
}

class _FundCardWidgetState extends State<FundCardWidget>
    with TickerProviderStateMixin {
  late FundCardModel _model;

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
    _model = createModel(context, () => FundCardModel());

    _model.textController ??= TextEditingController();
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
                  headerTitlePara: 'Fund Card',
                  headerTitleTextSizePara: 13,
                  headerTitleTextColorPara:
                      FlutterFlowTheme.of(context).primaryText,
                  headerActionPara: () async {
                    logFirebaseEvent('FUND_CARD_Container_3quvau50_CALLBACK');
                    logFirebaseEvent('ModalHeader_close_dialog,_drawer,_etc');
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
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: AuthUserStreamWidget(
                              builder: (context) => wrapWithModel(
                                model: _model
                                    .rightSidedAmountTextFieldAccountBalanceModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: RightSidedAmountTextFieldWidget(
                                  labelPara: 'Balance to Fund From',
                                  hintPara: '100',
                                  valuePara: formatNumber(
                                    valueOrDefault(
                                        currentUserDocument?.accountBalance,
                                        0.0),
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                  ),
                                  sidedText: 'NGN',
                                  readOnlyStatusPara: true,
                                  actionPara: () async {
                                    logFirebaseEvent(
                                        'FUND_CARD_RightSidedAmountTextField-Acco');
                                    logFirebaseEvent(
                                        'RightSidedAmountTextField-AccountBalance');
                                    setState(() {
                                      _model.amountToFund = double.tryParse(_model
                                          .rightSidedAmountTextFieldAccountBalanceModel
                                          .textController
                                          .text);
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: wrapWithModel(
                              model:
                                  _model.rightSidedAmountTextFieldAmountModel,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: RightSidedAmountTextFieldWidget(
                                labelPara: 'Amount',
                                hintPara: '100',
                                sidedText: 'NGN',
                                readOnlyStatusPara: false,
                                actionPara: () async {
                                  logFirebaseEvent(
                                      'FUND_CARD_RightSidedAmountTextField-Amou');
                                  logFirebaseEvent(
                                      'RightSidedAmountTextField-Amount_update_');
                                  setState(() {
                                    _model.amountToFund = double.tryParse(_model
                                        .rightSidedAmountTextFieldAmountModel
                                        .textController
                                        .text);
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 0),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: valueOrDefault<String>(
                                    (valueOrDefault(
                                                currentUserDocument
                                                    ?.accountBalance,
                                                0.0) +
                                            double.parse(_model
                                                .rightSidedAmountTextFieldAmountModel
                                                .textController
                                                .text))
                                        .toString(),
                                    '0',
                                  ),
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 15.0)),
                      ),
                    ),
                  ].divide(SizedBox(height: 30.0)),
                ),
              ),
              wrapWithModel(
                model: _model.modalFooterRowModel,
                updateCallback: () => setState(() {}),
                child: ModalFooterRowWidget(
                  cancelTextPara: 'Cancel',
                  proceedTextPara: 'Fund Card',
                  proceedActionPara: () async {
                    logFirebaseEvent('FUND_CARD_Container_zjmjp9o1_CALLBACK');
                    final firestoreBatch = FirebaseFirestore.instance.batch();
                    try {
                      logFirebaseEvent('ModalFooterRow_validate_form');
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      if ((valueOrDefault(
                                  currentUserDocument?.accountBalance, 0.0) >=
                              _model.amountToFund!) ||
                          (_model.rightSidedAmountTextFieldAmountModel
                                  .textController.text ==
                              '0')) {
                        // Action 2 - FetchApps
                        logFirebaseEvent('ModalFooterRow_Action2-FetchApps');
                        _model.getAppInfo = await queryDwAppRecordOnce(
                          singleRecord: true,
                        ).then((s) => s.firstOrNull);
                        // Action 3 - CreateTransaction
                        logFirebaseEvent(
                            'ModalFooterRow_Action3-CreateTransaction');

                        firestoreBatch.set(
                            FintechTransactionsRecord.collection.doc(),
                            createFintechTransactionsRecordData(
                              createdAt: getCurrentTimestamp,
                              userRef: currentUserReference,
                              amount: double.tryParse(_model
                                  .rightSidedAmountTextFieldAmountModel
                                  .textController
                                  .text),
                              from: 'Account Balance',
                              to: 'Card',
                              paymentMethod: 'Swap',
                            ));
                        // Action 2 - UpdateCardBalance
                        logFirebaseEvent(
                            'ModalFooterRow_Action2-UpdateCardBalance');

                        firestoreBatch.update(
                            currentUserReference!,
                            createUsersRecordData(
                              cardAccountBalance: valueOrDefault<double>(
                                valueOrDefault(
                                        currentUserDocument?.cardAccountBalance,
                                        0.0) +
                                    double.parse(_model
                                        .rightSidedAmountTextFieldAccountBalanceModel
                                        .textController
                                        .text),
                                0.0,
                              ),
                            ));
                        // Action 3 - UpdateAccountBalance
                        logFirebaseEvent(
                            'ModalFooterRow_Action3-UpdateAccountBala');

                        firestoreBatch.update(
                            currentUserReference!,
                            createUsersRecordData(
                              accountBalance: valueOrDefault(
                                      currentUserDocument?.accountBalance,
                                      0.0) -
                                  double.parse(_model
                                      .rightSidedAmountTextFieldAccountBalanceModel
                                      .textController
                                      .text),
                            ));
                        // Action 4 - NotifyUser
                        logFirebaseEvent('ModalFooterRow_Action4-NotifyUser');
                        await BrevoApiGroup.transactionEmailCall.call(
                          appName: _model.getAppInfo?.appName,
                          appEmail: _model.getAppInfo?.appAlertEmail,
                          customerName:
                              '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                          customerEmail: currentUserEmail,
                          subject: 'You have successful fund your card',
                          templateId: 3,
                        );
                        logFirebaseEvent('ModalFooterRow_navigate_to');

                        context.pushNamed(
                          'TransferSuccessful',
                          queryParameters: {
                            'successMessage': serializeParam(
                              'Card Funded Successful',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      } else {
                        logFirebaseEvent('ModalFooterRow_action_block');
                        await action_blocks.alertError(
                          context,
                          descPara: 'Insufficient Fund',
                        );
                      }
                    } finally {
                      await firestoreBatch.commit();
                    }

                    setState(() {});
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
