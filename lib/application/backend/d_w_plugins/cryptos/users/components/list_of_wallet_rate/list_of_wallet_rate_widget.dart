import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/shimmers/shimmer_list_of_tables/shimmer_list_of_tables_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_of_wallet_rate_model.dart';
export 'list_of_wallet_rate_model.dart';

class ListOfWalletRateWidget extends StatefulWidget {
  const ListOfWalletRateWidget({
    Key? key,
    this.walletCode,
    this.walletRate,
  }) : super(key: key);

  final String? walletCode;
  final double? walletRate;

  @override
  _ListOfWalletRateWidgetState createState() => _ListOfWalletRateWidgetState();
}

class _ListOfWalletRateWidgetState extends State<ListOfWalletRateWidget>
    with TickerProviderStateMixin {
  late ListOfWalletRateModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 120.ms,
          begin: Offset(0.0, 45.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfWalletRateModel());

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
      child: Container(
        width: 400.0,
        height: 360.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              color: FlutterFlowTheme.of(context).accent3,
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.searchTextFieldModel,
                      updateCallback: () => setState(() {}),
                      child: SearchTextFieldWidget(
                        actionPara: () async {},
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<List<CryptoWalletsRecord>>(
                        stream: queryCryptoWalletsRecord(
                          queryBuilder: (cryptoWalletsRecord) =>
                              cryptoWalletsRecord
                                  .where(
                                    'wallet_name',
                                    isEqualTo: _model
                                                .searchTextFieldModel
                                                .searchTextFieldController
                                                .text !=
                                            ''
                                        ? _model.searchTextFieldModel
                                            .searchTextFieldController.text
                                        : null,
                                  )
                                  .orderBy('created_at', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return ShimmerListOfTablesWidget(
                              itemsNo: 3,
                            );
                          }
                          List<CryptoWalletsRecord>
                              listViewCryptoWalletsRecordList = snapshot.data!;
                          return ListView.separated(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            scrollDirection: Axis.vertical,
                            itemCount: listViewCryptoWalletsRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 15.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewCryptoWalletsRecord =
                                  listViewCryptoWalletsRecordList[
                                      listViewIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'LIST_OF_WALLET_RATE_Container_g16fm0k4_O');
                                  logFirebaseEvent(
                                      'PhotoGridWithDetails_bottom_sheet');
                                  Navigator.pop(
                                      context, listViewCryptoWalletsRecord);
                                },
                                child: PhotoGridWithDetailsWidget(
                                  key: Key(
                                      'Keyg16_${listViewIndex}_of_${listViewCryptoWalletsRecordList.length}'),
                                  photoPathPara: valueOrDefault<String>(
                                    'https://cdn.jsdelivr.net/gh/vadimmalykhin/binance-icons/crypto/${functions.allLetterLowerCase(listViewCryptoWalletsRecord.walletCode)}.svg',
                                    'https://cdn.jsdelivr.net/gh/vadimmalykhin/binance-icons/crypto/btc.svg',
                                  ),
                                  titlePara: functions.allLetterUpperCase(
                                      listViewCryptoWalletsRecord.walletCode),
                                  descPara:
                                      listViewCryptoWalletsRecord.walletName,
                                  widthPara: 30,
                                  heightPara: 30,
                                  titleSizePara: 13,
                                  descSizePara: 11,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ),
            ),
          ],
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
