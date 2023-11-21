import '/application/backend/d_w_settings/admin/announcements/components/annonucement_composer/annonucement_composer_widget.dart';
import '/application/components/modals/modal_footer_row/modal_footer_row_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
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
import 'update_announcement_model.dart';
export 'update_announcement_model.dart';

class UpdateAnnouncementWidget extends StatefulWidget {
  const UpdateAnnouncementWidget({
    Key? key,
    this.recordRef,
  }) : super(key: key);

  final DocumentReference? recordRef;

  @override
  _UpdateAnnouncementWidgetState createState() =>
      _UpdateAnnouncementWidgetState();
}

class _UpdateAnnouncementWidgetState extends State<UpdateAnnouncementWidget>
    with TickerProviderStateMixin {
  late UpdateAnnouncementModel _model;

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
    _model = createModel(context, () => UpdateAnnouncementModel());

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
        width: 600.0,
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
                headerTitlePara: 'Update Information',
                headerActionPara: () async {
                  logFirebaseEvent('UPDATE_ANNOUNCEMENT_Container_uiczbpvu_C');
                  logFirebaseEvent('ModalHeader_bottom_sheet');
                  Navigator.pop(context);
                },
              ),
            ),
            StreamBuilder<DwAnnouncementsRecord>(
              stream: DwAnnouncementsRecord.getDocument(widget.recordRef!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: LinearProgressIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  );
                }
                final columnDwAnnouncementsRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'rcrrf0jm' /* If you have recent or signific... */,
                            ),
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: wrapWithModel(
                              model: _model.annonucementComposerModel,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: AnnonucementComposerWidget(
                                pagePara: 'Create',
                                announcementTitle:
                                    columnDwAnnouncementsRecord.postTitle,
                                announcementMessage:
                                    columnDwAnnouncementsRecord.postDesc,
                                announcementBgColor:
                                    columnDwAnnouncementsRecord.postBgColor,
                                announcementStatus:
                                    columnDwAnnouncementsRecord.postStatus,
                                announcementResponsive:
                                    columnDwAnnouncementsRecord.postResponsive,
                                saveActionPara: () async {},
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 20.0))
                            .around(SizedBox(height: 20.0)),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.modalFooterRowModel,
                      updateCallback: () => setState(() {}),
                      child: ModalFooterRowWidget(
                        cancelTextPara: 'Cancel',
                        proceedTextPara: 'Save',
                        disableProceedBtnPara: (_model.annonucementComposerModel
                                        .textFieldTitleController.text ==
                                    null ||
                                _model.annonucementComposerModel
                                        .textFieldTitleController.text ==
                                    '') &&
                            (_model.annonucementComposerModel
                                        .textFieldMessageController.text ==
                                    null ||
                                _model.annonucementComposerModel
                                        .textFieldMessageController.text ==
                                    ''),
                        disableProceedBtnColorPara:
                            FlutterFlowTheme.of(context).disableColor,
                        proceedActionPara: () async {
                          logFirebaseEvent(
                              'UPDATE_ANNOUNCEMENT_Container_cuurpale_C');
                          logFirebaseEvent('ModalFooterRow_validate_form');
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          logFirebaseEvent('ModalFooterRow_backend_call');

                          await widget.recordRef!.update({
                            ...createDwAnnouncementsRecordData(
                              postTitle: _model.annonucementComposerModel
                                  .textFieldTitleController.text,
                              postDesc: _model.annonucementComposerModel
                                  .textFieldMessageController.text,
                              postStatus: _model.annonucementComposerModel
                                  .switchAnnouncementStatusValue,
                              postBgColor:
                                  _model.annonucementComposerModel.colorPicked,
                            ),
                            ...mapToFirestore(
                              {
                                'post_responsive': _model
                                    .annonucementComposerModel
                                    .choiceChipsResponsiveValues,
                              },
                            ),
                          });
                          logFirebaseEvent('ModalFooterRow_bottom_sheet');
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ].divide(SizedBox(height: 10.0)),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
