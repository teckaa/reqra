import '/application/backend/d_w_plugins/bill_payments/components/transaction_details/transaction_details_widget.dart';
import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/shimmers/shimmer_list_of_tables/shimmer_list_of_tables_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'list_of_bill_order_comp_model.dart';
export 'list_of_bill_order_comp_model.dart';

class ListOfBillOrderCompWidget extends StatefulWidget {
  const ListOfBillOrderCompWidget({
    Key? key,
    this.userRefPara,
    this.serviceType,
    this.serviceProvider,
  }) : super(key: key);

  final DocumentReference? userRefPara;
  final String? serviceType;
  final String? serviceProvider;

  @override
  _ListOfBillOrderCompWidgetState createState() =>
      _ListOfBillOrderCompWidgetState();
}

class _ListOfBillOrderCompWidgetState extends State<ListOfBillOrderCompWidget> {
  late ListOfBillOrderCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfBillOrderCompModel());

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
      decoration: BoxDecoration(),
      child: StreamBuilder<List<BillpaymentOrdersRecord>>(
        stream: queryBillpaymentOrdersRecord(
          queryBuilder: (billpaymentOrdersRecord) => billpaymentOrdersRecord
              .where(
                'user_ref',
                isEqualTo: widget.userRefPara,
              )
              .where(
                'service_type',
                isEqualTo: widget.serviceType != '' ? widget.serviceType : null,
              )
              .orderBy('created_at', descending: true),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Container(
              width: double.infinity,
              child: ShimmerListOfTablesWidget(),
            );
          }
          List<BillpaymentOrdersRecord> dataTableBillpaymentOrdersRecordList =
              snapshot.data!;
          if (dataTableBillpaymentOrdersRecordList.isEmpty) {
            return EmptyTableWidget(
              titlePara: 'No bill payments made yet.',
              descPara:
                  'From your dashboard, you can effortlessly recharge your airtime or renew your DStv subscription.',
              buttonTextPara: 'Pay your Bill',
              buttonActionPara: () async {
                logFirebaseEvent('LIST_OF_BILL_ORDER_DataTable_ls9sp7sp_CA');
                logFirebaseEvent('DataTable_navigate_to');

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        Text(
                          FFLocalizations.of(context).getText(
                            'fc58xqjh' /* Transactions */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelSmallFamily,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
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
                          FFLocalizations.of(context).getText(
                            'ydddb5bk' /* Customer */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelSmallFamily,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
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
                      FFLocalizations.of(context).getText(
                        '3te6sigw' /* Reference */,
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelSmallFamily,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).labelSmallFamily),
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
                      FFLocalizations.of(context).getText(
                        '6lyanjtz' /* Date Purchased */,
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelSmallFamily,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).labelSmallFamily),
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
                    ),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'acmzqhy7' /* Type */,
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelSmallFamily,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).labelSmallFamily),
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
                      alignment: AlignmentDirectional(1.00, 0.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'lhstkqrp' /* Amount */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelSmallFamily,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
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
            rows: dataTableBillpaymentOrdersRecordList
                .mapIndexed((dataTableIndex,
                        dataTableBillpaymentOrdersRecord) =>
                    [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'LIST_OF_BILL_ORDER_Row_f3qc8p7g_ON_TAP');
                          logFirebaseEvent('Row_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: FlutterFlowTheme.of(context).overlay,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                  child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: TransactionDetailsWidget(
                                  orderRef: dataTableBillpaymentOrdersRecord
                                      .reference,
                                ),
                              ));
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PhotoGridWithDetailsWidget(
                                key: Key(
                                    'Keymi3_${dataTableIndex}_of_${dataTableBillpaymentOrdersRecordList.length}'),
                                photoPathPara: () {
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
                                titlePara: dataTableBillpaymentOrdersRecord
                                    .serviceProvider,
                                descPara: dataTableBillpaymentOrdersRecord
                                    .customerNumber
                                    .toString(),
                                widthPara: 35,
                                heightPara: 35,
                                titleSizePara: 14,
                                descSizePara: 13,
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                dataTableBillpaymentOrdersRecord.reference.id,
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                        ),
                        child: Text(
                          dateTimeFormat(
                            'yMMMd',
                            dataTableBillpaymentOrdersRecord.createdAt!,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                      ),
                      Visibility(
                        visible: responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                        ),
                        child: Text(
                          dataTableBillpaymentOrdersRecord.serviceType,
                          style: FlutterFlowTheme.of(context).bodySmall,
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${dataTableBillpaymentOrdersRecord.currency} ${formatNumber(
                                  dataTableBillpaymentOrdersRecord.amount,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.periodDecimal,
                                )}',
                                style: FlutterFlowTheme.of(context).bodySmall,
                              ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                              ))
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'LIST_OF_BILL_ORDER_Icon_rwharzfz_ON_TAP');
                                    logFirebaseEvent('Icon_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor:
                                          FlutterFlowTheme.of(context).overlay,
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                            child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: TransactionDetailsWidget(
                                            orderRef:
                                                dataTableBillpaymentOrdersRecord
                                                    .reference,
                                          ),
                                        ));
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Icon(
                                    FFIcons.karrowRight3,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20.0,
                                  ),
                                ),
                            ],
                          ),
                          if (responsiveVisibility(
                            context: context,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Text(
                              dateTimeFormat(
                                'yMMMd',
                                dataTableBillpaymentOrdersRecord.createdAt!,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                        ],
                      ),
                    ].map((c) => DataCell(c)).toList())
                .map((e) => DataRow(cells: e))
                .toList(),
            headingRowColor: MaterialStateProperty.all(
              FlutterFlowTheme.of(context).secondaryBackground,
            ),
            headingRowHeight: 56.0,
            dataRowColor: MaterialStateProperty.all(
              FlutterFlowTheme.of(context).secondaryBackground,
            ),
            dataRowHeight: 56.0,
            border: TableBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            dividerThickness: 1.0,
            showBottomBorder: false,
            minWidth: 49.0,
          );
        },
      ),
    );
  }
}
