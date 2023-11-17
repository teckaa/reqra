import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/modals/modal_footer_column/modal_footer_column_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirm_transfer_details_model.dart';
export 'confirm_transfer_details_model.dart';

class ConfirmTransferDetailsWidget extends StatefulWidget {
  const ConfirmTransferDetailsWidget({
    Key? key,
    this.userTransferRef,
    this.amount,
    this.note,
  }) : super(key: key);

  final DocumentReference? userTransferRef;
  final int? amount;
  final String? note;

  @override
  _ConfirmTransferDetailsWidgetState createState() =>
      _ConfirmTransferDetailsWidgetState();
}

class _ConfirmTransferDetailsWidgetState
    extends State<ConfirmTransferDetailsWidget> {
  late ConfirmTransferDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmTransferDetailsModel());

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
        width: 400.0,
        constraints: BoxConstraints(
          maxWidth: 570.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).lineColor,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'rx93wnz3' /* You are sending */,
                    ),
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelLargeFamily,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).labelLargeFamily),
                        ),
                  ),
                  AuthUserStreamWidget(
                    builder: (context) => Text(
                      '${valueOrDefault(currentUserDocument?.currency, '')} ${formatNumber(
                        widget.amount,
                        formatType: FormatType.decimal,
                        decimalType: DecimalType.automatic,
                      )}',
                      textAlign: TextAlign.end,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleLargeFamily,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleLargeFamily),
                          ),
                    ),
                  ),
                ].divide(SizedBox(height: 5.0)),
              ),
            ),
            Divider(
              height: 2.0,
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).lineColor,
            ),
            StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(widget.userTransferRef!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: LinearProgressIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  );
                }
                final columnUsersRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(100.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 2.0,
                                  ),
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => wrapWithModel(
                                      model: _model.photoGridModel1,
                                      updateCallback: () => setState(() {}),
                                      child: PhotoGridWidget(
                                        photoWidth: 45,
                                        photoHeight: 45,
                                        photoPath: currentUserPhoto,
                                        photoName: functions
                                            .getFirstLetterOfString(
                                                valueOrDefault(
                                                    currentUserDocument
                                                        ?.firstName,
                                                    '')),
                                        photoNameFontSize: 18,
                                        bgColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Stack(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Container(
                                      width: 120.0,
                                      height: 4.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 44.0,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Icon(
                                      Icons.keyboard_double_arrow_right_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 32.0,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(100.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).accent3,
                                    width: 2.0,
                                  ),
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: wrapWithModel(
                                    model: _model.photoGridModel2,
                                    updateCallback: () => setState(() {}),
                                    child: PhotoGridWidget(
                                      photoWidth: 45,
                                      photoHeight: 45,
                                      photoPath: columnUsersRecord.photoUrl,
                                      photoName:
                                          functions.getFirstLetterOfString(
                                              columnUsersRecord.firstName),
                                      photoNameFontSize: 18,
                                      bgColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'd3ilnhrt' /* Recipient */,
                          ),
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                        Text(
                          '${columnUsersRecord.firstName} ${columnUsersRecord.lastName}',
                          textAlign: TextAlign.end,
                          style: FlutterFlowTheme.of(context).headlineSmall,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Text(
                            columnUsersRecord.accountNumber.toString(),
                            textAlign: TextAlign.end,
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'v13zndpu' /* Transaction Pin */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 13.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        PinCodeTextField(
                          autoDisposeControllers: false,
                          appContext: context,
                          length: 4,
                          textStyle: FlutterFlowTheme.of(context).bodyLarge,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          enableActiveFill: true,
                          autoFocus: true,
                          enablePinAutofill: false,
                          errorTextSpace: 16.0,
                          showCursor: true,
                          cursorColor: FlutterFlowTheme.of(context).primary,
                          obscureText: true,
                          obscuringCharacter: '●',
                          hintCharacter: '-',
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            fieldHeight: 44.0,
                            fieldWidth: 44.0,
                            borderWidth: 2.0,
                            borderRadius: BorderRadius.circular(5.0),
                            shape: PinCodeFieldShape.box,
                            activeColor: FlutterFlowTheme.of(context).overlay,
                            inactiveColor:
                                FlutterFlowTheme.of(context).lineColor,
                            selectedColor: FlutterFlowTheme.of(context).primary,
                            activeFillColor:
                                FlutterFlowTheme.of(context).overlay,
                            inactiveFillColor:
                                FlutterFlowTheme.of(context).lineColor,
                            selectedFillColor:
                                FlutterFlowTheme.of(context).primary,
                          ),
                          controller: _model.pinCodeController,
                          onChanged: (_) {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: _model.pinCodeControllerValidator
                              .asValidator(context),
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                    wrapWithModel(
                      model: _model.modalFooterColumnModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: ModalFooterColumnWidget(
                        cancelTextPara: 'Cancel Transfer',
                        proceedTextPara: 'Confirm Transfer',
                        proceedTextAction: () async {
                          logFirebaseEvent(
                              'CONFIRM_TRANSFER_DETAILS_Container_40qbs');
                          final firestoreBatch =
                              FirebaseFirestore.instance.batch();
                          try {
                            if (valueOrDefault(
                                    currentUserDocument?.transactionPin, '') ==
                                _model.pinCodeController!.text) {
                              // Action 1 - FetchUsers
                              logFirebaseEvent(
                                  'ModalFooterColumn_Action1-FetchUsers');
                              await queryUsersRecordOnce(
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              // Action 2 - FetchApps
                              logFirebaseEvent(
                                  'ModalFooterColumn_Action2-FetchApps');
                              _model.getAppInfo = await queryDwAppRecordOnce(
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              // Action 3 - CreateTransaction
                              logFirebaseEvent(
                                  'ModalFooterColumn_Action3-CreateTransact');

                              firestoreBatch.set(
                                  FintechTransactionsRecord.collection.doc(),
                                  createFintechTransactionsRecordData(
                                    createdAt: getCurrentTimestamp,
                                    userRef: currentUserReference,
                                    amount: widget.amount?.toDouble(),
                                    from: valueOrDefault(
                                            currentUserDocument?.accountNumber,
                                            0)
                                        .toString(),
                                    to: columnUsersRecord.accountNumber
                                        .toString(),
                                    paymentMethod: 'Internal',
                                    referenceId: getCurrentTimestamp
                                        .microsecondsSinceEpoch
                                        .toString(),
                                    status: 'Success',
                                  ));
                              // Action 2 - UpdateRecipientBalance
                              logFirebaseEvent(
                                  'ModalFooterColumn_Action2-UpdateRecipien');

                              firestoreBatch.update(
                                  widget.userTransferRef!,
                                  createUsersRecordData(
                                    accountBalance:
                                        columnUsersRecord.accountBalance +
                                            widget.amount!.toDouble(),
                                  ));
                              // Action 4 - NotifyRecipient
                              logFirebaseEvent(
                                  'ModalFooterColumn_Action4-NotifyRecipien');
                              await BrevoApiGroup.transactionEmailCall.call(
                                appName: _model.getAppInfo?.appName,
                                appEmail: _model.getAppInfo?.appAlertEmail,
                                customerName:
                                    '${columnUsersRecord.firstName} ${columnUsersRecord.lastName}',
                                customerEmail: columnUsersRecord.email,
                                subject: 'Transaction Notification',
                                templateId: 3,
                              );
                              // Action 3 - UpdateSenderBalance
                              logFirebaseEvent(
                                  'ModalFooterColumn_Action3-UpdateSenderBa');

                              firestoreBatch.update(
                                  currentUserReference!,
                                  createUsersRecordData(
                                    accountBalance: valueOrDefault(
                                            currentUserDocument?.accountBalance,
                                            0.0) -
                                        widget.amount!.toDouble(),
                                  ));
                              // Action 4 - NotifySender
                              logFirebaseEvent(
                                  'ModalFooterColumn_Action4-NotifySender');
                              await BrevoApiGroup.transactionEmailCall.call(
                                appName: _model.getAppInfo?.appName,
                                appEmail: _model.getAppInfo?.appAlertEmail,
                                customerName:
                                    '${columnUsersRecord.firstName} ${columnUsersRecord.lastName}',
                                customerEmail: columnUsersRecord.email,
                                subject: 'Transfer Successful',
                                templateId: 3,
                              );
                              logFirebaseEvent('ModalFooterColumn_navigate_to');

                              context.pushNamed('TransferSuccessful');
                            } else {
                              logFirebaseEvent(
                                  'ModalFooterColumn_action_block');
                              await action_blocks.alertError(
                                context,
                                descPara: 'Incorrect Transaction Pin',
                              );
                            }
                          } finally {
                            await firestoreBatch.commit();
                          }

                          setState(() {});
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ].divide(SizedBox(height: 4.0)),
        ),
      ),
    );
  }
}
