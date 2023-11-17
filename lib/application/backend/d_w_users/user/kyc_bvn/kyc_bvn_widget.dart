import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/forms/number_text_field/number_text_field_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
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
import 'kyc_bvn_model.dart';
export 'kyc_bvn_model.dart';

class KycBvnWidget extends StatefulWidget {
  const KycBvnWidget({Key? key}) : super(key: key);

  @override
  _KycBvnWidgetState createState() => _KycBvnWidgetState();
}

class _KycBvnWidgetState extends State<KycBvnWidget> {
  late KycBvnModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KycBvnModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'KYC-BVN'});
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
        title: 'KYC/BVN',
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
                        logFirebaseEvent('KYC_BVN_PAGE_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'm2gc9xot' /* Security */,
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
                      selectedSidebarNav: 'KYC (Know your customers)',
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: SingleChildScrollView(
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
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 20.0),
                                    child: Container(
                                      width: 450.0,
                                      decoration: BoxDecoration(),
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
                                              titleName: 'Verify your Account',
                                              actionPara: () async {
                                                logFirebaseEvent(
                                                    'KYC_BVN_PAGE_Container_zb2a2n2f_CALLBACK');
                                                logFirebaseEvent(
                                                    'TitleWithBackButton_navigate_back');
                                                context.safePop();
                                              },
                                            ),
                                          ),
                                          Form(
                                            key: _model.formKey,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'gwq672m5' /* Link your BVN (11-digit) */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall,
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .numberTextFieldBVNModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  updateOnChange: true,
                                                  child: NumberTextFieldWidget(
                                                    labelPara:
                                                        'Enable security by connecting BVN',
                                                    actionPara: () async {},
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: _model
                                                                  .numberTextFieldBVNModel
                                                                  .textController
                                                                  .text ==
                                                              null ||
                                                          _model
                                                                  .numberTextFieldBVNModel
                                                                  .textController
                                                                  .text ==
                                                              ''
                                                      ? null
                                                      : () async {
                                                          logFirebaseEvent(
                                                              'KYC_BVN_PAGE_Button-Proceed_ON_TAP');
                                                          var _shouldSetState =
                                                              false;
                                                          final firestoreBatch =
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .batch();
                                                          try {
                                                            logFirebaseEvent(
                                                                'Button-Proceed_backend_call');
                                                            _model.apiResultForBvn =
                                                                await FluttewaveApiGroup
                                                                    .createVirtualAccountNumberCall
                                                                    .call(
                                                              firstname: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.firstName,
                                                                  ''),
                                                              lastname: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.lastName,
                                                                  ''),
                                                              email:
                                                                  currentUserEmail,
                                                              phonenumber:
                                                                  currentPhoneNumber,
                                                              narration:
                                                                  '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                                              bvn: _model
                                                                  .numberTextFieldBVNModel
                                                                  .textController
                                                                  .text,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if ((_model
                                                                    .apiResultForBvn
                                                                    ?.succeeded ??
                                                                true)) {
                                                              logFirebaseEvent(
                                                                  'Button-Proceed_backend_call');

                                                              firestoreBatch
                                                                  .set(
                                                                      UserVirtualAccountsRecord
                                                                          .collection
                                                                          .doc(),
                                                                      createUserVirtualAccountsRecordData(
                                                                        expiryDate:
                                                                            getJsonField(
                                                                          (_model.apiResultForBvn?.jsonBody ??
                                                                              ''),
                                                                          r'''$.data.expiry_date''',
                                                                        ).toString(),
                                                                        flwRef:
                                                                            getJsonField(
                                                                          (_model.apiResultForBvn?.jsonBody ??
                                                                              ''),
                                                                          r'''$.data.flw_ref''',
                                                                        ).toString(),
                                                                        orderRef:
                                                                            getJsonField(
                                                                          (_model.apiResultForBvn?.jsonBody ??
                                                                              ''),
                                                                          r'''$.data.order_ref''',
                                                                        ).toString(),
                                                                        accountNumber:
                                                                            getJsonField(
                                                                          (_model.apiResultForBvn?.jsonBody ??
                                                                              ''),
                                                                          r'''$.data.account_number''',
                                                                        ).toString(),
                                                                        accountStatus:
                                                                            getJsonField(
                                                                          (_model.apiResultForBvn?.jsonBody ??
                                                                              ''),
                                                                          r'''$.data.account_status''',
                                                                        ).toString(),
                                                                        frequency:
                                                                            getJsonField(
                                                                          (_model.apiResultForBvn?.jsonBody ??
                                                                              ''),
                                                                          r'''$.data.frequency''',
                                                                        ).toString(),
                                                                        bankName:
                                                                            getJsonField(
                                                                          (_model.apiResultForBvn?.jsonBody ??
                                                                              ''),
                                                                          r'''$.data.bank_name''',
                                                                        ).toString(),
                                                                        amount:
                                                                            getJsonField(
                                                                          (_model.apiResultForBvn?.jsonBody ??
                                                                              ''),
                                                                          r'''$.data.amount''',
                                                                        ),
                                                                        createdAt:
                                                                            getCurrentTimestamp,
                                                                        userRef:
                                                                            currentUserReference,
                                                                      ));
                                                              logFirebaseEvent(
                                                                  'Button-Proceed_backend_call');

                                                              firestoreBatch.update(
                                                                  currentUserReference!,
                                                                  createUsersRecordData(
                                                                    bvnNumber: _model
                                                                        .numberTextFieldBVNModel
                                                                        .textController
                                                                        .text,
                                                                  ));
                                                              logFirebaseEvent(
                                                                  'Button-Proceed_navigate_to');

                                                              context.pushNamed(
                                                                  'FundWallet');
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'Button-Proceed_action_block');
                                                              await action_blocks
                                                                  .alertError(
                                                                context,
                                                                descPara:
                                                                    'BVN must be 11 digits long',
                                                              );
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                          } finally {
                                                            await firestoreBatch
                                                                .commit();
                                                          }

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'zb2uxeyx' /* Proceed */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 120.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                    disabledColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent4,
                                                    disabledTextColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 15.0)),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 20.0)),
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
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
