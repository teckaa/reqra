import '/application/backend/d_w_recipients/users/components/create_recipien_comp/create_recipien_comp_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_recipient_model.dart';
export 'create_recipient_model.dart';

class CreateRecipientWidget extends StatefulWidget {
  const CreateRecipientWidget({
    Key? key,
    this.typeOfRecipentPara,
  }) : super(key: key);

  final String? typeOfRecipentPara;

  @override
  _CreateRecipientWidgetState createState() => _CreateRecipientWidgetState();
}

class _CreateRecipientWidgetState extends State<CreateRecipientWidget>
    with TickerProviderStateMixin {
  late CreateRecipientModel _model;

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
    _model = createModel(context, () => CreateRecipientModel());

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.modalHeaderModel,
                updateCallback: () => setState(() {}),
                child: ModalHeaderWidget(
                  headerTitlePara: 'Add new Recipient',
                  headerTitleTextColorPara:
                      FlutterFlowTheme.of(context).primaryText,
                  headerActionPara: () async {
                    logFirebaseEvent(
                        'CREATE_RECIPIENT_Container_xrs4hoj5_CALL');
                    logFirebaseEvent('ModalHeader_close_dialog,_drawer,_etc');
                    Navigator.pop(context);
                  },
                ),
              ),
              Flexible(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 40.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.createRecipienCompModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: CreateRecipienCompWidget(
                            typePara: valueOrDefault<String>(
                              widget.typeOfRecipentPara,
                              'Phone Number',
                            ),
                            submitActionPara: () async {
                              logFirebaseEvent(
                                  'CREATE_RECIPIENT_CreateRecipienComp_CALL');
                              var _shouldSetState = false;
                              final firestoreBatch =
                                  FirebaseFirestore.instance.batch();
                              try {
                                logFirebaseEvent(
                                    'CreateRecipienComp_firestore_query');
                                _model.checkIfRecipientExist =
                                    await queryDwRecipientsRecordOnce(
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                _shouldSetState = true;
                                if (_model.createRecipienCompModel
                                        .dropDownTypeOfNumberValue ==
                                    'Bank account') {
                                  // Action 3 - Create bank account
                                  logFirebaseEvent(
                                      'CreateRecipienComp_Action3-Createbankacc');

                                  firestoreBatch.set(
                                      DwRecipientsRecord.collection.doc(),
                                      createDwRecipientsRecordData(
                                        createdAt: getCurrentTimestamp,
                                        userRef: currentUserReference,
                                        uuid: functions.uUIDReference(),
                                        type: _model.createRecipienCompModel
                                            .dropDownTypeOfNumberValue,
                                        accountNumber: _model
                                            .createRecipienCompModel
                                            .textFieldAccountNumberController
                                            .text,
                                        accountName: _model
                                            .createRecipienCompModel
                                            .textFieldAccountNameController
                                            .text,
                                        bankName: _model.createRecipienCompModel
                                            .textFieldBankNameController.text,
                                      ));
                                } else if (_model.createRecipienCompModel
                                        .dropDownTypeOfNumberValue ==
                                    'Username tag') {
                                  // Action 4 - Create Username tag
                                  logFirebaseEvent(
                                      'CreateRecipienComp_Action4-CreateUsernam');

                                  firestoreBatch.set(
                                      DwRecipientsRecord.collection.doc(),
                                      createDwRecipientsRecordData(
                                        createdAt: getCurrentTimestamp,
                                        userRef: currentUserReference,
                                        uuid: functions.uUIDReference(),
                                        type: _model.createRecipienCompModel
                                            .dropDownTypeOfNumberValue,
                                        accountNumber: _model
                                            .createRecipienCompModel
                                            .telTextFieldPhoneNumberModel
                                            .textController
                                            .text,
                                        accountName: _model
                                            .createRecipienCompModel
                                            .inputTextFieldPhoneNameModel
                                            .textController
                                            .text,
                                      ));
                                } else if (_model.createRecipienCompModel
                                        .dropDownTypeOfNumberValue ==
                                    'Smart card number') {
                                  // Action 5 - Create Smart card and others
                                  logFirebaseEvent(
                                      'CreateRecipienComp_Action5-CreateSmartca');

                                  firestoreBatch.set(
                                      DwRecipientsRecord.collection.doc(),
                                      createDwRecipientsRecordData(
                                        createdAt: getCurrentTimestamp,
                                        userRef: currentUserReference,
                                        uuid: functions.uUIDReference(),
                                        type: _model.createRecipienCompModel
                                            .dropDownTypeOfNumberValue,
                                        accountNumber: _model
                                            .createRecipienCompModel
                                            .telTextFieldPhoneNumberModel
                                            .textController
                                            .text,
                                        accountName: _model
                                            .createRecipienCompModel
                                            .inputTextFieldPhoneNameModel
                                            .textController
                                            .text,
                                      ));
                                } else if (_model.createRecipienCompModel
                                        .dropDownTypeOfNumberValue ==
                                    'Phone number') {
                                  // Action 6 - Create Phone number
                                  logFirebaseEvent(
                                      'CreateRecipienComp_Action6-CreatePhonenu');

                                  firestoreBatch.set(
                                      DwRecipientsRecord.collection.doc(),
                                      createDwRecipientsRecordData(
                                        createdAt: getCurrentTimestamp,
                                        userRef: currentUserReference,
                                        uuid: functions.uUIDReference(),
                                        type: _model.createRecipienCompModel
                                            .dropDownTypeOfNumberValue,
                                        accountNumber: _model
                                            .createRecipienCompModel
                                            .telTextFieldPhoneNumberModel
                                            .textController
                                            .text,
                                        accountName: _model
                                            .createRecipienCompModel
                                            .inputTextFieldPhoneNameModel
                                            .textController
                                            .text,
                                      ));
                                  logFirebaseEvent(
                                      'CreateRecipienComp_bottom_sheet');
                                  Navigator.pop(context);
                                } else {
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
