import '/application/backend/d_w_recipients/users/components/create_recipien_comp/create_recipien_comp_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'update_contact_model.dart';
export 'update_contact_model.dart';

class UpdateContactWidget extends StatefulWidget {
  const UpdateContactWidget({
    Key? key,
    this.recordRef,
  }) : super(key: key);

  final DwRecipientsRecord? recordRef;

  @override
  _UpdateContactWidgetState createState() => _UpdateContactWidgetState();
}

class _UpdateContactWidgetState extends State<UpdateContactWidget>
    with TickerProviderStateMixin {
  late UpdateContactModel _model;

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
    _model = createModel(context, () => UpdateContactModel());

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
                updateOnChange: true,
                child: ModalHeaderWidget(
                  headerTitlePara: 'Update Recipient',
                  headerTitleTextColorPara:
                      FlutterFlowTheme.of(context).primaryText,
                  headerActionPara: () async {
                    logFirebaseEvent(
                        'UPDATE_CONTACT_Container_awvkwmci_CALLBA');
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
                        StreamBuilder<DwRecipientsRecord>(
                          stream: DwRecipientsRecord.getDocument(
                              widget.recordRef!.reference),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: LinearProgressIndicator(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              );
                            }
                            final formUpdateContactDwRecipientsRecord =
                                snapshot.data!;
                            return Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: wrapWithModel(
                                model: _model.createRecipienCompModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: CreateRecipienCompWidget(
                                  namePara: formUpdateContactDwRecipientsRecord
                                      .accountName,
                                  typePara:
                                      formUpdateContactDwRecipientsRecord.type,
                                  numberPara:
                                      formUpdateContactDwRecipientsRecord
                                          .accountNumber,
                                  submitActionPara: () async {
                                    logFirebaseEvent(
                                        'UPDATE_CONTACT_Container_sp2rppm6_CALLBA');
                                    logFirebaseEvent(
                                        'CreateRecipienComp_validate_form');
                                    if (_model.formKey.currentState == null ||
                                        !_model.formKey.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    logFirebaseEvent(
                                        'CreateRecipienComp_backend_call');

                                    await widget.recordRef!.reference
                                        .update(createDwRecipientsRecordData());
                                    logFirebaseEvent(
                                        'CreateRecipienComp_action_block');
                                    await action_blocks.alertSuccess(
                                      context,
                                      descPara: 'Saved',
                                    );
                                    logFirebaseEvent(
                                        'CreateRecipienComp_bottom_sheet');
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
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
