import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/pin6_text_field/pin6_text_field_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_transaction_pin_model.dart';
export 'create_transaction_pin_model.dart';

class CreateTransactionPinWidget extends StatefulWidget {
  const CreateTransactionPinWidget({Key? key}) : super(key: key);

  @override
  _CreateTransactionPinWidgetState createState() =>
      _CreateTransactionPinWidgetState();
}

class _CreateTransactionPinWidgetState
    extends State<CreateTransactionPinWidget> {
  late CreateTransactionPinModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateTransactionPinModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CreateTransactionPin'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Title(
        title: 'Transaction Pin',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 0.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.karrowLeft2,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'CREATE_TRANSACTION_PIN_arrowLeft2_ICN_ON');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'd56dd3ik' /* Transaction Pin */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    actions: [],
                    centerTitle: false,
                    elevation: 0.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.dWSidebarModel,
                    updateCallback: () => setState(() {}),
                    child: DWSidebarWidget(
                      selectedSidebarNav: 'Set your Transaction Pin',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        wrapWithModel(
                          model: _model.dWHeaderModel,
                          updateCallback: () => setState(() {}),
                          child: DWHeaderWidget(
                            pageTitle: 'Transaction Pin',
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 450.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (valueOrDefault(
                                                    currentUserDocument
                                                        ?.securityPin,
                                                    '') !=
                                                null &&
                                            valueOrDefault(
                                                    currentUserDocument
                                                        ?.securityPin,
                                                    '') !=
                                                '') {
                                          return Form(
                                            key: _model.formKey2,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                wrapWithModel(
                                                  model: _model
                                                      .titleWithBackButtonModel1,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child:
                                                      TitleWithBackButtonWidget(
                                                    titleName:
                                                        'Transaction Pin',
                                                    actionPara: () async {
                                                      logFirebaseEvent(
                                                          'CREATE_TRANSACTION_PIN_Container_ss3q932');
                                                      logFirebaseEvent(
                                                          'TitleWithBackButton_navigate_back');
                                                      context.safePop();
                                                    },
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ntkqjh47' /* Changing your 6-digit security... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .pin6TextFieldCurrentPinModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child: Pin6TextFieldWidget(
                                                    labelPara:
                                                        'Current Transaction Pin',
                                                    readOnlyStatusPara: false,
                                                    actionPara: () async {},
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .pin6TextFieldChangeNewModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child: Pin6TextFieldWidget(
                                                    labelPara:
                                                        'New Transaction Pin',
                                                    readOnlyStatusPara: false,
                                                    actionPara: () async {},
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .pin6TextFieldChangeConfirmModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child: Pin6TextFieldWidget(
                                                    labelPara:
                                                        'Confirm new Transaction Pin',
                                                    readOnlyStatusPara: false,
                                                    actionPara: () async {},
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .primaryButtonLoadingModel1,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child:
                                                      PrimaryButtonLoadingWidget(
                                                    buttonText:
                                                        'Change Transaction Pin',
                                                    buttonWidth: 500,
                                                    buttonHeight: 45,
                                                    disableStatusPara: ((_model
                                                                        .pin6TextFieldCurrentPinModel
                                                                        .textController
                                                                        .text ==
                                                                    null ||
                                                                _model
                                                                        .pin6TextFieldCurrentPinModel
                                                                        .textController
                                                                        .text ==
                                                                    '') ||
                                                            (_model
                                                                        .pin6TextFieldChangeNewModel
                                                                        .textController
                                                                        .text ==
                                                                    null ||
                                                                _model
                                                                        .pin6TextFieldChangeNewModel
                                                                        .textController
                                                                        .text ==
                                                                    '') ||
                                                            (_model
                                                                        .pin6TextFieldChangeConfirmModel
                                                                        .textController
                                                                        .text ==
                                                                    null ||
                                                                _model
                                                                        .pin6TextFieldChangeConfirmModel
                                                                        .textController
                                                                        .text ==
                                                                    '')) ||
                                                        (_model
                                                                .pin6TextFieldChangeNewModel
                                                                .textController
                                                                .text !=
                                                            _model
                                                                .pin6TextFieldChangeConfirmModel
                                                                .textController
                                                                .text),
                                                    disableColorPara:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .lineColor,
                                                    buttonAction: () async {
                                                      logFirebaseEvent(
                                                          'CREATE_TRANSACTION_PIN_Container_4j7lzbb');
                                                      logFirebaseEvent(
                                                          'PrimaryButtonLoading_validate_form');
                                                      if (_model.formKey2
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey2
                                                              .currentState!
                                                              .validate()) {
                                                        return;
                                                      }
                                                      if (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.securityPin,
                                                              '') ==
                                                          _model
                                                              .pin6TextFieldCurrentPinModel
                                                              .textController
                                                              .text) {
                                                        if (_model
                                                                .pin6TextFieldChangeNewModel
                                                                .textController
                                                                .text ==
                                                            _model
                                                                .pin6TextFieldChangeConfirmModel
                                                                .textController
                                                                .text) {
                                                          logFirebaseEvent(
                                                              'PrimaryButtonLoading_backend_call');

                                                          await currentUserReference!
                                                              .update(
                                                                  createUsersRecordData(
                                                            securityPin: _model
                                                                .pin6TextFieldChangeConfirmModel
                                                                .textController
                                                                .text,
                                                          ));
                                                          logFirebaseEvent(
                                                              'PrimaryButtonLoading_action_block');
                                                          await action_blocks
                                                              .alertSuccess(
                                                            context,
                                                            descPara:
                                                                'Security pin saved',
                                                          );
                                                          setState(() {});
                                                          return;
                                                        } else {
                                                          logFirebaseEvent(
                                                              'PrimaryButtonLoading_action_block');
                                                          await action_blocks
                                                              .alertError(
                                                            context,
                                                            descPara:
                                                                'Your PIN did not match',
                                                          );
                                                          return;
                                                        }
                                                      } else {
                                                        logFirebaseEvent(
                                                            'PrimaryButtonLoading_action_block');
                                                        await action_blocks
                                                            .alertError(
                                                          context,
                                                          descPara:
                                                              'Incorrect Pin',
                                                        );
                                                        return;
                                                      }
                                                    },
                                                  ),
                                                ),
                                                RichText(
                                                  textScaleFactor:
                                                      MediaQuery.of(context)
                                                          .textScaleFactor,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'b0if3t7l' /* Forget your pin?  */,
                                                        ),
                                                        style: TextStyle(),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'qlf3ed7n' /* Reset it here */,
                                                        ),
                                                        style: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                        mouseCursor:
                                                            SystemMouseCursors
                                                                .click,
                                                        recognizer:
                                                            TapGestureRecognizer()
                                                              ..onTap =
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'CREATE_TRANSACTION_PIN_RichTextSpan_5x05');
                                                                logFirebaseEvent(
                                                                    'RichTextSpan_navigate_to');

                                                                context.pushNamed(
                                                                    'ResetSecurityPin');
                                                              },
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall,
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 15.0)),
                                            ),
                                          );
                                        } else {
                                          return Form(
                                            key: _model.formKey1,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                wrapWithModel(
                                                  model: _model
                                                      .titleWithBackButtonModel2,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child:
                                                      TitleWithBackButtonWidget(
                                                    titleName:
                                                        'Transaction Pin',
                                                    actionPara: () async {
                                                      logFirebaseEvent(
                                                          'CREATE_TRANSACTION_PIN_Container_eabg2qm');
                                                      logFirebaseEvent(
                                                          'TitleWithBackButton_navigate_back');
                                                      context.safePop();
                                                    },
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'pnre0hag' /* Your 6-digit security PIN prot... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .pin6TextFieldCreatePinModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child: Pin6TextFieldWidget(
                                                    labelPara:
                                                        'New Transaction Pin',
                                                    readOnlyStatusPara: false,
                                                    actionPara: () async {},
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .pin6TextFieldCreateConfirmModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child: Pin6TextFieldWidget(
                                                    labelPara:
                                                        'Confirm Transaction Pin',
                                                    readOnlyStatusPara: false,
                                                    actionPara: () async {},
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .primaryButtonLoadingModel2,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child:
                                                      PrimaryButtonLoadingWidget(
                                                    buttonText:
                                                        'Create Transaction Pin',
                                                    buttonWidth: 450,
                                                    buttonHeight: 45,
                                                    disableStatusPara: ((_model
                                                                        .pin6TextFieldCreatePinModel
                                                                        .textController
                                                                        .text ==
                                                                    null ||
                                                                _model
                                                                        .pin6TextFieldCreatePinModel
                                                                        .textController
                                                                        .text ==
                                                                    '') ||
                                                            (_model
                                                                        .pin6TextFieldCreateConfirmModel
                                                                        .textController
                                                                        .text ==
                                                                    null ||
                                                                _model
                                                                        .pin6TextFieldCreateConfirmModel
                                                                        .textController
                                                                        .text ==
                                                                    '')) ||
                                                        (_model
                                                                .pin6TextFieldCreatePinModel
                                                                .textController
                                                                .text !=
                                                            _model
                                                                .pin6TextFieldCreateConfirmModel
                                                                .textController
                                                                .text),
                                                    disableColorPara:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .lineColor,
                                                    buttonAction: () async {
                                                      logFirebaseEvent(
                                                          'CREATE_TRANSACTION_PIN_Container_5jvy9y4');
                                                      logFirebaseEvent(
                                                          'PrimaryButtonLoading_validate_form');
                                                      if (_model.formKey1
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey1
                                                              .currentState!
                                                              .validate()) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .pin6TextFieldCreatePinModel
                                                              .textController
                                                              .text ==
                                                          _model
                                                              .pin6TextFieldCreateConfirmModel
                                                              .textController
                                                              .text) {
                                                        logFirebaseEvent(
                                                            'PrimaryButtonLoading_backend_call');

                                                        await currentUserReference!
                                                            .update(
                                                                createUsersRecordData(
                                                          securityPin: _model
                                                              .pin6TextFieldCreateConfirmModel
                                                              .textController
                                                              .text,
                                                        ));
                                                        logFirebaseEvent(
                                                            'PrimaryButtonLoading_action_block');
                                                        await action_blocks
                                                            .alertSuccess(
                                                          context,
                                                          descPara:
                                                              'You have successfully created your pin',
                                                        );
                                                        setState(() {});
                                                        logFirebaseEvent(
                                                            'PrimaryButtonLoading_navigate_to');

                                                        context.pushNamed(
                                                            'Dashboard');

                                                        return;
                                                      } else {
                                                        logFirebaseEvent(
                                                            'PrimaryButtonLoading_action_block');
                                                        await action_blocks
                                                            .alertError(
                                                          context,
                                                          descPara:
                                                              'Your PIN did not match',
                                                        );
                                                        return;
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 20.0)),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
