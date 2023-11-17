import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/tel_text_field_with_dial_code/tel_text_field_with_dial_code_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'personal_information_model.dart';
export 'personal_information_model.dart';

class PersonalInformationWidget extends StatefulWidget {
  const PersonalInformationWidget({Key? key}) : super(key: key);

  @override
  _PersonalInformationWidgetState createState() =>
      _PersonalInformationWidgetState();
}

class _PersonalInformationWidgetState extends State<PersonalInformationWidget> {
  late PersonalInformationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PersonalInformationModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'PersonalInformation'});
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
        title: 'Personal Information',
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
                            'PERSONAL_INFORMATION_arrowLeft2_ICN_ON_T');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.safePop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'dmyaqwqd' /* Edit profile */,
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
                      selectedSidebarNav: 'Personal Information',
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
                            pageTitle: 'Profile',
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
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
                                    child: Form(
                                      key: _model.formKey,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
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
                                              titleName: 'Personal Information',
                                              actionPara: () async {
                                                logFirebaseEvent(
                                                    'PERSONAL_INFORMATION_Container_3py0crzo_');
                                                logFirebaseEvent(
                                                    'TitleWithBackButton_navigate_back');
                                                context.safePop();
                                              },
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'PERSONAL_INFORMATION_Container_6drtnh8b_');
                                                      logFirebaseEvent(
                                                          'PhotoGridCover_upload_media_to_firebase');
                                                      final selectedMedia =
                                                          await selectMediaWithSourceBottomSheet(
                                                        context: context,
                                                        maxWidth: 200.00,
                                                        maxHeight: 200.00,
                                                        allowPhoto: true,
                                                        pickerFontFamily:
                                                            'Plus Jakarta Sans',
                                                      );
                                                      if (selectedMedia !=
                                                              null &&
                                                          selectedMedia.every((m) =>
                                                              validateFileFormat(
                                                                  m.storagePath,
                                                                  context))) {
                                                        setState(() => _model
                                                                .isDataUploading =
                                                            true);
                                                        var selectedUploadedFiles =
                                                            <FFUploadedFile>[];

                                                        var downloadUrls =
                                                            <String>[];
                                                        try {
                                                          selectedUploadedFiles =
                                                              selectedMedia
                                                                  .map((m) =>
                                                                      FFUploadedFile(
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
                                                                        height: m
                                                                            .dimensions
                                                                            ?.height,
                                                                        width: m
                                                                            .dimensions
                                                                            ?.width,
                                                                        blurHash:
                                                                            m.blurHash,
                                                                      ))
                                                                  .toList();

                                                          downloadUrls =
                                                              (await Future
                                                                      .wait(
                                                            selectedMedia.map(
                                                              (m) async =>
                                                                  await uploadData(
                                                                      m.storagePath,
                                                                      m.bytes),
                                                            ),
                                                          ))
                                                                  .where((u) =>
                                                                      u != null)
                                                                  .map(
                                                                      (u) => u!)
                                                                  .toList();
                                                        } finally {
                                                          _model.isDataUploading =
                                                              false;
                                                        }
                                                        if (selectedUploadedFiles
                                                                    .length ==
                                                                selectedMedia
                                                                    .length &&
                                                            downloadUrls
                                                                    .length ==
                                                                selectedMedia
                                                                    .length) {
                                                          setState(() {
                                                            _model.uploadedLocalFile =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl =
                                                                downloadUrls
                                                                    .first;
                                                          });
                                                        } else {
                                                          setState(() {});
                                                          return;
                                                        }
                                                      }

                                                      logFirebaseEvent(
                                                          'PhotoGridCover_update_page_state');
                                                      setState(() {
                                                        _model.profilePhotoSaveButton =
                                                            true;
                                                      });
                                                    },
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .photoGridCoverModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          PhotoGridCoverWidget(
                                                        photoWidth: 80,
                                                        photoHeight: 80,
                                                        photoPath: _model
                                                                        .uploadedFileUrl ==
                                                                    null ||
                                                                _model.uploadedFileUrl ==
                                                                    ''
                                                            ? currentUserPhoto
                                                            : _model
                                                                .uploadedFileUrl,
                                                        photoName: functions
                                                            .getFirstLetterOfString(
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.firstName,
                                                                    '')),
                                                        photoNameFontSize: 24,
                                                        bgColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.profilePhotoSaveButton)
                                                wrapWithModel(
                                                  model: _model
                                                      .primaryRoundedButtonLoadingModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child:
                                                      PrimaryRoundedButtonLoadingWidget(
                                                    buttonText: 'Save',
                                                    buttonBgColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    buttonTextColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    buttonBorderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    buttonWidth: 70,
                                                    buttonHeight: 30,
                                                    disableStatusPara: false,
                                                    buttonAction: () async {
                                                      logFirebaseEvent(
                                                          'PERSONAL_INFORMATION_Container_rblbxowf_');
                                                      logFirebaseEvent(
                                                          'PrimaryRoundedButtonLoading_backend_call');

                                                      await currentUserReference!
                                                          .update(
                                                              createUsersRecordData(
                                                        photoUrl: _model
                                                            .uploadedFileUrl,
                                                      ));
                                                      logFirebaseEvent(
                                                          'PrimaryRoundedButtonLoading_action_block');
                                                      await action_blocks
                                                          .alertSuccess(
                                                        context,
                                                        descPara: 'Saved',
                                                      );
                                                      logFirebaseEvent(
                                                          'PrimaryRoundedButtonLoading_update_page_');
                                                      setState(() {
                                                        _model.profilePhotoSaveButton =
                                                            false;
                                                      });
                                                    },
                                                  ),
                                                ),
                                            ].divide(SizedBox(height: 8.0)),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: 160.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          wrapWithModel(
                                                        model: _model
                                                            .inputTextFieldFirstnameModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        updateOnChange: true,
                                                        child:
                                                            InputTextFieldWidget(
                                                          labelPara:
                                                              'Firstname',
                                                          hintPara: 'Firstname',
                                                          valuePara: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.firstName,
                                                              ''),
                                                          readOnlyStatusPara:
                                                              false,
                                                          actionPara:
                                                              () async {},
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 160.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          wrapWithModel(
                                                        model: _model
                                                            .inputTextFieldLastnameModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        updateOnChange: true,
                                                        child:
                                                            InputTextFieldWidget(
                                                          labelPara: 'Lastname',
                                                          hintPara: 'Lastname',
                                                          valuePara: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.lastName,
                                                              ''),
                                                          readOnlyStatusPara:
                                                              false,
                                                          actionPara:
                                                              () async {},
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          wrapWithModel(
                                            model:
                                                _model.emailTextFieldEmailModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: EmailTextFieldWidget(
                                              labelPara: 'Email Address',
                                              hintPara: 'Email Address',
                                              valuePara: currentUserEmail,
                                              readOnlyStatusPara: false,
                                              actionPara: () async {},
                                            ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => wrapWithModel(
                                              model: _model
                                                  .telTextFieldWithDialCodeModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child:
                                                  TelTextFieldWithDialCodeWidget(
                                                labelPara: 'Phone Number',
                                                valuePara: currentPhoneNumber,
                                                readOnlyStatusPara: false,
                                                actionPara: () async {},
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 2.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'j9irkz7q' /* Gender */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall,
                                                ),
                                              ),
                                              AuthUserStreamWidget(
                                                builder: (context) =>
                                                    FlutterFlowRadioButton(
                                                  options: [
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'md8qitod' /* Male */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'o9y935e7' /* Female */,
                                                    )
                                                  ].toList(),
                                                  onChanged: (val) =>
                                                      setState(() {}),
                                                  controller: _model
                                                          .radioButtonGenderValueController ??=
                                                      FormFieldController<
                                                              String>(
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.gender,
                                                              '')),
                                                  optionHeight: 25.0,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall,
                                                  buttonPosition:
                                                      RadioButtonPosition.left,
                                                  direction: Axis.horizontal,
                                                  radioButtonColor: Colors.blue,
                                                  inactiveRadioButtonColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .lineColor,
                                                  toggleable: false,
                                                  horizontalAlignment:
                                                      WrapAlignment.start,
                                                  verticalAlignment:
                                                      WrapCrossAlignment.start,
                                                ),
                                              ),
                                            ],
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .primaryButtonLoadingSaveModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: PrimaryButtonLoadingWidget(
                                              buttonText: 'Save changes',
                                              buttonWidth: valueOrDefault<int>(
                                                () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width <
                                                      kBreakpointSmall) {
                                                    return 450;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointMedium) {
                                                    return 150;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointLarge) {
                                                    return 150;
                                                  } else {
                                                    return 150;
                                                  }
                                                }(),
                                                150,
                                              ),
                                              buttonHeight: 45,
                                              disableStatusPara: false,
                                              buttonAction: () async {
                                                logFirebaseEvent(
                                                    'PERSONAL_INFORMATION_PrimaryButtonLoadin');
                                                logFirebaseEvent(
                                                    'PrimaryButtonLoading-Save_validate_form');
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                logFirebaseEvent(
                                                    'PrimaryButtonLoading-Save_backend_call');

                                                await currentUserReference!
                                                    .update(
                                                        createUsersRecordData(
                                                  firstName: _model
                                                      .inputTextFieldFirstnameModel
                                                      .textController
                                                      .text,
                                                  lastName: _model
                                                      .inputTextFieldLastnameModel
                                                      .textController
                                                      .text,
                                                  gender: _model
                                                      .radioButtonGenderValue,
                                                  email: _model
                                                      .emailTextFieldEmailModel
                                                      .textController
                                                      .text,
                                                  phoneNumber: _model
                                                      .telTextFieldWithDialCodeModel
                                                      .textFieldPhoneNumberController
                                                      .text,
                                                  dialCode: _model
                                                      .telTextFieldWithDialCodeModel
                                                      .textFieldDialCodeController
                                                      .text,
                                                  displayName:
                                                      '${functions.firstLetterUpperCase(_model.inputTextFieldFirstnameModel.textController.text)} ${functions.firstLetterUpperCase(_model.inputTextFieldLastnameModel.textController.text)}',
                                                ));
                                                logFirebaseEvent(
                                                    'PrimaryButtonLoading-Save_auth');
                                                if (_model
                                                    .emailTextFieldEmailModel
                                                    .textController
                                                    .text
                                                    .isEmpty) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Email required!',
                                                      ),
                                                    ),
                                                  );
                                                  return;
                                                }

                                                await authManager.updateEmail(
                                                  email: _model
                                                      .emailTextFieldEmailModel
                                                      .textController
                                                      .text,
                                                  context: context,
                                                );
                                                setState(() {});

                                                logFirebaseEvent(
                                                    'PrimaryButtonLoading-Save_action_block');
                                                await action_blocks
                                                    .alertSuccess(
                                                  context,
                                                  descPara: 'Saved',
                                                );
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 15.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 30.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
