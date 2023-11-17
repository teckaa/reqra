import '/application/backend/d_w_plugins/cryptos/users/components/list_of_crypto_order_comp/list_of_crypto_order_comp_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/application/components/shimmers/shimmer_account_balance/shimmer_account_balance_widget.dart';
import '/application/components/shimmers/shimmer_button/shimmer_button_widget.dart';
import '/application/components/shimmers/shimmer_photo_grid_details/shimmer_photo_grid_details_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_for_crypto_user_model.dart';
export 'dashboard_for_crypto_user_model.dart';

class DashboardForCryptoUserWidget extends StatefulWidget {
  const DashboardForCryptoUserWidget({
    Key? key,
    String? defaultPlatform,
  })  : this.defaultPlatform = defaultPlatform ?? '',
        super(key: key);

  final String defaultPlatform;

  @override
  _DashboardForCryptoUserWidgetState createState() =>
      _DashboardForCryptoUserWidgetState();
}

class _DashboardForCryptoUserWidgetState
    extends State<DashboardForCryptoUserWidget> {
  late DashboardForCryptoUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardForCryptoUserModel());

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: AuthUserStreamWidget(
                            builder: (context) => wrapWithModel(
                              model: _model.photoGridCoverModel,
                              updateCallback: () => setState(() {}),
                              child: PhotoGridCoverWidget(
                                photoWidth: 35,
                                photoHeight: 35,
                                photoPath: currentUserPhoto,
                                photoName: valueOrDefault<String>(
                                  functions.getFirstLetterOfString(
                                      valueOrDefault(
                                          currentUserDocument?.firstName, '')),
                                  'A',
                                ),
                                photoNameFontSize: 16,
                                bgColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              valueOrDefault<String>(
                                '${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                'Firstname Lastname',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    FutureBuilder<ApiCallResponse>(
                      future: CoinRankingApiGroup.getCoinPriceCall.call(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return ShimmerAccountBalanceWidget(
                            height: 42,
                          );
                        }
                        final columnGetCoinPriceResponse = snapshot.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '5xjkl307' /* Current BTC Price */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                ),
                                ToggleIcon(
                                  onPressed: () async {
                                    setState(() => FFAppState().toggleBalance =
                                        !FFAppState().toggleBalance);
                                    logFirebaseEvent(
                                        'DASHBOARD_FOR_CRYPTO_USER_ToggleIcon_21m');
                                    if (FFAppState().toggleBalance == false) {
                                      logFirebaseEvent(
                                          'ToggleIcon_update_app_state');
                                      setState(() {
                                        FFAppState().toggleBalance = false;
                                      });
                                    } else {
                                      logFirebaseEvent(
                                          'ToggleIcon_update_app_state');
                                      setState(() {
                                        FFAppState().toggleBalance = true;
                                      });
                                    }
                                  },
                                  value: FFAppState().toggleBalance,
                                  onIcon: Icon(
                                    FFIcons.keyeSlash,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 14.0,
                                  ),
                                  offIcon: Icon(
                                    FFIcons.keye,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 14.0,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (FFAppState().toggleBalance == true) {
                                      return Text(
                                        FFLocalizations.of(context).getText(
                                          'g63y23cx' /* ****** */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 30.0,
                                              letterSpacing: 3.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      );
                                    } else {
                                      return Text(
                                        getJsonField(
                                          columnGetCoinPriceResponse.jsonBody,
                                          r'''$.data.coins[:].price''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                StreamBuilder<List<CryptoSettingsRecord>>(
                  stream: queryCryptoSettingsRecord(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Container(
                        height: 35.0,
                        child: ShimmerButtonWidget(
                          buttonWidth: 0,
                        ),
                      );
                    }
                    List<CryptoSettingsRecord>
                        rowButtonCryptoSettingsRecordList = snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final rowButtonCryptoSettingsRecord =
                        rowButtonCryptoSettingsRecordList.isNotEmpty
                            ? rowButtonCryptoSettingsRecordList.first
                            : null;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (rowButtonCryptoSettingsRecord?.permitSelling ==
                            true)
                          wrapWithModel(
                            model: _model.primaryButtonModel1,
                            updateCallback: () => setState(() {}),
                            child: PrimaryButtonWidget(
                              buttonText: 'Sell',
                              buttonBgColor:
                                  FlutterFlowTheme.of(context).primary,
                              buttonWidth: 150,
                              buttonHeight: 45,
                              disableStatusPara: false,
                              buttonHoverColor:
                                  FlutterFlowTheme.of(context).white,
                              buttonAction: () async {
                                logFirebaseEvent(
                                    'DASHBOARD_FOR_CRYPTO_USER_Container_g9gt');
                                logFirebaseEvent('PrimaryButton_navigate_to');

                                context.pushNamed(
                                  'CreateOrder',
                                  queryParameters: {
                                    'orderType': serializeParam(
                                      'Sell',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                            ),
                          ),
                        if (rowButtonCryptoSettingsRecord?.permitBuying == true)
                          wrapWithModel(
                            model: _model.primaryButtonModel2,
                            updateCallback: () => setState(() {}),
                            child: PrimaryButtonWidget(
                              buttonText: 'Buy',
                              buttonBgColor:
                                  FlutterFlowTheme.of(context).lineColor,
                              buttonTextColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              buttonWidth: 150,
                              buttonHeight: 45,
                              disableStatusPara: false,
                              buttonHoverBGColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              buttonHoverColor:
                                  FlutterFlowTheme.of(context).primary,
                              buttonHoverBorderColor:
                                  FlutterFlowTheme.of(context).primary,
                              buttonAction: () async {
                                logFirebaseEvent(
                                    'DASHBOARD_FOR_CRYPTO_USER_Container_zv7v');
                                logFirebaseEvent('PrimaryButton_navigate_to');

                                context.pushNamed(
                                  'CreateOrder',
                                  queryParameters: {
                                    'orderType': serializeParam(
                                      'Buy',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                            ),
                          ),
                      ].divide(SizedBox(width: 15.0)),
                    );
                  },
                ),
              ].divide(SizedBox(height: 15.0)),
            ),
            FutureBuilder<int>(
              future: queryCryptoOrdersRecordCount(
                queryBuilder: (cryptoOrdersRecord) => cryptoOrdersRecord.where(
                  'user_ref',
                  isEqualTo: currentUserReference,
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Container(
                    width: 90.0,
                    child: ShimmerPhotoGridDetailsWidget(
                      photoSizePara: 20,
                      lineHeightPara: 6,
                    ),
                  );
                }
                int rowAllOrdersSectionCount = snapshot.data!;
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'DASHBOARD_FOR_CRYPTO_USER_Row-AllOrdersS');
                    logFirebaseEvent('Row-AllOrdersSection_navigate_to');

                    context.pushNamed('ListOfCryptoOrders');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        FFIcons.ktask,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Text(
                          '${formatNumber(
                            rowAllOrdersSectionCount,
                            formatType: FormatType.compact,
                          )} Activity',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: wrapWithModel(
                  model: _model.listOfCryptoOrderCompModel,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: ListOfCryptoOrderCompWidget(),
                ),
              ),
            ),
          ].divide(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
