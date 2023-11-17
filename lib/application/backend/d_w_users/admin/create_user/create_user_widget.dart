import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/dropdown_searchable/dropdown_searchable_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/password_text_field/password_text_field_widget.dart';
import '/application/components/forms/tel_text_field_with_dial_code/tel_text_field_with_dial_code_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_user_model.dart';
export 'create_user_model.dart';

class CreateUserWidget extends StatefulWidget {
  const CreateUserWidget({Key? key}) : super(key: key);

  @override
  _CreateUserWidgetState createState() => _CreateUserWidgetState();
}

class _CreateUserWidgetState extends State<CreateUserWidget> {
  late CreateUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateUserModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'CreateUser'});
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
        title: 'Create User',
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
                            'CREATE_USER_PAGE_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'wayi2l6o' /* New User */,
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
                    child: DWSidebarWidget(),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if (valueOrDefault(
                                      currentUserDocument?.userRole, '') ==
                                  'User') {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    wrapWithModel(
                                      model: _model.noAccessErrorModel,
                                      updateCallback: () => setState(() {}),
                                      child: NoAccessErrorWidget(),
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    wrapWithModel(
                                      model: _model.dWHeaderModel,
                                      updateCallback: () => setState(() {}),
                                      child: DWHeaderWidget(
                                        pageTitle: 'New User',
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 20.0),
                                      child: Container(
                                        width: 500.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Form(
                                          key: _model.formKey,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      width: 200.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .textFieldWithLabelFirstnameModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            InputTextFieldWidget(
                                                          labelPara:
                                                              'Firstname',
                                                          hintPara:
                                                              'Enter firstname',
                                                          valuePara: 'Kolawole',
                                                          actionPara:
                                                              () async {},
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      width: 200.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: wrapWithModel(
                                                        model: _model
                                                            .textFieldWithLabelLastnameModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        child:
                                                            InputTextFieldWidget(
                                                          labelPara: 'Lastname',
                                                          hintPara:
                                                              'Enter lastname',
                                                          valuePara: 'Osho',
                                                          readOnlyStatusPara:
                                                              false,
                                                          actionPara:
                                                              () async {},
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 15.0)),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .dropdownSearchableCountryModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                updateOnChange: true,
                                                child: DropdownSearchableWidget(
                                                  labelPara: 'Country',
                                                  optionValuePara: 'Nigeria',
                                                  dropdownIcon: Icon(
                                                    FFIcons.karrowDown1,
                                                  ),
                                                  searchablePara: 'Search...',
                                                  listLabelPara: functions
                                                      .listOfCountries(),
                                                  listValuePara: functions
                                                      .listOfCountries(),
                                                  actionPara: () async {},
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .emailTextFieldEmailModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: EmailTextFieldWidget(
                                                  labelPara: 'Email Address',
                                                  hintPara: 'Email',
                                                  valuePara:
                                                      'kolawolerosho@gmail.com',
                                                  readOnlyStatusPara: false,
                                                  actionPara: () async {},
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .telTextFieldWithDialCodeModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                updateOnChange: true,
                                                child:
                                                    TelTextFieldWithDialCodeWidget(
                                                  labelPara: 'Phone Number',
                                                  readOnlyStatusPara: false,
                                                  dialCodePara: '+234',
                                                  actionPara: () async {},
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .passwordTextFieldPasswordModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: PasswordTextFieldWidget(
                                                  labelPara: 'Password',
                                                  actionPara: () async {},
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .primaryButtonLoadingCreateUserModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                updateOnChange: true,
                                                child:
                                                    PrimaryButtonLoadingWidget(
                                                  buttonText: 'Create new user',
                                                  buttonBgColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  buttonTextColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .white,
                                                  buttonBorderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  buttonWidth: 150,
                                                  buttonHeight: 40,
                                                  disableStatusPara: false,
                                                  buttonAction: () async {
                                                    logFirebaseEvent(
                                                        'CREATE_USER_PrimaryButtonLoading-CreateU');
                                                    logFirebaseEvent(
                                                        'PrimaryButtonLoading-CreateUser_validate');
                                                    if (_model.formKey
                                                                .currentState ==
                                                            null ||
                                                        !_model.formKey
                                                            .currentState!
                                                            .validate()) {
                                                      return;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 15.0)),
                                          ),
                                        ),
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
