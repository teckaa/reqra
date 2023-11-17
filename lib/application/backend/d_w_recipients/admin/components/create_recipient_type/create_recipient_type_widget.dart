import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
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
import 'create_recipient_type_model.dart';
export 'create_recipient_type_model.dart';

class CreateRecipientTypeWidget extends StatefulWidget {
  const CreateRecipientTypeWidget({Key? key}) : super(key: key);

  @override
  _CreateRecipientTypeWidgetState createState() =>
      _CreateRecipientTypeWidgetState();
}

class _CreateRecipientTypeWidgetState extends State<CreateRecipientTypeWidget>
    with TickerProviderStateMixin {
  late CreateRecipientTypeModel _model;

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
    _model = createModel(context, () => CreateRecipientTypeModel());

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
                  headerTitlePara: 'Create Recipient',
                  headerActionPara: () async {
                    logFirebaseEvent(
                        'CREATE_RECIPIENT_TYPE_Container_jqgzmt7t');
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
                              '6io8r42h' /* Enable or Disable this Recipie... */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Switch.adaptive(
                            value: _model.switchTypeValue ??= true,
                            onChanged: (newValue) async {
                              setState(
                                  () => _model.switchTypeValue = newValue!);
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
                        model: _model.inputTextFieldModel,
                        updateCallback: () => setState(() {}),
                        updateOnChange: true,
                        child: InputTextFieldWidget(
                          labelPara: 'Type Of Recipient',
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
                          buttonBgColor: FlutterFlowTheme.of(context).primary,
                          buttonTextColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          buttonWidth: 450,
                          buttonHeight: 45,
                          disableStatusPara:
                              (_model.inputTextFieldModel.textController.text ==
                                          null ||
                                      _model.inputTextFieldModel.textController
                                              .text ==
                                          '') ||
                                  (_model.switchTypeValue == null),
                          disableColorPara:
                              FlutterFlowTheme.of(context).disableColor,
                          buttonAction: () async {
                            logFirebaseEvent(
                                'CREATE_RECIPIENT_TYPE_Container_un6kipzt');
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

                            await DwRecipientsSettingsRecord.collection
                                .doc()
                                .set(createDwRecipientsSettingsRecordData(
                                  typeName: _model
                                      .inputTextFieldModel.textController.text,
                                  typeStatus: _model.switchTypeValue,
                                ));
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
