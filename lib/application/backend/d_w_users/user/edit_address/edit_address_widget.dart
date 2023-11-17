import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/application/components/forms/country_text_field_with_flag/country_text_field_with_flag_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
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
import 'edit_address_model.dart';
export 'edit_address_model.dart';

class EditAddressWidget extends StatefulWidget {
  const EditAddressWidget({Key? key}) : super(key: key);

  @override
  _EditAddressWidgetState createState() => _EditAddressWidgetState();
}

class _EditAddressWidgetState extends State<EditAddressWidget> {
  late EditAddressModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditAddressModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'EditAddress'});
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
        title: 'Edit Address',
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
                            'EDIT_ADDRESS_PAGE_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.safePop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'x3nrkkol' /* Address */,
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
                      selectedSidebarNav: 'Address',
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
                            pageTitle: 'Address',
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
                                  decoration: BoxDecoration(),
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
                                              titleName: 'Address',
                                              actionPara: () async {
                                                logFirebaseEvent(
                                                    'EDIT_ADDRESS_Container_rlv4maqp_CALLBACK');
                                                logFirebaseEvent(
                                                    'TitleWithBackButton_navigate_back');
                                                context.pop();
                                              },
                                            ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => wrapWithModel(
                                              model:
                                                  _model.inputTextFieldAptModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: InputTextFieldWidget(
                                                labelPara:
                                                    'Apt, Suite # (Optional)',
                                                hintPara: 'Apt, Suite #',
                                                valuePara: valueOrDefault(
                                                    currentUserDocument
                                                        ?.apartmentNumber,
                                                    ''),
                                                actionPara: () async {},
                                              ),
                                            ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => wrapWithModel(
                                              model: _model
                                                  .inputTextFieldStreetModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: InputTextFieldWidget(
                                                labelPara:
                                                    'Residential Address',
                                                hintPara: 'Street address',
                                                valuePara: valueOrDefault(
                                                    currentUserDocument?.street,
                                                    ''),
                                                readOnlyStatusPara: false,
                                                actionPara: () async {},
                                              ),
                                            ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => wrapWithModel(
                                              model: _model
                                                  .inputTextFieldZipcodeModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: InputTextFieldWidget(
                                                labelPara:
                                                    'Zip code (Optional)',
                                                hintPara: 'Zipcode',
                                                valuePara: valueOrDefault(
                                                    currentUserDocument
                                                        ?.zipcode,
                                                    ''),
                                                actionPara: () async {},
                                              ),
                                            ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => wrapWithModel(
                                              model: _model
                                                  .inputTextFieldCityModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: InputTextFieldWidget(
                                                labelPara: 'City',
                                                hintPara: 'City',
                                                valuePara: valueOrDefault(
                                                    currentUserDocument?.city,
                                                    ''),
                                                readOnlyStatusPara: false,
                                                actionPara: () async {},
                                              ),
                                            ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => wrapWithModel(
                                              model: _model
                                                  .inputTextFieldStateModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: InputTextFieldWidget(
                                                labelPara: 'State',
                                                hintPara: 'State',
                                                valuePara: valueOrDefault(
                                                    currentUserDocument?.state,
                                                    ''),
                                                readOnlyStatusPara: false,
                                                actionPara: () async {},
                                              ),
                                            ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => wrapWithModel(
                                              model: _model
                                                  .countryTextFieldWithFlagModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child:
                                                  CountryTextFieldWithFlagWidget(
                                                labelPara: 'Country',
                                                valuePara: valueOrDefault(
                                                    currentUserDocument
                                                        ?.country,
                                                    ''),
                                                readOnlyStatusPara: false,
                                                actionPara: () async {},
                                              ),
                                            ),
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .primaryButtonLoadingSaveModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: PrimaryButtonLoadingWidget(
                                              buttonText: 'Save',
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
                                                    return 120;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointLarge) {
                                                    return 120;
                                                  } else {
                                                    return 120;
                                                  }
                                                }(),
                                                120,
                                              ),
                                              buttonHeight: 45,
                                              disableStatusPara: false,
                                              buttonAction: () async {
                                                logFirebaseEvent(
                                                    'EDIT_ADDRESS_PrimaryButtonLoading-Save_C');
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
                                                  apartmentNumber: _model
                                                      .inputTextFieldAptModel
                                                      .textController
                                                      .text,
                                                  street: _model
                                                      .inputTextFieldStreetModel
                                                      .textController
                                                      .text,
                                                  city: _model
                                                      .inputTextFieldCityModel
                                                      .textController
                                                      .text,
                                                  state: _model
                                                      .inputTextFieldStateModel
                                                      .textController
                                                      .text,
                                                  country: _model
                                                      .countryTextFieldWithFlagModel
                                                      .textFieldCountryController
                                                      .text,
                                                  isoCode: _model
                                                      .countryTextFieldWithFlagModel
                                                      .textFieldIsoCodeController
                                                      .text,
                                                ));
                                                logFirebaseEvent(
                                                    'PrimaryButtonLoading-Save_action_block');
                                                await action_blocks
                                                    .alertSuccess(
                                                  context,
                                                  descPara: 'Saved',
                                                );
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
