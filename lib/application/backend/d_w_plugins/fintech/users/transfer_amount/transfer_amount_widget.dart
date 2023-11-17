import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/fintech/users/confirm_transfer_details/confirm_transfer_details_widget.dart';
import '/application/components/forms/input_text_field/input_text_field_widget.dart';
import '/application/components/forms/right_sided_amount_text_field/right_sided_amount_text_field_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/shimmers/shimmer_one_detail/shimmer_one_detail_widget.dart';
import '/application/components/shimmers/shimmer_photo_grid/shimmer_photo_grid_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'transfer_amount_model.dart';
export 'transfer_amount_model.dart';

class TransferAmountWidget extends StatefulWidget {
  const TransferAmountWidget({
    Key? key,
    this.userTransferRef,
  }) : super(key: key);

  final DocumentReference? userTransferRef;

  @override
  _TransferAmountWidgetState createState() => _TransferAmountWidgetState();
}

class _TransferAmountWidgetState extends State<TransferAmountWidget> {
  late TransferAmountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransferAmountModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TransferAmount'});
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
        title: 'Transfer Amount',
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
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.karrowLeft2,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'TRANSFER_AMOUNT_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'm8t0cs24' /* Transfer */,
                      ),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
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
                        wrapWithModel(
                          model: _model.dWHeaderModel,
                          updateCallback: () => setState(() {}),
                          child: DWHeaderWidget(
                            pageTitle: 'Transfer',
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 20.0),
                                child: Container(
                                  width: 400.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEAF0FF),
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0, 50.0, 25.0, 50.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              widget.userTransferRef!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Container(
                                                width: 50.0,
                                                height: 50.0,
                                                child: ShimmerPhotoGridWidget(),
                                              );
                                            }
                                            final columnProfilePhotoUsersRecord =
                                                snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                  ),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .photoGridCoverModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: PhotoGridCoverWidget(
                                                      photoWidth: 60,
                                                      photoHeight: 60,
                                                      photoPath:
                                                          columnProfilePhotoUsersRecord
                                                              .photoUrl,
                                                      photoName: functions
                                                          .getFirstLetterOfString(
                                                              columnProfilePhotoUsersRecord
                                                                  .firstName),
                                                      photoNameFontSize: 20,
                                                      bgColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${columnProfilePhotoUsersRecord.firstName} ${columnProfilePhotoUsersRecord.lastName}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                                Text(
                                                  columnProfilePhotoUsersRecord
                                                      .accountNumber
                                                      .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ].divide(SizedBox(height: 5.0)),
                                            );
                                          },
                                        ),
                                        StreamBuilder<
                                            List<FintechSettingsRecord>>(
                                          stream: queryFintechSettingsRecord(
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return ShimmerOneDetailWidget();
                                            }
                                            List<FintechSettingsRecord>
                                                formAmountFintechSettingsRecordList =
                                                snapshot.data!;
                                            final formAmountFintechSettingsRecord =
                                                formAmountFintechSettingsRecordList
                                                        .isNotEmpty
                                                    ? formAmountFintechSettingsRecordList
                                                        .first
                                                    : null;
                                            return Form(
                                              key: _model.formKey,
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  8.0,
                                                                  8.0,
                                                                  8.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Text(
                                                          '${valueOrDefault(currentUserDocument?.currency, '')} Balance: ${formatNumber(
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.accountBalance,
                                                                0.0),
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .automatic,
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .rightSidedAmountTextFieldModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          RightSidedAmountTextFieldWidget(
                                                        labelPara: 'Amount',
                                                        hintPara:
                                                            '50.00 - 5,000.000.00',
                                                        sidedText:
                                                            valueOrDefault<
                                                                String>(
                                                          formAmountFintechSettingsRecord
                                                              ?.pluginCurrency,
                                                          'NGN',
                                                        ),
                                                        readOnlyStatusPara:
                                                            false,
                                                        actionPara: () async {
                                                          logFirebaseEvent(
                                                              'TRANSFER_AMOUNT_Container_c20mouxb_CALLB');
                                                          logFirebaseEvent(
                                                              'RightSidedAmountTextField_update_page_st');
                                                          setState(() {
                                                            _model.amount = int
                                                                .tryParse(_model
                                                                    .rightSidedAmountTextFieldModel
                                                                    .textController
                                                                    .text);
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .inputTextFieldModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: InputTextFieldWidget(
                                                      labelPara: 'Remark',
                                                      hintPara:
                                                          'What\'s this for? (Optional)',
                                                      actionPara: () async {},
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) =>
                                                        FFButtonWidget(
                                                      onPressed: _model
                                                                      .rightSidedAmountTextFieldModel
                                                                      .textController
                                                                      .text ==
                                                                  null ||
                                                              _model
                                                                      .rightSidedAmountTextFieldModel
                                                                      .textController
                                                                      .text ==
                                                                  ''
                                                          ? null
                                                          : () async {
                                                              logFirebaseEvent(
                                                                  'TRANSFER_AMOUNT_PAGE_Button-Save_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Button-Save_validate_form');
                                                              if (_model.formKey
                                                                          .currentState ==
                                                                      null ||
                                                                  !_model
                                                                      .formKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                return;
                                                              }
                                                              if (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.accountBalance,
                                                                      0.0) >=
                                                                  _model
                                                                      .amount!) {
                                                                logFirebaseEvent(
                                                                    'Button-Save_alert_dialog');
                                                                await showAlignedDialog(
                                                                  context:
                                                                      context,
                                                                  isGlobal:
                                                                      true,
                                                                  avoidOverflow:
                                                                      false,
                                                                  targetAnchor: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  followerAnchor: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child: WebViewAware(
                                                                          child: GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            ConfirmTransferDetailsWidget(
                                                                          userTransferRef:
                                                                              widget.userTransferRef,
                                                                          amount: int.tryParse(_model
                                                                              .rightSidedAmountTextFieldModel
                                                                              .textController
                                                                              .text),
                                                                          note: _model
                                                                              .inputTextFieldModel
                                                                              .textController
                                                                              .text,
                                                                        ),
                                                                      )),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Button-Save_action_block');
                                                                await action_blocks
                                                                    .alertError(
                                                                  context,
                                                                  descPara:
                                                                      'Insufficient Balance',
                                                                );
                                                              }
                                                            },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'w35ehu58' /* Send */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        disabledColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                        disabledTextColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 20.0)),
                                              ),
                                            );
                                          },
                                        ),
                                      ].divide(SizedBox(height: 40.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
