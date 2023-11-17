import '/application/backend/d_w_plugins/bill_payments/components/transaction_details/transaction_details_widget.dart';
import '/application/backend/d_w_users/admin/components/read_user/read_user_widget.dart';
import '/application/backend/external_api/flutterwave/components/list_of_flutterwave_currencies/list_of_flutterwave_currencies_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/layouts/photo_column_with_details/photo_column_with_details_widget.dart';
import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/shimmers/shimmer_amount/shimmer_amount_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/application/components/shimmers/shimmer_list_of_tables/shimmer_list_of_tables_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'dashboard_for_admin_model.dart';
export 'dashboard_for_admin_model.dart';

class DashboardForAdminWidget extends StatefulWidget {
  const DashboardForAdminWidget({Key? key}) : super(key: key);

  @override
  _DashboardForAdminWidgetState createState() =>
      _DashboardForAdminWidgetState();
}

class _DashboardForAdminWidgetState extends State<DashboardForAdminWidget> {
  late DashboardForAdminModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardForAdminModel());

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
    final chartPieChartColorsList = [
      FlutterFlowTheme.of(context).primary,
      Color(0xFF6F28CB),
      Color(0xFF2536A4),
      Color(0xFF4A57C1)
    ];
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'clxj8d68' /* Overview */,
                    ),
                    style: FlutterFlowTheme.of(context).displaySmall,
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'afrf6e95' /* Below is your company overview */,
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 280.0,
                      height: 120.0,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FFIcons.kdiagram,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'xbqlgc1r' /* Income this Month */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                                StreamBuilder<List<UsersRecord>>(
                                  stream: queryUsersRecord(
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: LinearProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      );
                                    }
                                    List<UsersRecord> textUsersRecordList =
                                        snapshot.data!;
                                    final textUsersRecord =
                                        textUsersRecordList.isNotEmpty
                                            ? textUsersRecordList.first
                                            : null;
                                    return Text(
                                      FFLocalizations.of(context).getText(
                                        '44q0qkko' /* 0.00 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmallFamily,
                                            fontSize: 24.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmallFamily),
                                          ),
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        ].divide(SizedBox(width: 15.0)),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      child: VerticalDivider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'DASHBOARD_FOR_ADMIN_Card_Users_ON_TAP');
                        logFirebaseEvent('Card_Users_navigate_to');

                        context.pushNamed('ListOfUsers');
                      },
                      child: Container(
                        width: 280.0,
                        height: 120.0,
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FFIcons.kpeople,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '3yjwpjk4' /* Users */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                  FutureBuilder<int>(
                                    future: queryUsersRecordCount(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return ShimmerAmountWidget();
                                      }
                                      int textCount = snapshot.data!;
                                      return Text(
                                        formatNumber(
                                          textCount,
                                          formatType: FormatType.compact,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmallFamily,
                                              fontSize: 24.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmallFamily),
                                            ),
                                      );
                                    },
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            ),
                          ].divide(SizedBox(width: 15.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      child: VerticalDivider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                    ),
                    Container(
                      width: 280.0,
                      height: 120.0,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FFIcons.kshoppingCart,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'oxa8cdf8' /* Total Orders */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                                FutureBuilder<int>(
                                  future: queryBillpaymentOrdersRecordCount(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return ShimmerAmountWidget();
                                    }
                                    int textCount = snapshot.data!;
                                    return Text(
                                      formatNumber(
                                        textCount,
                                        formatType: FormatType.compact,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmallFamily,
                                            fontSize: 24.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmallFamily),
                                          ),
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        ].divide(SizedBox(width: 15.0)),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                      child: VerticalDivider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                    ),
                    Container(
                      width: 280.0,
                      height: 120.0,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FFIcons.kshoppingCart,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'b75fwcn8' /* Total Commission/Profits */,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'i7n33e20' /* NGN 0.00 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displaySmallFamily,
                                        fontSize: 24.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .displaySmallFamily),
                                      ),
                                ),
                              ].divide(SizedBox(height: 5.0)),
                            ),
                          ),
                        ].divide(SizedBox(width: 15.0)),
                      ),
                    ),
                  ].divide(SizedBox(width: 20.0)),
                ),
              ),
              Wrap(
                spacing: 30.0,
                runSpacing: 30.0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: valueOrDefault<double>(
                      () {
                        if (MediaQuery.sizeOf(context).width <
                            kBreakpointSmall) {
                          return 450.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointMedium) {
                          return 600.0;
                        } else if (MediaQuery.sizeOf(context).width <
                            kBreakpointLarge) {
                          return 350.0;
                        } else {
                          return 350.0;
                        }
                      }(),
                      350.0,
                    ),
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).lineColor,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'itt5kx58' /* Account Overview */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'hpykbkcb' /* Balance */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'DASHBOARD_FOR_ADMIN_Container-Currency_O');
                                            logFirebaseEvent(
                                                'Container-Currency_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .overlay,
                                              useSafeArea: true,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                    child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      ListOfFlutterwaveCurrenciesWidget(),
                                                ));
                                              },
                                            ).then((value) => safeSetState(() =>
                                                _model.getCurrencyName =
                                                    value));

                                            setState(() {});
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 5.0, 5.0, 5.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  _model.getCurrencyName !=
                                                              null &&
                                                          _model.getCurrencyName !=
                                                              ''
                                                      ? _model.getCurrencyName
                                                      : 'NGN',
                                                  'NGN',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          fontSize: 11.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily),
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                    StreamBuilder<
                                        List<BillpaymentSettingsRecord>>(
                                      stream: queryBillpaymentSettingsRecord(
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return ShimmerAmountWidget(
                                            sizePara: 29,
                                          );
                                        }
                                        List<BillpaymentSettingsRecord>
                                            columnBillpaymentSettingsRecordList =
                                            snapshot.data!;
                                        final columnBillpaymentSettingsRecord =
                                            columnBillpaymentSettingsRecordList
                                                    .isNotEmpty
                                                ? columnBillpaymentSettingsRecordList
                                                    .first
                                                : null;
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FutureBuilder<ApiCallResponse>(
                                              future: FluttewaveApiGroup
                                                  .fetchBalanceByCurrencyCall
                                                  .call(
                                                currency: _model.getCurrencyName !=
                                                            null &&
                                                        _model.getCurrencyName !=
                                                            ''
                                                    ? _model.getCurrencyName
                                                    : 'NGN',
                                                apiKey:
                                                    columnBillpaymentSettingsRecord
                                                        ?.pluginProviderApiKey,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return ShimmerAmountWidget(
                                                    sizePara: 29,
                                                  );
                                                }
                                                final textFetchBalanceByCurrencyResponse =
                                                    snapshot.data!;
                                                return Text(
                                                  valueOrDefault<String>(
                                                    '${getJsonField(
                                                      textFetchBalanceByCurrencyResponse
                                                          .jsonBody,
                                                      r'''$.data.currency''',
                                                    ).toString()} ${getJsonField(
                                                      textFetchBalanceByCurrencyResponse
                                                          .jsonBody,
                                                      r'''$.data.available_balance''',
                                                    ).toString()}',
                                                    'NGN 0.00',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displaySmallFamily,
                                                        fontSize: 24.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmallFamily),
                                                      ),
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.primaryButtonModel1,
                                        updateCallback: () => setState(() {}),
                                        updateOnChange: true,
                                        child: PrimaryButtonWidget(
                                          buttonText: 'Fund your Flutterwave',
                                          buttonTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .white,
                                          buttonWidth: 450,
                                          disableStatusPara: false,
                                          buttonHoverColor:
                                              FlutterFlowTheme.of(context)
                                                  .white,
                                          buttonAction: () async {},
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'trx56c6m' /* Users */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                    StreamBuilder<List<UsersRecord>>(
                                      stream: queryUsersRecord(
                                        limit: 15,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return ShimmerCardWidget(
                                            heightPara: 5,
                                          );
                                        }
                                        List<UsersRecord> rowUsersRecordList =
                                            snapshot.data!
                                                .where((u) =>
                                                    u.uid != currentUserUid)
                                                .toList();
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                rowUsersRecordList.length,
                                                (rowIndex) {
                                              final rowUsersRecord =
                                                  rowUsersRecordList[rowIndex];
                                              return Container(
                                                width: 150.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lineColor,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 15.0,
                                                          15.0, 15.0),
                                                  child: InkWell(
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
                                                          'DASHBOARD_FOR_ADMIN_Container_qen73q0h_O');
                                                      logFirebaseEvent(
                                                          'PhotoColumnWithDetails_bottom_sheet');
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        barrierColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .overlay,
                                                        useSafeArea: true,
                                                        context: context,
                                                        builder: (context) {
                                                          return WebViewAware(
                                                              child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                ReadUserWidget(
                                                              userRef:
                                                                  rowUsersRecord
                                                                      .reference,
                                                            ),
                                                          ));
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child:
                                                        PhotoColumnWithDetailsWidget(
                                                      key: Key(
                                                          'Keyqen_${rowIndex}_of_${rowUsersRecordList.length}'),
                                                      photoPathPara:
                                                          rowUsersRecord
                                                              .photoUrl,
                                                      titlePara:
                                                          '${rowUsersRecord.firstName} ${rowUsersRecord.lastName}',
                                                      descPara: rowUsersRecord
                                                          .country,
                                                      widthPara: 40,
                                                      heightPara: 40,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).divide(SizedBox(width: 25.0)),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 20.0)),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).lineColor,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '7x7qemdh' /* Outstanding Balance */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '2bk9j7gv' /* NGN 0.00 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmallFamily,
                                            fontSize: 24.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmallFamily),
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                                CircularPercentIndicator(
                                  percent: 0.5,
                                  radius: 30.0,
                                  lineWidth: 4.0,
                                  animation: true,
                                  animateFromLastPercent: true,
                                  progressColor:
                                      FlutterFlowTheme.of(context).primary,
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).accent4,
                                  center: Text(
                                    FFLocalizations.of(context).getText(
                                      'kyj68a36' /* 50% */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).lineColor,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'h100szbv' /* Outstanding Balance */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'ge4uswip' /* NGN 0.00 */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmallFamily,
                                            fontSize: 24.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmallFamily),
                                          ),
                                    ),
                                  ].divide(SizedBox(height: 5.0)),
                                ),
                                CircularPercentIndicator(
                                  percent: 0.5,
                                  radius: 30.0,
                                  lineWidth: 4.0,
                                  animation: true,
                                  animateFromLastPercent: true,
                                  progressColor:
                                      FlutterFlowTheme.of(context).primary,
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).accent4,
                                  center: Text(
                                    FFLocalizations.of(context).getText(
                                      'r1oy2mhn' /* 50% */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 30.0)),
                    ),
                  ),
                  Container(
                    width: 700.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).lineColor,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Wrap(
                                        spacing: 20.0,
                                        runSpacing: 30.0,
                                        alignment: WrapAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.end,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            width: 350.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '0upa6ckf' /* All Bills Orders */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge,
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'zclgxesl' /* Below are some of the orders o... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ].divide(SizedBox(height: 10.0)),
                                            ),
                                          ),
                                          Container(
                                            width: 350.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .primaryButtonModel2,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    updateOnChange: true,
                                                    child: PrimaryButtonWidget(
                                                      buttonText: 'Pay Bills',
                                                      buttonTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .white,
                                                      buttonWidth: 120,
                                                      buttonHeight: 40,
                                                      disableStatusPara: false,
                                                      buttonAction: () async {
                                                        logFirebaseEvent(
                                                            'DASHBOARD_FOR_ADMIN_Container_7atarlia_C');
                                                        logFirebaseEvent(
                                                            'PrimaryButton_navigate_to');

                                                        context.pushNamed(
                                                            'ListOfServices');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .primaryButtonModel3,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: PrimaryButtonWidget(
                                                      buttonText: 'Fund Wallet',
                                                      buttonBgColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                      buttonTextColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      buttonWidth: 120,
                                                      buttonHeight: 40,
                                                      disableStatusPara: false,
                                                      buttonAction: () async {
                                                        logFirebaseEvent(
                                                            'DASHBOARD_FOR_ADMIN_Container_4dza67v0_C');
                                                        logFirebaseEvent(
                                                            'PrimaryButton_navigate_to');

                                                        context.pushNamed(
                                                            'FundWallet');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 20.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 200.0,
                                  decoration: BoxDecoration(),
                                  child: StreamBuilder<
                                      List<BillpaymentOrdersRecord>>(
                                    stream: queryBillpaymentOrdersRecord(
                                      queryBuilder: (billpaymentOrdersRecord) =>
                                          billpaymentOrdersRecord.orderBy(
                                              'created_at',
                                              descending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Container(
                                          width: double.infinity,
                                          child: ShimmerListOfTablesWidget(),
                                        );
                                      }
                                      List<BillpaymentOrdersRecord>
                                          dataTableBillpaymentOrdersRecordList =
                                          snapshot.data!;
                                      if (dataTableBillpaymentOrdersRecordList
                                          .isEmpty) {
                                        return EmptyTableWidget(
                                          titlePara:
                                              'You have not made any Bill Payment purchases yet.',
                                          descPara:
                                              'From your dashboard, you can easily renew or top up your Airtime or DStv subscription.',
                                          buttonTextPara: 'Pay your bill',
                                          buttonActionPara: () async {
                                            logFirebaseEvent(
                                                'DASHBOARD_FOR_ADMIN_DataTable_5rprxxc5_C');
                                            logFirebaseEvent(
                                                'DataTable_navigate_to');

                                            context.pushNamed('ListOfServices');
                                          },
                                        );
                                      }
                                      return DataTable2(
                                        columns: [
                                          DataColumn2(
                                            label: DefaultTextStyle.merge(
                                              softWrap: true,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                    desktop: false,
                                                  ))
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'jv4b3ix6' /* Transactions */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                    ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                    tablet: false,
                                                    tabletLandscape: false,
                                                  ))
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'y5b5jxqf' /* Customer */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            fixedWidth: 200.0,
                                          ),
                                          DataColumn2(
                                            label: DefaultTextStyle.merge(
                                              softWrap: true,
                                              child: Visibility(
                                                visible: responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                ),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '4pi4zeci' /* Date */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataColumn2(
                                            label: DefaultTextStyle.merge(
                                              softWrap: true,
                                              child: Visibility(
                                                visible: responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    't7fe7737' /* Type */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataColumn2(
                                            label: DefaultTextStyle.merge(
                                              softWrap: true,
                                              child: Visibility(
                                                visible: responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                15.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'nmg2x81x' /* Amount */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            fixedWidth: 150.0,
                                          ),
                                        ],
                                        rows:
                                            dataTableBillpaymentOrdersRecordList
                                                .mapIndexed((dataTableIndex,
                                                        dataTableBillpaymentOrdersRecord) =>
                                                    [
                                                      InkWell(
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
                                                              'DASHBOARD_FOR_ADMIN_Row_gz9ny6y9_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Row_bottom_sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .overlay,
                                                            useSafeArea: true,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                  child:
                                                                      Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    TransactionDetailsWidget(
                                                                  orderRef:
                                                                      dataTableBillpaymentOrdersRecord
                                                                          .reference,
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              PhotoGridWithDetailsWidget(
                                                                key: Key(
                                                                    'Keyd8y_${dataTableIndex}_of_${dataTableBillpaymentOrdersRecordList.length}'),
                                                                photoPathPara:
                                                                    () {
                                                                  if (dataTableBillpaymentOrdersRecord
                                                                          .serviceProvider ==
                                                                      'MTN') {
                                                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/teckaa-pay-ipwh25/assets/kpaacv63wjsj/MTN.png';
                                                                  } else if (dataTableBillpaymentOrdersRecord
                                                                          .serviceProvider ==
                                                                      'GLO') {
                                                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/teckaa-pay-ipwh25/assets/xiaqz6ktiarh/Glo.png';
                                                                  } else if (dataTableBillpaymentOrdersRecord
                                                                          .serviceProvider ==
                                                                      'AIRTEL') {
                                                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/teckaa-pay-ipwh25/assets/b0eesltb52ke/Airtel.png';
                                                                  } else if (dataTableBillpaymentOrdersRecord
                                                                          .serviceProvider ==
                                                                      '9MOBILE') {
                                                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/teckaa-pay-ipwh25/assets/6vtebqnw87iy/9Mobile.png';
                                                                  } else {
                                                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/teams/n5jWRKlFxMgHc4jw6Dg6/assets/hhxzu1paz4vu/Teckaa_beta_black_white_favicon.png';
                                                                  }
                                                                }(),
                                                                titlePara:
                                                                    dataTableBillpaymentOrdersRecord
                                                                        .serviceProvider,
                                                                descPara: dataTableBillpaymentOrdersRecord
                                                                    .customerNumber
                                                                    .toString(),
                                                                widthPara: 35,
                                                                heightPara: 35,
                                                                titleSizePara:
                                                                    14,
                                                                descSizePara:
                                                                    13,
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      Visibility(
                                                        visible:
                                                            responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                dateTimeFormat(
                                                                  'yMMMd',
                                                                  dataTableBillpaymentOrdersRecord
                                                                      .createdAt!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Visibility(
                                                        visible:
                                                            responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                        ),
                                                        child: Text(
                                                          dataTableBillpaymentOrdersRecord
                                                              .serviceType,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall,
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                '${dataTableBillpaymentOrdersRecord.currency} ${formatNumber(
                                                                  dataTableBillpaymentOrdersRecord
                                                                      .amount,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .periodDecimal,
                                                                )}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                              if (responsiveVisibility(
                                                                context:
                                                                    context,
                                                                phone: false,
                                                                tablet: false,
                                                                tabletLandscape:
                                                                    false,
                                                              ))
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'DASHBOARD_FOR_ADMIN_Icon_gaxjoc5n_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Icon_bottom_sheet');
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      barrierColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .overlay,
                                                                      useSafeArea:
                                                                          true,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                            child:
                                                                                Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              TransactionDetailsWidget(
                                                                            orderRef:
                                                                                dataTableBillpaymentOrdersRecord.reference,
                                                                          ),
                                                                        ));
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                                  child: Icon(
                                                                    FFIcons
                                                                        .karrowRight3,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ))
                                                            Text(
                                                              dateTimeFormat(
                                                                'yMMMd',
                                                                dataTableBillpaymentOrdersRecord
                                                                    .createdAt!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                        ],
                                                      ),
                                                    ]
                                                        .map((c) => DataCell(c))
                                                        .toList())
                                                .map((e) => DataRow(cells: e))
                                                .toList(),
                                        headingRowColor:
                                            MaterialStateProperty.all(
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        headingRowHeight: 56.0,
                                        dataRowColor: MaterialStateProperty.all(
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        dataRowHeight: 56.0,
                                        border: TableBorder(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        dividerThickness: 1.0,
                                        showBottomBorder: false,
                                        minWidth: 49.0,
                                      );
                                    },
                                  ),
                                ),
                              ].divide(SizedBox(height: 30.0)),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).lineColor,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<BillpaymentOrdersRecord>>(
                                stream: queryBillpaymentOrdersRecord(),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: LinearProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    );
                                  }
                                  List<BillpaymentOrdersRecord>
                                      chartBillpaymentOrdersRecordList =
                                      snapshot.data!;
                                  return Container(
                                    width: 370.0,
                                    height: 230.0,
                                    child: FlutterFlowPieChart(
                                      data: FFPieChartData(
                                        values: chartBillpaymentOrdersRecordList
                                            .map((d) => d.country)
                                            .toList(),
                                        colors: chartPieChartColorsList,
                                        radius: [100.0],
                                      ),
                                      donutHoleRadius: 0.0,
                                      donutHoleColor: Colors.transparent,
                                      sectionLabelType:
                                          PieChartSectionLabelType.percent,
                                      sectionLabelStyle: FlutterFlowTheme.of(
                                              context)
                                          .headlineSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmallFamily),
                                          ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(height: 20.0)),
                    ),
                  ),
                ],
              ),
            ].divide(SizedBox(height: 25.0)),
          ),
        ),
      ),
    );
  }
}
