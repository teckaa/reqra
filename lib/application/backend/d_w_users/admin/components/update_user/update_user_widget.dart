import '/application/components/forms/country_text_field_with_flag/country_text_field_with_flag_widget.dart';
import '/application/components/forms/dropdown_basic/dropdown_basic_widget.dart';
import '/application/components/forms/email_text_field/email_text_field_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/tel_text_field_with_dial_code/tel_text_field_with_dial_code_widget.dart';
import '/application/components/modals/modal_footer_row/modal_footer_row_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_list_of_details/shimmer_list_of_details_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'update_user_model.dart';
export 'update_user_model.dart';

class UpdateUserWidget extends StatefulWidget {
  const UpdateUserWidget({
    Key? key,
    this.userRef,
  }) : super(key: key);

  final DocumentReference? userRef;

  @override
  _UpdateUserWidgetState createState() => _UpdateUserWidgetState();
}

class _UpdateUserWidgetState extends State<UpdateUserWidget> {
  late UpdateUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateUserModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
            child: StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(widget.userRef!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return ShimmerListOfDetailsWidget();
                }
                final containerUsersRecord = snapshot.data!;
                return Container(
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
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).accent4,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.modalHeaderModel,
                        updateCallback: () => setState(() {}),
                        child: ModalHeaderWidget(
                          headerTitlePara: 'Edit user information',
                          headerActionPara: () async {
                            logFirebaseEvent(
                                'UPDATE_USER_Container_gc0rbb5b_CALLBACK');
                            logFirebaseEvent('ModalHeader_bottom_sheet');
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .inputTextFieldFirstnameModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          InputTextFieldWidget(
                                                        labelPara: 'Firstname',
                                                        hintPara: 'Firstname',
                                                        valuePara:
                                                            containerUsersRecord
                                                                .firstName,
                                                        readOnlyStatusPara:
                                                            false,
                                                        actionPara: () async {},
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
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .inputTextFieldLastnameModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          InputTextFieldWidget(
                                                        labelPara: 'Lastname',
                                                        hintPara: 'Lastname',
                                                        valuePara:
                                                            containerUsersRecord
                                                                .lastName,
                                                        actionPara: () async {},
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
                                            child: EmailTextFieldWidget(
                                              labelPara: 'Email Address',
                                              hintPara: 'Email address',
                                              valuePara:
                                                  containerUsersRecord.email,
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
                                              valuePara: containerUsersRecord
                                                  .phoneNumber,
                                              readOnlyStatusPara: false,
                                              dialCodePara:
                                                  containerUsersRecord.dialCode,
                                              actionPara: () async {},
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
                                                    '2kr9vb7u' /* Gender */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall,
                                                ),
                                              ),
                                              FlutterFlowRadioButton(
                                                options: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '214kpf8y' /* Male */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'cfmlppqe' /* Female */,
                                                  )
                                                ].toList(),
                                                onChanged: (val) =>
                                                    setState(() {}),
                                                controller: _model
                                                        .radioButtonGenderValueController ??=
                                                    FormFieldController<String>(
                                                        containerUsersRecord
                                                            .gender),
                                                optionHeight: 25.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall,
                                                selectedTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall,
                                                buttonPosition:
                                                    RadioButtonPosition.left,
                                                direction: Axis.horizontal,
                                                radioButtonColor: Colors.blue,
                                                inactiveRadioButtonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                toggleable: false,
                                                horizontalAlignment:
                                                    WrapAlignment.start,
                                                verticalAlignment:
                                                    WrapCrossAlignment.start,
                                              ),
                                            ],
                                          ),
                                        ].divide(SizedBox(height: 15.0)),
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'eccq8bqn' /* Address */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          wrapWithModel(
                                            model:
                                                _model.inputTextFieldAptModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: InputTextFieldWidget(
                                              labelPara:
                                                  'Apt, Suite # (Optional)',
                                              hintPara: 'Apt, Suite #',
                                              valuePara: containerUsersRecord
                                                  .apartmentNumber,
                                              actionPara: () async {},
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .inputTextFieldStreetModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: InputTextFieldWidget(
                                              labelPara: 'Residential Address',
                                              hintPara: 'Street address',
                                              valuePara:
                                                  containerUsersRecord.state,
                                              readOnlyStatusPara: false,
                                              actionPara: () async {},
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .inputTextFieldZipcodeModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: InputTextFieldWidget(
                                              labelPara: 'Zip code (Optional)',
                                              hintPara: 'Zipcode',
                                              valuePara:
                                                  containerUsersRecord.zipcode,
                                              readOnlyStatusPara: false,
                                              actionPara: () async {},
                                            ),
                                          ),
                                          wrapWithModel(
                                            model:
                                                _model.inputTextFieldCityModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: InputTextFieldWidget(
                                              labelPara: 'City',
                                              hintPara: 'City',
                                              valuePara:
                                                  containerUsersRecord.city,
                                              readOnlyStatusPara: false,
                                              actionPara: () async {},
                                            ),
                                          ),
                                          wrapWithModel(
                                            model:
                                                _model.inputTextFieldStateModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: InputTextFieldWidget(
                                              labelPara: 'State',
                                              hintPara: 'State',
                                              valuePara:
                                                  containerUsersRecord.state,
                                              readOnlyStatusPara: false,
                                              actionPara: () async {},
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .countryTextFieldWithFlagModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child:
                                                CountryTextFieldWithFlagWidget(
                                              labelPara: 'Country',
                                              hintPara: 'Country',
                                              valuePara:
                                                  containerUsersRecord.country,
                                              readOnlyStatusPara: false,
                                              isoCodePara:
                                                  containerUsersRecord.isoCode,
                                              actionPara: () async {},
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 15.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'UPDATE_USER_COMP_Text_x52yj9eq_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_update_component_state');
                                              setState(() {
                                                _model.showAdvance = true;
                                              });
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'jwleu1mq' /* Show more */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'UPDATE_USER_COMP_Text_8c0i6zbd_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_update_component_state');
                                              setState(() {
                                                _model.showAdvance = false;
                                              });
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '88beivce' /* Show less */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (_model.showAdvance == true)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'dfp837iq' /* This is the role of the user */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                            ),
                                            AuthUserStreamWidget(
                                              builder: (context) => StreamBuilder<
                                                  List<
                                                      DwRolesPermissionsRecord>>(
                                                stream:
                                                    queryDwRolesPermissionsRecord(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child:
                                                          LinearProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    );
                                                  }
                                                  List<DwRolesPermissionsRecord>
                                                      dropdownBasicRoleDwRolesPermissionsRecordList =
                                                      snapshot.data!;
                                                  return wrapWithModel(
                                                    model: _model
                                                        .dropdownBasicRoleModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    updateOnChange: true,
                                                    child: DropdownBasicWidget(
                                                      labelPara: 'Roles',
                                                      optionValuePara:
                                                          containerUsersRecord
                                                              .userRole,
                                                      dropdownIcon: Icon(
                                                        FFIcons.karrowDown1,
                                                      ),
                                                      listLabelPara:
                                                          dropdownBasicRoleDwRolesPermissionsRecordList
                                                              .map((e) => e
                                                                  .permissionName)
                                                              .toList(),
                                                      listValuePara:
                                                          dropdownBasicRoleDwRolesPermissionsRecordList
                                                              .map((e) => e
                                                                  .permissionName)
                                                              .toList(),
                                                      disableDropdownPara: (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.userRole,
                                                                  '') ==
                                                              'Owner') ||
                                                          (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.userRole,
                                                                  '') ==
                                                              'Admin') ||
                                                          (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.userRole,
                                                                  '') ==
                                                              'Customer Support') ||
                                                          (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.userRole,
                                                                  '') ==
                                                              'IT Support'),
                                                      actionPara: () async {},
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 15.0)),
                                        ),
                                    ].divide(SizedBox(height: 20.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.modalFooterRowModel,
                        updateCallback: () => setState(() {}),
                        child: ModalFooterRowWidget(
                          cancelTextPara: 'Cancel',
                          proceedTextPara: 'Save changes',
                          disableProceedBtnPara: false,
                          proceedActionPara: () async {
                            logFirebaseEvent(
                                'UPDATE_USER_Container_2l29a8kh_CALLBACK');
                            logFirebaseEvent('ModalFooterRow_validate_form');
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            logFirebaseEvent('ModalFooterRow_backend_call');

                            await containerUsersRecord.reference
                                .update(createUsersRecordData(
                              firstName: _model.inputTextFieldFirstnameModel
                                  .textController.text,
                              lastName: _model.inputTextFieldLastnameModel
                                  .textController.text,
                              gender: _model.radioButtonGenderValue,
                              email: _model
                                  .emailTextFieldEmailModel.textController.text,
                              phoneNumber: _model.telTextFieldWithDialCodeModel
                                  .textFieldPhoneNumberController.text,
                              dialCode: _model.telTextFieldWithDialCodeModel
                                  .textFieldDialCodeController.text,
                              apartmentNumber: _model
                                  .inputTextFieldAptModel.textController.text,
                              street: _model.inputTextFieldStreetModel
                                  .textController.text,
                              city: _model
                                  .inputTextFieldCityModel.textController.text,
                              zipcode: _model.inputTextFieldZipcodeModel
                                  .textController.text,
                              state: _model
                                  .inputTextFieldStateModel.textController.text,
                              country: '',
                              displayName:
                                  '${functions.firstLetterUpperCase(_model.inputTextFieldFirstnameModel.textController.text)} ${functions.firstLetterUpperCase(_model.inputTextFieldLastnameModel.textController.text)}',
                              userRole:
                                  _model.dropdownBasicRoleModel.dropDownValue,
                            ));
                            logFirebaseEvent('ModalFooterRow_auth');
                            if (_model.emailTextFieldEmailModel.textController
                                .text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
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
                                  .emailTextFieldEmailModel.textController.text,
                              context: context,
                            );
                            setState(() {});

                            logFirebaseEvent('ModalFooterRow_action_block');
                            await action_blocks.alertSuccess(
                              context,
                              descPara: 'Saved',
                            );
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
