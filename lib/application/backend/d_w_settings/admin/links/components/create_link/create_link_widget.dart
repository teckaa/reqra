import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/url_text_field/url_text_field_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_link_model.dart';
export 'create_link_model.dart';

class CreateLinkWidget extends StatefulWidget {
  const CreateLinkWidget({
    Key? key,
    this.getBillSettingsRef,
  }) : super(key: key);

  final DocumentReference? getBillSettingsRef;

  @override
  _CreateLinkWidgetState createState() => _CreateLinkWidgetState();
}

class _CreateLinkWidgetState extends State<CreateLinkWidget>
    with TickerProviderStateMixin {
  late CreateLinkModel _model;

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
    _model = createModel(context, () => CreateLinkModel());

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.modalHeaderModel,
                updateCallback: () => setState(() {}),
                child: ModalHeaderWidget(
                  headerTitlePara: 'Create link',
                  headerActionPara: () async {
                    logFirebaseEvent('CREATE_LINK_Container_l676o60f_CALLBACK');
                    logFirebaseEvent('ModalHeader_bottom_sheet');
                    Navigator.pop(context);
                  },
                ),
              ),
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 40.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '544tkl53' /* Enable or Disable this Store a... */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Switch.adaptive(
                            value: _model.switchLinkValue ??= true,
                            onChanged: (newValue) async {
                              setState(
                                  () => _model.switchLinkValue = newValue!);
                            },
                            activeColor: FlutterFlowTheme.of(context).primary,
                            activeTrackColor:
                                FlutterFlowTheme.of(context).accent1,
                            inactiveTrackColor:
                                FlutterFlowTheme.of(context).lineColor,
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ],
                      ),
                      wrapWithModel(
                        model: _model.inputTextFieldStoreNameModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: InputTextFieldWidget(
                          labelPara: 'App Store Name',
                          hintPara: 'Google Play Store',
                          readOnlyStatusPara: false,
                          actionPara: () async {},
                        ),
                      ),
                      wrapWithModel(
                        model: _model.inputTextAreaStoreDescModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: InputTextAreaWidget(
                          labelPara: 'App Store Description',
                          readOnlyStatusPara: false,
                          actionPara: () async {},
                        ),
                      ),
                      wrapWithModel(
                        model: _model.urlTextFieldModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: UrlTextFieldWidget(
                          labelPara: 'App Store URL',
                          readOnlyStatusPara: false,
                          actionPara: () async {},
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'yhyxsfcx' /* App Store Image Size (420 by 1... */,
                            ),
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CREATE_LINK_Container_scteh4xv_ON_TAP');
                                      logFirebaseEvent(
                                          'PhotoGrid_alert_dialog');
                                      await showAlignedDialog(
                                        barrierColor:
                                            FlutterFlowTheme.of(context)
                                                .overlay,
                                        barrierDismissible: false,
                                        context: context,
                                        isGlobal: false,
                                        avoidOverflow: false,
                                        targetAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: WebViewAware(
                                                child: Container(
                                              height: 800.0,
                                              width: 800.0,
                                              child: ListOfMediaCompWidget(),
                                            )),
                                          );
                                        },
                                      ).then((value) => safeSetState(
                                          () => _model.getImageData = value));

                                      setState(() {});
                                    },
                                    child: wrapWithModel(
                                      model: _model.photoGridModel,
                                      updateCallback: () => setState(() {}),
                                      child: PhotoGridWidget(
                                        photoWidth: 400,
                                        photoHeight: 100,
                                        photoPath: _model.getImageData,
                                        photoName: 'App Store Image ',
                                        bgColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 5.0)),
                      ),
                      wrapWithModel(
                        model: _model.primaryButtonLoadingModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: PrimaryButtonLoadingWidget(
                          buttonText: 'Create',
                          buttonBgColor: FlutterFlowTheme.of(context).primary,
                          buttonTextColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          buttonWidth: 450,
                          buttonHeight: 45,
                          disableStatusPara:
                              (_model.inputTextFieldStoreNameModel
                                              .textController.text ==
                                          null ||
                                      _model.inputTextFieldStoreNameModel
                                              .textController.text ==
                                          '') ||
                                  (_model.inputTextAreaStoreDescModel
                                              .textController.text ==
                                          null ||
                                      _model.inputTextAreaStoreDescModel
                                              .textController.text ==
                                          '') ||
                                  (_model.urlTextFieldModel.textController
                                              .text ==
                                          null ||
                                      _model.urlTextFieldModel.textController
                                              .text ==
                                          '') ||
                                  (_model.switchLinkValue == null),
                          disableColorPara:
                              FlutterFlowTheme.of(context).disableColor,
                          buttonAction: () async {
                            logFirebaseEvent(
                                'CREATE_LINK_Container_nlxabcxo_CALLBACK');
                            // Action 1 - Validate form
                            logFirebaseEvent(
                                'PrimaryButtonLoading_Action1-Validatefor');
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            // Action 3 - Create service
                            logFirebaseEvent(
                                'PrimaryButtonLoading_Action3-Createservi');
                            unawaited(
                              () async {
                                await DwAppStoreLinksRecord.collection
                                    .doc()
                                    .set(createDwAppStoreLinksRecordData(
                                      createdAt: getCurrentTimestamp,
                                      uuid: '',
                                      appStoreName: _model
                                          .inputTextFieldStoreNameModel
                                          .textController
                                          .text,
                                      appStoreDesc: _model
                                          .inputTextAreaStoreDescModel
                                          .textController
                                          .text,
                                      appStoreImage: _model.getImageData,
                                      appStoreLink: _model.urlTextFieldModel
                                          .textController.text,
                                      appStoreStatus: _model.switchLinkValue,
                                    ));
                              }(),
                            );
                            logFirebaseEvent(
                                'PrimaryButtonLoading_bottom_sheet');
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 20.0)),
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
