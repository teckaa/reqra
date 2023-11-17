import '/application/backend/d_w_posts/categories/create_category/create_category_widget.dart';
import '/application/backend/d_w_posts/categories/update_category/update_category_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/modals/modal_header/modal_header_widget.dart';
import '/application/components/shimmers/shimmer_list_of_lists/shimmer_list_of_lists_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'list_of_categories_model.dart';
export 'list_of_categories_model.dart';

class ListOfCategoriesWidget extends StatefulWidget {
  const ListOfCategoriesWidget({Key? key}) : super(key: key);

  @override
  _ListOfCategoriesWidgetState createState() => _ListOfCategoriesWidgetState();
}

class _ListOfCategoriesWidgetState extends State<ListOfCategoriesWidget>
    with TickerProviderStateMixin {
  late ListOfCategoriesModel _model;

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
    _model = createModel(context, () => ListOfCategoriesModel());

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
        width: 370.0,
        height: 430.0,
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.modalHeaderModel,
              updateCallback: () => setState(() {}),
              child: ModalHeaderWidget(
                headerTitlePara: 'Categories',
                headerTitleTextColorPara:
                    FlutterFlowTheme.of(context).primaryText,
                headerActionPara: () async {
                  logFirebaseEvent('LIST_OF_CATEGORIES_Container_e9c2mwy4_CA');
                  logFirebaseEvent('ModalHeader_bottom_sheet');
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100.0,
                            decoration: BoxDecoration(),
                            child: wrapWithModel(
                              model: _model.searchTextFieldModel,
                              updateCallback: () => setState(() {}),
                              child: SearchTextFieldWidget(
                                actionPara: () async {},
                              ),
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.primaryButtonModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: PrimaryButtonWidget(
                            buttonText: 'Add new',
                            disableStatusPara: false,
                            buttonAction: () async {
                              logFirebaseEvent(
                                  'LIST_OF_CATEGORIES_Container_pqn0fdb0_CA');
                              logFirebaseEvent('PrimaryButton_bottom_sheet');
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
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: CreateCategoryWidget(),
                                  ));
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                    Expanded(
                      child: StreamBuilder<List<DwPostsCategoriesRecord>>(
                        stream: queryDwPostsCategoriesRecord(
                          queryBuilder: (dwPostsCategoriesRecord) =>
                              dwPostsCategoriesRecord.orderBy('created_at',
                                  descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return ShimmerListOfListsWidget();
                          }
                          List<DwPostsCategoriesRecord>
                              dataTableDwPostsCategoriesRecordList =
                              snapshot.data!;
                          if (dataTableDwPostsCategoriesRecordList.isEmpty) {
                            return EmptyTableWidget(
                              titlePara: 'No Categories yet',
                              descPara: 'Starting creating category.',
                              buttonTextPara: 'Add new',
                              buttonActionPara: () async {
                                logFirebaseEvent(
                                    'LIST_OF_CATEGORIES_DataTable_csm6vhs5_CA');
                                logFirebaseEvent('DataTable_bottom_sheet');
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
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: CreateCategoryWidget(),
                                    ));
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            );
                          }
                          return DataTable2(
                            columns: [
                              DataColumn2(
                                label: DefaultTextStyle.merge(
                                  softWrap: true,
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'yylfxlvf' /* Categories Name */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily),
                                        ),
                                  ),
                                ),
                              ),
                              DataColumn2(
                                label: DefaultTextStyle.merge(
                                  softWrap: true,
                                  child: Align(
                                    alignment: AlignmentDirectional(1.00, 0.00),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'vcxj6pzo' /* Action */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmallFamily,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmallFamily),
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            rows: dataTableDwPostsCategoriesRecordList
                                .mapIndexed((dataTableIndex,
                                        dataTableDwPostsCategoriesRecord) =>
                                    [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            dataTableDwPostsCategoriesRecord
                                                .catName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                          Text(
                                            dataTableDwPostsCategoriesRecord
                                                .catSlug,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  fontSize: 11.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'LIST_OF_CATEGORIES_Text_3fkf3kg3_ON_TAP');
                                              logFirebaseEvent(
                                                  'Text_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                barrierColor:
                                                    FlutterFlowTheme.of(context)
                                                        .overlay,
                                                enableDrag: false,
                                                useSafeArea: true,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                      child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: UpdateCategoryWidget(
                                                      recordRef:
                                                          dataTableDwPostsCategoriesRecord
                                                              .reference,
                                                    ),
                                                  ));
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '0um5snba' /* Read */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 11.0,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LIST_OF_CATEGORIES_Text_pzfvmr6d_ON_TAP');
                                                logFirebaseEvent(
                                                    'Text_alert_dialog');
                                                await showAlignedDialog(
                                                  context: context,
                                                  isGlobal: true,
                                                  avoidOverflow: false,
                                                  targetAnchor:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  followerAnchor:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  builder: (dialogContext) {
                                                    return Material(
                                                      color: Colors.transparent,
                                                      child: WebViewAware(
                                                          child:
                                                              ModalConfirmWidget(
                                                        modalTitle:
                                                            'Delete record',
                                                        modalDesc:
                                                            'Are you sure you want to delete this record?',
                                                        modalAction: () async {
                                                          logFirebaseEvent(
                                                              '_backend_call');
                                                          await dataTableDwPostsCategoriesRecord
                                                              .reference
                                                              .delete();
                                                          logFirebaseEvent(
                                                              '_close_dialog,_drawer,_etc');
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      )),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              },
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'wl52y44f' /* Delete */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 11.0,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 15.0)),
                                      ),
                                    ].map((c) => DataCell(c)).toList())
                                .map((e) => DataRow(cells: e))
                                .toList(),
                            headingRowColor: MaterialStateProperty.all(
                              Color(0x00000000),
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
                            showBottomBorder: true,
                            minWidth: 49.0,
                          );
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              ),
            ),
          ],
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
