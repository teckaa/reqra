import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/right_sided_amount_text_field/right_sided_amount_text_field_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_two_line/shimmer_two_line_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'fund_user_model.dart';
export 'fund_user_model.dart';

class FundUserWidget extends StatefulWidget {
  const FundUserWidget({
    Key? key,
    this.userRef,
  }) : super(key: key);

  final DocumentReference? userRef;

  @override
  _FundUserWidgetState createState() => _FundUserWidgetState();
}

class _FundUserWidgetState extends State<FundUserWidget>
    with TickerProviderStateMixin {
  late FundUserModel _model;

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
    _model = createModel(context, () => FundUserModel());

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
              AuthUserStreamWidget(
                builder: (context) => StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(widget.userRef!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return ShimmerTwoLineWidget();
                    }
                    final modalHeaderUsersRecord = snapshot.data!;
                    return wrapWithModel(
                      model: _model.modalHeaderModel,
                      updateCallback: () => setState(() {}),
                      child: ModalHeaderWidget(
                        headerTitlePara: 'Fund ${currentUserDisplayName}',
                        headerTitleTextColorPara:
                            FlutterFlowTheme.of(context).primaryText,
                        headerActionPara: () async {
                          logFirebaseEvent(
                              'FUND_USER_Container_352kqplo_CALLBACK');
                          logFirebaseEvent('ModalHeader_bottom_sheet');
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 40.0),
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
                    StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(widget.userRef!),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: LinearProgressIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          );
                        }
                        final primaryButtonLoadingUsersRecord = snapshot.data!;
                        return wrapWithModel(
                          model: _model.primaryButtonLoadingModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: PrimaryButtonLoadingWidget(
                            buttonText: 'Fund User',
                            buttonWidth: 400,
                            buttonHeight: 45,
                            disableStatusPara: _model
                                        .rightSidedAmountTextFieldModel
                                        .textController
                                        .text ==
                                    null ||
                                _model.rightSidedAmountTextFieldModel
                                        .textController.text ==
                                    '',
                            disableColorPara:
                                FlutterFlowTheme.of(context).lineColor,
                            buttonAction: () async {
                              logFirebaseEvent(
                                  'FUND_USER_Container_hhsf4gti_CALLBACK');
                              final firestoreBatch =
                                  FirebaseFirestore.instance.batch();
                              try {
                                logFirebaseEvent(
                                    'PrimaryButtonLoading_validate_form');
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                logFirebaseEvent(
                                    'PrimaryButtonLoading_backend_call');

                                firestoreBatch.update(
                                    widget.userRef!,
                                    createUsersRecordData(
                                      accountBalance: double.parse(_model
                                              .rightSidedAmountTextFieldModel
                                              .textController
                                              .text) +
                                          primaryButtonLoadingUsersRecord
                                              .accountBalance,
                                    ));
                                logFirebaseEvent(
                                    'PrimaryButtonLoading_backend_call');

                                firestoreBatch.set(
                                    FundingsRecord.collection.doc(),
                                    createFundingsRecordData(
                                      createdAt: getCurrentTimestamp,
                                      userRef: widget.userRef,
                                      amount: int.tryParse(_model
                                          .rightSidedAmountTextFieldModel
                                          .textController
                                          .text),
                                      merchant:
                                          'ADMIN-${valueOrDefault(currentUserDocument?.accountNumber, 0).toString()}',
                                      status: 'Completed',
                                      currency: primaryButtonLoadingUsersRecord
                                          .currency,
                                    ));
                                logFirebaseEvent(
                                    'PrimaryButtonLoading_bottom_sheet');
                                Navigator.pop(context);
                              } finally {
                                await firestoreBatch.commit();
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ].divide(SizedBox(height: 30.0)),
                ),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
