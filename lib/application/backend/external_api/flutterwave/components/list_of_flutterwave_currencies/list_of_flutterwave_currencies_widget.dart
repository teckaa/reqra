import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/shimmers/shimmer_list_of_lists/shimmer_list_of_lists_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'list_of_flutterwave_currencies_model.dart';
export 'list_of_flutterwave_currencies_model.dart';

class ListOfFlutterwaveCurrenciesWidget extends StatefulWidget {
  const ListOfFlutterwaveCurrenciesWidget({Key? key}) : super(key: key);

  @override
  _ListOfFlutterwaveCurrenciesWidgetState createState() =>
      _ListOfFlutterwaveCurrenciesWidgetState();
}

class _ListOfFlutterwaveCurrenciesWidgetState
    extends State<ListOfFlutterwaveCurrenciesWidget> {
  late ListOfFlutterwaveCurrenciesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfFlutterwaveCurrenciesModel());

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

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
        child: Container(
          width: 400.0,
          height: 400.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 2.0,
                color: Color(0x51F1F4F8),
                offset: Offset(0.0, 2.0),
              )
            ],
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).lineColor,
              width: 1.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'LIST_OF_FLUTTERWAVE_CURRENCIES_Container');
                    logFirebaseEvent('SearchTextField_simple_search');
                    safeSetState(() {
                      _model.simpleSearchResults = TextSearch(functions
                              .listOfCurrencies()!
                              .map(
                                  (str) => TextSearchItem.fromTerms(str, [str]))
                              .toList())
                          .search(_model.searchTextFieldModel
                              .searchTextFieldController.text)
                          .map((r) => r.object)
                          .toList();
                      ;
                    });
                  },
                  child: wrapWithModel(
                    model: _model.searchTextFieldModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: SearchTextFieldWidget(
                      hintPara: ' Search',
                      readOnlyStatusPara: false,
                      actionPara: () async {},
                    ),
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<List<BillpaymentSettingsRecord>>(
                  stream: queryBillpaymentSettingsRecord(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: ShimmerListOfListsWidget(),
                      );
                    }
                    List<BillpaymentSettingsRecord>
                        columnBillpaymentSettingsRecordList = snapshot.data!;
                    final columnBillpaymentSettingsRecord =
                        columnBillpaymentSettingsRecordList.isNotEmpty
                            ? columnBillpaymentSettingsRecordList.first
                            : null;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(FluttewaveApiGroup
                                            .fetchAllBalanceCall
                                            .call(
                                          apiKey:
                                              columnBillpaymentSettingsRecord
                                                  ?.pluginProviderApiKey,
                                        )))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 20.0),
                                    child: ShimmerListOfListsWidget(),
                                  );
                                }
                                final listViewFetchAllBalanceResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final listOfCurrencies = getJsonField(
                                      listViewFetchAllBalanceResponse.jsonBody,
                                      r'''$.data''',
                                    ).toList();
                                    return RefreshIndicator(
                                      onRefresh: () async {
                                        logFirebaseEvent(
                                            'LIST_OF_FLUTTERWAVE_CURRENCIES_ListView_');
                                        logFirebaseEvent(
                                            'ListView_refresh_database_request');
                                        setState(() =>
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                      },
                                      child: ListView.separated(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listOfCurrencies.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 5.0),
                                        itemBuilder:
                                            (context, listOfCurrenciesIndex) {
                                          final listOfCurrenciesItem =
                                              listOfCurrencies[
                                                  listOfCurrenciesIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'LIST_OF_FLUTTERWAVE_CURRENCIES_Container');
                                              logFirebaseEvent(
                                                  'Container_bottom_sheet');
                                              Navigator.pop(
                                                  context,
                                                  getJsonField(
                                                    listOfCurrenciesItem,
                                                    r'''$.currency''',
                                                  ).toString());
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 15.0, 15.0, 15.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        getJsonField(
                                                          listOfCurrenciesItem,
                                                          r'''$.currency''',
                                                        ).toString(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  letterSpacing:
                                                                      1.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
