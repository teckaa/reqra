import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/shimmers/shimmer_list_of_lists/shimmer_list_of_lists_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_of_banks_model.dart';
export 'list_of_banks_model.dart';

class ListOfBanksWidget extends StatefulWidget {
  const ListOfBanksWidget({Key? key}) : super(key: key);

  @override
  _ListOfBanksWidgetState createState() => _ListOfBanksWidgetState();
}

class _ListOfBanksWidgetState extends State<ListOfBanksWidget> {
  late ListOfBanksModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfBanksModel());

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
        height: () {
          if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
            return 700.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
            return 400.0;
          } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
            return 400.0;
          } else {
            return 400.0;
          }
        }(),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).lineColor,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              wrapWithModel(
                model: _model.searchTextFieldSearchModel,
                updateCallback: () => setState(() {}),
                child: SearchTextFieldWidget(
                  hintPara: 'Search...',
                  borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                  readOnlyStatusPara: false,
                  actionPara: () async {},
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 10.0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: FluttewaveApiGroup.listOfBankCall.call(
                      country: 'NG',
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return ShimmerListOfListsWidget();
                      }
                      final listViewListOfBankResponse = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final itemName = getJsonField(
                            listViewListOfBankResponse.jsonBody,
                            r'''$.data''',
                          ).toList();
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: itemName.length,
                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                            itemBuilder: (context, itemNameIndex) {
                              final itemNameItem = itemName[itemNameIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'LIST_OF_BANKS_COMP_Row_9mhbb2oz_ON_TAP');
                                  logFirebaseEvent('Row_bottom_sheet');
                                  Navigator.pop(context, itemNameItem);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: PhotoGridWidget(
                                        key: Key(
                                            'Key96m_${itemNameIndex}_of_${itemName.length}'),
                                        photoWidth: 35,
                                        photoHeight: 35,
                                        photoPath:
                                            'https://dummyimage.com/240x3:3/',
                                        photoName: 'B',
                                        bgColor: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        functions
                                            .firstLetterUpperCase(getJsonField(
                                          itemNameItem,
                                          r'''$.name''',
                                        ).toString()),
                                        'Bank name',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ].divide(SizedBox(width: 15.0)),
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
      ),
    );
  }
}
