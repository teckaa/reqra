import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/password_text_field/password_text_field_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_password_model.dart';
export 'change_password_model.dart';

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({Key? key}) : super(key: key);

  @override
  _ChangePasswordWidgetState createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
  late ChangePasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangePasswordModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ChangePassword'});
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
        title: 'Change Password',
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
                            'CHANGE_PASSWORD_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        '5pw78nua' /* Security */,
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
                      selectedSidebarNav: 'Password',
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
                            pageTitle: 'Security',
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 20.0),
                                  child: Container(
                                    width: 450.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Form(
                                      key: _model.formKey,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          wrapWithModel(
                                            model:
                                                _model.titleWithBackButtonModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: TitleWithBackButtonWidget(
                                              titleName: 'Change password',
                                              actionPara: () async {
                                                logFirebaseEvent(
                                                    'CHANGE_PASSWORD_Container_cyazd71d_CALLB');
                                                logFirebaseEvent(
                                                    'TitleWithBackButton_navigate_back');
                                                context.safePop();
                                              },
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .passwordTextFieldCurrentModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: PasswordTextFieldWidget(
                                              labelPara: 'Current password',
                                              actionPara: () async {},
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .passwordTextFieldNewModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: PasswordTextFieldWidget(
                                              labelPara:
                                                  'Enter your new Password',
                                              actionPara: () async {},
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .passwordTextFieldConfirmNewModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: PasswordTextFieldWidget(
                                              labelPara: 'Confirm new password',
                                              actionPara: () async {},
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .primaryButtonLoadingSaveModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: PrimaryButtonLoadingWidget(
                                              buttonText: 'Save',
                                              buttonWidth: 450,
                                              buttonHeight: 45,
                                              disableStatusPara: false,
                                              buttonAction: () async {
                                                logFirebaseEvent(
                                                    'CHANGE_PASSWORD_PrimaryButtonLoading-Sav');
                                                logFirebaseEvent(
                                                    'PrimaryButtonLoading-Save_backend_call');

                                                await currentUserReference!
                                                    .update(
                                                        createUsersRecordData());
                                              },
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 20.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
