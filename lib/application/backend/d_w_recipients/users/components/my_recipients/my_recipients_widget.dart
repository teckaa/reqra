import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_list_of_lists/shimmer_list_of_lists_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'my_recipients_model.dart';
export 'my_recipients_model.dart';

class MyRecipientsWidget extends StatefulWidget {
  const MyRecipientsWidget({
    Key? key,
    String? titleName,
    this.typeName,
  })  : this.titleName = titleName ?? '',
        super(key: key);

  final String titleName;
  final String? typeName;

  @override
  _MyRecipientsWidgetState createState() => _MyRecipientsWidgetState();
}

class _MyRecipientsWidgetState extends State<MyRecipientsWidget> {
  late MyRecipientsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyRecipientsModel());

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
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).lineColor,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            wrapWithModel(
              model: _model.modalHeaderModel,
              updateCallback: () => setState(() {}),
              updateOnChange: true,
              child: ModalHeaderWidget(
                headerTitlePara: 'My ${widget.typeName} Recipient',
                headerActionPara: () async {
                  logFirebaseEvent('MY_RECIPIENTS_Container_pa94p2d4_CALLBAC');
                  logFirebaseEvent('ModalHeader_bottom_sheet');
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.searchTextFieldSearchModel,
                    updateCallback: () => setState(() {}),
                    child: SearchTextFieldWidget(
                      hintPara: 'Search...',
                      borderColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      readOnlyStatusPara: false,
                      actionPara: () async {},
                    ),
                  ),
                  Container(
                    height: 200.0,
                    child: PagedListView<DocumentSnapshot<Object?>?,
                        DwRecipientsRecord>.separated(
                      pagingController: _model.setListViewController(
                        DwRecipientsRecord.collection
                            .where(
                              'user_ref',
                              isEqualTo: currentUserReference,
                            )
                            .where(
                              'type',
                              isEqualTo: widget.typeName,
                            )
                            .orderBy('created_at', descending: true),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shrinkWrap: true,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (_, __) => SizedBox(height: 15.0),
                      builderDelegate:
                          PagedChildBuilderDelegate<DwRecipientsRecord>(
                        // Customize what your widget looks like when it's loading the first page.
                        firstPageProgressIndicatorBuilder: (_) =>
                            ShimmerListOfListsWidget(),
                        // Customize what your widget looks like when it's loading another page.
                        newPageProgressIndicatorBuilder: (_) =>
                            ShimmerListOfListsWidget(),

                        itemBuilder: (context, _, listViewIndex) {
                          final listViewDwRecipientsRecord = _model
                              .listViewPagingController!
                              .itemList![listViewIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'MY_RECIPIENTS_Column_69xm653b_ON_TAP');
                              logFirebaseEvent('Column_bottom_sheet');
                              Navigator.pop(
                                  context, listViewDwRecipientsRecord);
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    listViewDwRecipientsRecord.accountName,
                                    'Name',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    listViewDwRecipientsRecord.accountNumber,
                                    'Phone number',
                                  ),
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                              ].divide(SizedBox(height: 3.0)),
                            ),
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
      ),
    );
  }
}
