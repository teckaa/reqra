import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/shimmers/shimmer_list_of_tables/shimmer_list_of_tables_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_of_coins_from_api_model.dart';
export 'list_of_coins_from_api_model.dart';

class ListOfCoinsFromApiWidget extends StatefulWidget {
  const ListOfCoinsFromApiWidget({Key? key}) : super(key: key);

  @override
  _ListOfCoinsFromApiWidgetState createState() =>
      _ListOfCoinsFromApiWidgetState();
}

class _ListOfCoinsFromApiWidgetState extends State<ListOfCoinsFromApiWidget> {
  late ListOfCoinsFromApiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfCoinsFromApiModel());

    _model.textFieldSearchController ??= TextEditingController();
    _model.textFieldSearchFocusNode ??= FocusNode();

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
      width: 400.0,
      height: 270.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).lineColor,
          width: 1.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: 200.0,
                                child: TextFormField(
                                  controller: _model.textFieldSearchController,
                                  focusNode: _model.textFieldSearchFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textFieldSearchController',
                                    Duration(milliseconds: 0),
                                    () => setState(() {}),
                                  ),
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '2u6ti79y' /* Search */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily),
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 17.0, 0.0, 0.0),
                                    prefixIcon: Icon(
                                      FFIcons.ksearchStatus1,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  validator: _model
                                      .textFieldSearchControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 15.0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: AllCryptoApiCall.call(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return ShimmerListOfTablesWidget(
                            itemsNo: 3,
                          );
                        }
                        final listViewAllCryptoApiResponse = snapshot.data!;
                        return Builder(
                          builder: (context) {
                            final itemForAllCrypto = getJsonField(
                              listViewAllCryptoApiResponse.jsonBody,
                              r'''$.crypto''',
                            ).toList();
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: itemForAllCrypto.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 15.0),
                              itemBuilder: (context, itemForAllCryptoIndex) {
                                final itemForAllCryptoItem =
                                    itemForAllCrypto[itemForAllCryptoIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'LIST_OF_COINS_FROM_API_Container_5bx3yar');
                                    logFirebaseEvent(
                                        'PhotoGridWithDetails_dismiss_dialog');
                                    Navigator.pop(
                                        context, itemForAllCryptoItem);
                                  },
                                  child: PhotoGridWithDetailsWidget(
                                    key: Key(
                                        'Key5bx_${itemForAllCryptoIndex}_of_${itemForAllCrypto.length}'),
                                    photoPathPara: valueOrDefault<String>(
                                      'https://cdn.jsdelivr.net/gh/vadimmalykhin/binance-icons/crypto/${functions.allLetterLowerCase(getJsonField(
                                        itemForAllCryptoItem,
                                        r'''$.symbol''',
                                      ).toString())}.svg',
                                      'https://cdn.jsdelivr.net/gh/vadimmalykhin/binance-icons/crypto/btc.svg',
                                    ),
                                    titlePara: getJsonField(
                                      itemForAllCryptoItem,
                                      r'''$.name''',
                                    ).toString(),
                                    descPara: functions
                                        .allLetterUpperCase(getJsonField(
                                      itemForAllCryptoItem,
                                      r'''$.symbol''',
                                    ).toString()),
                                    widthPara: 30,
                                    heightPara: 30,
                                    titleSizePara: 13,
                                    descSizePara: 11,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
