import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/icons/copy_icon/copy_icon_widget.dart';
import '/application/components/shimmers/shimmer_list_of_tables/shimmer_list_of_tables_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_of_crypto_order_comp_model.dart';
export 'list_of_crypto_order_comp_model.dart';

class ListOfCryptoOrderCompWidget extends StatefulWidget {
  const ListOfCryptoOrderCompWidget({
    Key? key,
    this.orderStatus,
    this.orderType,
    this.orderTender,
    this.orderReceived,
    this.orderReference,
    this.orderCurrency,
  }) : super(key: key);

  final String? orderStatus;
  final String? orderType;
  final String? orderTender;
  final String? orderReceived;
  final String? orderReference;
  final String? orderCurrency;

  @override
  _ListOfCryptoOrderCompWidgetState createState() =>
      _ListOfCryptoOrderCompWidgetState();
}

class _ListOfCryptoOrderCompWidgetState
    extends State<ListOfCryptoOrderCompWidget> {
  late ListOfCryptoOrderCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfCryptoOrderCompModel());

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

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: StreamBuilder<List<CryptoOrdersRecord>>(
              stream: queryCryptoOrdersRecord(
                queryBuilder: (cryptoOrdersRecord) => cryptoOrdersRecord
                    .where(
                      'user_ref',
                      isEqualTo: currentUserReference,
                    )
                    .orderBy('created_at', descending: true),
                limit: 10,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Container(
                    width: double.infinity,
                    child: ShimmerListOfTablesWidget(),
                  );
                }
                List<CryptoOrdersRecord> dataTableCryptoOrdersRecordList =
                    snapshot.data!;
                if (dataTableCryptoOrdersRecordList.isEmpty) {
                  return Container(
                    width: double.infinity,
                    child: EmptyTableWidget(
                      buttonActionPara: () async {},
                    ),
                  );
                }
                return Container(
                  width: double.infinity,
                  child: DataTable2(
                    columns: [
                      DataColumn2(
                        label: DefaultTextStyle.merge(
                          softWrap: true,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'g2k4eu00' /* Date */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineSmallFamily),
                                ),
                          ),
                        ),
                        fixedWidth: 200.0,
                      ),
                      DataColumn2(
                        label: DefaultTextStyle.merge(
                          softWrap: true,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'qq01s266' /* Type */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineSmallFamily),
                                ),
                          ),
                        ),
                      ),
                      DataColumn2(
                        label: DefaultTextStyle.merge(
                          softWrap: true,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '41slxolw' /* Tendered */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineSmallFamily),
                                ),
                          ),
                        ),
                      ),
                      DataColumn2(
                        label: DefaultTextStyle.merge(
                          softWrap: true,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ci0hmlj4' /* Received */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineSmallFamily),
                                ),
                          ),
                        ),
                      ),
                      DataColumn2(
                        label: DefaultTextStyle.merge(
                          softWrap: true,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'mqws5yks' /* Reference */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineSmallFamily),
                                ),
                          ),
                        ),
                      ),
                      DataColumn2(
                        label: DefaultTextStyle.merge(
                          softWrap: true,
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'pskmvtjf' /* Status */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineSmallFamily),
                                ),
                          ),
                        ),
                        fixedWidth: 150.0,
                      ),
                    ],
                    rows: dataTableCryptoOrdersRecordList
                        .mapIndexed((dataTableIndex,
                                dataTableCryptoOrdersRecord) =>
                            [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'You sell: ${'${formatNumber(
                                            dataTableCryptoOrdersRecord.tender,
                                            formatType: FormatType.decimal,
                                            decimalType: DecimalType.automatic,
                                          )}${dataTableCryptoOrdersRecord.exchangeCurrency}'}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                fontSize: 12.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                        ),
                                        Text(
                                          'You received: ${'${formatNumber(
                                            dataTableCryptoOrdersRecord
                                                .received,
                                            formatType: FormatType.decimal,
                                            decimalType: DecimalType.automatic,
                                          )}${dataTableCryptoOrdersRecord.exchangeCurrency}'}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                fontSize: 12.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                  Text(
                                    '${dateTimeFormat(
                                      'yMMMd',
                                      dataTableCryptoOrdersRecord.createdAt,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )},${dateTimeFormat(
                                      'jm',
                                      dataTableCryptoOrdersRecord.createdAt,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 13.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ],
                              ),
                              Text(
                                '${dataTableCryptoOrdersRecord.orderType}/${dataTableCryptoOrdersRecord.orderWalletName}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 13.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              Text(
                                '\$${formatNumber(
                                  dataTableCryptoOrdersRecord.tender,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.periodDecimal,
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 13.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              Text(
                                '\$${formatNumber(
                                  dataTableCryptoOrdersRecord.received,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 13.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          dataTableCryptoOrdersRecord
                                              .reference.id,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 13.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'LIST_OF_CRYPTO_ORDER_Container_01ihkm8y_');
                                      logFirebaseEvent('CopyIcon_action_block');
                                      await action_blocks.copiedAction(
                                        context,
                                        message: dataTableCryptoOrdersRecord
                                            .reference.id,
                                      );
                                    },
                                    child: CopyIconWidget(
                                      key: Key(
                                          'Key01i_${dataTableIndex}_of_${dataTableCryptoOrdersRecordList.length}'),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    desktop: false,
                                  ))
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            'Type: ${'${dataTableCryptoOrdersRecord.orderType}/${dataTableCryptoOrdersRecord.orderWalletName}'}',
                                            'Type: Sell/Buy',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                fontSize: 12.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                        ),
                                        Text(
                                          'Rate: ${'${dataTableCryptoOrdersRecord.exchangeCurrency} ${dataTableCryptoOrdersRecord.tender.toString()}'}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                fontSize: 12.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                        ),
                                      ],
                                    ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 80.0,
                                        decoration: BoxDecoration(
                                          color: () {
                                            if (dataTableCryptoOrdersRecord
                                                    .orderStatus ==
                                                'Pending') {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .lineColor;
                                            } else if (dataTableCryptoOrdersRecord
                                                    .orderStatus ==
                                                'Processing') {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .tertiary;
                                            } else if (dataTableCryptoOrdersRecord
                                                    .orderStatus ==
                                                'Completed') {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondary;
                                            } else if (dataTableCryptoOrdersRecord
                                                    .orderStatus ==
                                                'Rejected') {
                                              return Color(0xFFDF3F3F);
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .lineColor;
                                            }
                                          }(),
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 5.0, 5.0, 5.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              () {
                                                if (dataTableCryptoOrdersRecord
                                                        .orderStatus ==
                                                    'Pending') {
                                                  return 'Pending';
                                                } else if (dataTableCryptoOrdersRecord
                                                        .orderStatus ==
                                                    'Processing') {
                                                  return 'Processing';
                                                } else if (dataTableCryptoOrdersRecord
                                                        .orderStatus ==
                                                    'Completed') {
                                                  return 'Completed';
                                                } else if (dataTableCryptoOrdersRecord
                                                        .orderStatus ==
                                                    'Rejected') {
                                                  return 'Rejected';
                                                } else {
                                                  return 'Pending';
                                                }
                                              }(),
                                              'Pending',
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 11.0,
                                                  fontWeight: FontWeight.w300,
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
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'LIST_OF_CRYPTO_ORDER_Icon_mikf8c5v_ON_TA');
                                          logFirebaseEvent('Icon_navigate_to');

                                          context.pushNamed(
                                            'ReadOrder',
                                            queryParameters: {
                                              'orderRef': serializeParam(
                                                dataTableCryptoOrdersRecord
                                                    .reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Icon(
                                          FFIcons.karrowRight3,
                                          color: Colors.black,
                                          size: 16.0,
                                        ),
                                      ),
                                    ],
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
