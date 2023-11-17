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
import 'list_of_fundings_comp_model.dart';
export 'list_of_fundings_comp_model.dart';

class ListOfFundingsCompWidget extends StatefulWidget {
  const ListOfFundingsCompWidget({
    Key? key,
    this.email,
    this.userRef,
  }) : super(key: key);

  final String? email;
  final DocumentReference? userRef;

  @override
  _ListOfFundingsCompWidgetState createState() =>
      _ListOfFundingsCompWidgetState();
}

class _ListOfFundingsCompWidgetState extends State<ListOfFundingsCompWidget> {
  late ListOfFundingsCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfFundingsCompModel());

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: StreamBuilder<List<FundingsRecord>>(
            stream: queryFundingsRecord(
              queryBuilder: (fundingsRecord) => fundingsRecord
                  .where(
                    'user_ref',
                    isEqualTo: widget.userRef,
                  )
                  .orderBy('created_at', descending: true),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return ShimmerListOfTablesWidget();
              }
              List<FundingsRecord> dataTableFundingsRecordList = snapshot.data!;
              return DataTable2(
                columns: [
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'b2nc6q51' /* Amount */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .headlineSmallFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .headlineSmallFamily),
                            ),
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
                            't3ok5xtw' /* Merchants */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineSmallFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineSmallFamily),
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
                            '8zcy5k4k' /* Date */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineSmallFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineSmallFamily),
                              ),
                        ),
                      ),
                    ),
                  ),
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'd6ulc447' /* Status */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .headlineSmallFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .headlineSmallFamily),
                            ),
                      ),
                    ),
                    fixedWidth: 150.0,
                  ),
                ],
                rows: dataTableFundingsRecordList
                    .mapIndexed((dataTableIndex, dataTableFundingsRecord) => [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${dataTableFundingsRecord.currency} ${formatNumber(
                                  dataTableFundingsRecord.amount,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 12.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ],
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
                                    dataTableFundingsRecord.merchant,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
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
                              '${dateTimeFormat(
                                'yMMMd',
                                dataTableFundingsRecord.createdAt,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )},${dateTimeFormat(
                                'jms',
                                dataTableFundingsRecord.createdAt,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 80.0,
                                decoration: BoxDecoration(
                                  color: () {
                                    if (dataTableFundingsRecord.status ==
                                        'Pending') {
                                      return FlutterFlowTheme.of(context)
                                          .warningSoft;
                                    } else if (dataTableFundingsRecord.status ==
                                        'Reversed') {
                                      return FlutterFlowTheme.of(context)
                                          .tertiary;
                                    } else if (dataTableFundingsRecord.status ==
                                        'Completed') {
                                      return FlutterFlowTheme.of(context)
                                          .secondary;
                                    } else {
                                      return FlutterFlowTheme.of(context)
                                          .lineColor;
                                    }
                                  }(),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 5.0, 5.0, 5.0),
                                  child: Text(
                                    dataTableFundingsRecord.status,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w300,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ].map((c) => DataCell(c)).toList())
                    .map((e) => DataRow(cells: e))
                    .toList(),
                headingRowColor: MaterialStateProperty.all(
                  Color(0x00000000),
                ),
                headingRowHeight: 56.0,
                dataRowColor: MaterialStateProperty.all(
                  Color(0x00000000),
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
        ),
      ],
    );
  }
}
