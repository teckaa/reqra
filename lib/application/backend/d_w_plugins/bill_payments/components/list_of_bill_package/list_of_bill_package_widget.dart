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
import 'list_of_bill_package_model.dart';
export 'list_of_bill_package_model.dart';

class ListOfBillPackageWidget extends StatefulWidget {
  const ListOfBillPackageWidget({
    Key? key,
    this.billTypePara,
    this.billerCodePara,
    this.billImagePathPara,
  }) : super(key: key);

  final String? billTypePara;
  final String? billerCodePara;
  final String? billImagePathPara;

  @override
  _ListOfBillPackageWidgetState createState() =>
      _ListOfBillPackageWidgetState();
}

class _ListOfBillPackageWidgetState extends State<ListOfBillPackageWidget> {
  late ListOfBillPackageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfBillPackageModel());

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
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
        child: Container(
          width: 400.0,
          height: 360.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 40.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 2.0),
                spreadRadius: 1.0,
              )
            ],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: FutureBuilder<ApiCallResponse>(
                    future: _model.billservices(
                      requestFn: () => FluttewaveApiGroup.listOfBillsCall.call(
                        type: widget.billTypePara,
                        billerCode: widget.billerCodePara,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return ShimmerListOfListsWidget();
                      }
                      final listViewListOfBillsResponse = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final services = getJsonField(
                            listViewListOfBillsResponse.jsonBody,
                            r'''$.data''',
                          ).toList();
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: services.length,
                            separatorBuilder: (_, __) => SizedBox(height: 10.0),
                            itemBuilder: (context, servicesIndex) {
                              final servicesItem = services[servicesIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'LIST_OF_BILL_PACKAGE_Row_wa0m8mpp_ON_TAP');
                                  logFirebaseEvent('Row_bottom_sheet');
                                  Navigator.pop(context, servicesItem);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: PhotoGridWidget(
                                        key: Key(
                                            'Keyvjx_${servicesIndex}_of_${services.length}'),
                                        photoWidth: 35,
                                        photoHeight: 35,
                                        photoPath:
                                            'https://dummyimage.com/150X150&text=1',
                                        photoName: 'B',
                                        bgColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        functions
                                            .allLetterUpperCase(getJsonField(
                                          servicesItem,
                                          r'''$.name''',
                                        ).toString()),
                                        'Package',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
