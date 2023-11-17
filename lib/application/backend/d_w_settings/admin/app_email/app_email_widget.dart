import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/shimmers/shimmer_one_detail/shimmer_one_detail_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_email_model.dart';
export 'app_email_model.dart';

class AppEmailWidget extends StatefulWidget {
  const AppEmailWidget({Key? key}) : super(key: key);

  @override
  _AppEmailWidgetState createState() => _AppEmailWidgetState();
}

class _AppEmailWidgetState extends State<AppEmailWidget> {
  late AppEmailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppEmailModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'AppEmail'});
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
        title: 'Email',
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
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.karrowLeft2,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'APP_EMAIL_PAGE_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'sx9q2md3' /* Emails */,
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
                      selectedSidebarNav: 'App Emails',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          child: Builder(
                            builder: (context) {
                              if ((valueOrDefault(
                                          currentUserDocument?.userRole, '') ==
                                      'Owner') ||
                                  (valueOrDefault(
                                          currentUserDocument?.userRole, '') ==
                                      'Admin') ||
                                  (valueOrDefault(
                                          currentUserDocument?.userRole, '') ==
                                      'IT Support')) {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    wrapWithModel(
                                      model: _model.dWHeaderModel,
                                      updateCallback: () => setState(() {}),
                                      child: DWHeaderWidget(
                                        pageTitle: 'Emails',
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 20.0),
                                              child: StreamBuilder<
                                                  List<DwAppRecord>>(
                                                stream: queryDwAppRecord(
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return ShimmerOneDetailWidget();
                                                  }
                                                  List<DwAppRecord>
                                                      containerDwAppRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final containerDwAppRecord =
                                                      containerDwAppRecordList
                                                              .isNotEmpty
                                                          ? containerDwAppRecordList
                                                              .first
                                                          : null;
                                                  return Container(
                                                    width: 450.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        wrapWithModel(
                                                          model: _model
                                                              .titleWithBackButtonModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              TitleWithBackButtonWidget(
                                                            titleName: 'Emails',
                                                            actionPara:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'APP_EMAIL_Container_2cj07j82_CALLBACK');
                                                              logFirebaseEvent(
                                                                  'TitleWithBackButton_navigate_back');
                                                              context.safePop();
                                                            },
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'iyretv9q' /* Put in your general email here */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 13.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        Form(
                                                          key: _model.formKey,
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .disabled,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              wrapWithModel(
                                                                model: _model
                                                                    .emailTextFieldAppEmailModel,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    EmailTextFieldWidget(
                                                                  labelPara:
                                                                      'App Email',
                                                                  hintPara:
                                                                      'info@example.com',
                                                                  valuePara:
                                                                      containerDwAppRecord
                                                                          ?.appGeneralEmail,
                                                                  readOnlyStatusPara:
                                                                      false,
                                                                  actionPara:
                                                                      () async {},
                                                                ),
                                                              ),
                                                              wrapWithModel(
                                                                model: _model
                                                                    .emailTextFieldAppAlertModel,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    EmailTextFieldWidget(
                                                                  labelPara:
                                                                      'Notification/Alert',
                                                                  hintPara:
                                                                      'alert@example.com',
                                                                  valuePara:
                                                                      containerDwAppRecord
                                                                          ?.appAlertEmail,
                                                                  readOnlyStatusPara:
                                                                      false,
                                                                  actionPara:
                                                                      () async {},
                                                                ),
                                                              ),
                                                              wrapWithModel(
                                                                model: _model
                                                                    .emailTextFieldAppSupportModel,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    EmailTextFieldWidget(
                                                                  labelPara:
                                                                      'Help/Support',
                                                                  hintPara:
                                                                      'help@example.com',
                                                                  valuePara:
                                                                      containerDwAppRecord
                                                                          ?.appSupportEmail,
                                                                  readOnlyStatusPara:
                                                                      false,
                                                                  actionPara:
                                                                      () async {},
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 15.0)),
                                                          ),
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .primaryButtonLoadingSaveModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              PrimaryButtonLoadingWidget(
                                                            buttonText: 'Save',
                                                            buttonWidth: 450,
                                                            buttonHeight: 45,
                                                            disableStatusPara:
                                                                false,
                                                            buttonAction:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'APP_EMAIL_PrimaryButtonLoading-Save_CALL');
                                                              logFirebaseEvent(
                                                                  'PrimaryButtonLoading-Save_validate_form');
                                                              if (_model.formKey
                                                                          .currentState ==
                                                                      null ||
                                                                  !_model
                                                                      .formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                return;
                                                              }
                                                              logFirebaseEvent(
                                                                  'PrimaryButtonLoading-Save_backend_call');

                                                              await containerDwAppRecord!
                                                                  .reference
                                                                  .update(
                                                                      createDwAppRecordData(
                                                                appGeneralEmail: _model
                                                                    .emailTextFieldAppEmailModel
                                                                    .textController
                                                                    .text,
                                                                appAlertEmail: _model
                                                                    .emailTextFieldAppAlertModel
                                                                    .textController
                                                                    .text,
                                                                appSupportEmail: _model
                                                                    .emailTextFieldAppSupportModel
                                                                    .textController
                                                                    .text,
                                                              ));
                                                              logFirebaseEvent(
                                                                  'PrimaryButtonLoading-Save_action_block');
                                                              await action_blocks
                                                                  .alertSuccess(
                                                                context,
                                                                descPara:
                                                                    'Saved',
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 20.0)),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: wrapWithModel(
                                        model: _model.noAccessErrorModel,
                                        updateCallback: () => setState(() {}),
                                        child: NoAccessErrorWidget(),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
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
