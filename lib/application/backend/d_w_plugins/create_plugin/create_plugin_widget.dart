import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_plugin_model.dart';
export 'create_plugin_model.dart';

class CreatePluginWidget extends StatefulWidget {
  const CreatePluginWidget({Key? key}) : super(key: key);

  @override
  _CreatePluginWidgetState createState() => _CreatePluginWidgetState();
}

class _CreatePluginWidgetState extends State<CreatePluginWidget>
    with TickerProviderStateMixin {
  late CreatePluginModel _model;

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
    _model = createModel(context, () => CreatePluginModel());

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
                  headerTitlePara: 'Create Plugin',
                  headerActionPara: () async {
                    logFirebaseEvent(
                        'CREATE_PLUGIN_Container_xetfeeh0_CALLBAC');
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
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.inputTextFieldPluginNameModel,
                        updateCallback: () => setState(() {}),
                        child: InputTextFieldWidget(
                          labelPara: 'Plugin name',
                          hintPara: 'Name',
                          readOnlyStatusPara: false,
                          actionPara: () async {},
                        ),
                      ),
                      wrapWithModel(
                        model: _model.inputTextAreaPluginDescModel,
                        updateCallback: () => setState(() {}),
                        child: InputTextAreaWidget(
                          labelPara: 'Plugin description',
                          readOnlyStatusPara: false,
                          actionPara: () async {},
                        ),
                      ),
                      wrapWithModel(
                        model: _model.primaryButtonLoadingModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: PrimaryButtonLoadingWidget(
                          buttonText: 'Create',
                          buttonWidth: 400,
                          buttonHeight: 45,
                          disableStatusPara: false,
                          buttonAction: () async {
                            logFirebaseEvent(
                                'CREATE_PLUGIN_Container_epvekpag_CALLBAC');
                            logFirebaseEvent(
                                'PrimaryButtonLoading_validate_form');
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            logFirebaseEvent(
                                'PrimaryButtonLoading_backend_call');

                            await DwPluginsRecord.collection
                                .doc()
                                .set(createDwPluginsRecordData(
                                  createdAt: getCurrentTimestamp,
                                  userRef: currentUserReference,
                                  pluginName: functions.allFirstLetterUpperCase(
                                      _model.inputTextFieldPluginNameModel
                                          .textController.text),
                                  pluginDesc: _model
                                      .inputTextAreaPluginDescModel
                                      .textController
                                      .text,
                                ));
                            logFirebaseEvent(
                                'PrimaryButtonLoading_navigate_to');

                            context.pushNamed('Plugins');
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
