import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/modals/modal_footer_column/modal_footer_column_widget.dart';
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
import 'create_permission_model.dart';
export 'create_permission_model.dart';

class CreatePermissionWidget extends StatefulWidget {
  const CreatePermissionWidget({Key? key}) : super(key: key);

  @override
  _CreatePermissionWidgetState createState() => _CreatePermissionWidgetState();
}

class _CreatePermissionWidgetState extends State<CreatePermissionWidget>
    with TickerProviderStateMixin {
  late CreatePermissionModel _model;

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
    _model = createModel(context, () => CreatePermissionModel());

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
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'yzywpkcx' /* Create Permission */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .labelMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelMediumFamily),
                            ),
                      ),
                      wrapWithModel(
                        model: _model.inputTextFieldPermissionNameModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: InputTextFieldWidget(
                          labelPara: 'Permission Name',
                          hintPara: 'Chief of Staff',
                          readOnlyStatusPara: false,
                          actionPara: () async {},
                        ),
                      ),
                      wrapWithModel(
                        model: _model.inputTextAreaPermissionDescModel,
                        updateCallback: () => setState(() {}),
                        child: InputTextAreaWidget(
                          labelPara: 'Permission Description',
                          readOnlyStatusPara: false,
                          actionPara: () async {},
                        ),
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.modalFooterColumnModel,
                updateCallback: () => setState(() {}),
                updateOnChange: true,
                child: ModalFooterColumnWidget(
                  cancelTextPara: 'No, Cancel',
                  proceedTextPara: 'Create ',
                  disableProceedBtnPara: false,
                  proceedTextAction: () async {
                    logFirebaseEvent(
                        'CREATE_PERMISSION_Container_heds47oq_CAL');
                    logFirebaseEvent('ModalFooterColumn_validate_form');
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }
                    logFirebaseEvent('ModalFooterColumn_backend_call');

                    await DwRolesPermissionsRecord.collection
                        .doc()
                        .set(createDwRolesPermissionsRecordData(
                          createdAt: getCurrentTimestamp,
                          permissionName: _model
                              .inputTextFieldPermissionNameModel
                              .textController
                              .text,
                          permissionDesc: _model
                              .inputTextAreaPermissionDescModel
                              .textController
                              .text,
                        ));
                    logFirebaseEvent('ModalFooterColumn_navigate_to');

                    context.pushNamed('Permissions');
                  },
                ),
              ),
            ],
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
