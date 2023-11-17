import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_plugins/create_plugin/create_plugin_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/modals/modal_confirm_2/modal_confirm2_widget.dart';
import '/application/components/shimmers/shimmer_count/shimmer_count_widget.dart';
import '/application/components/shimmers/shimmer_list_of_lists/shimmer_list_of_lists_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'plugins_model.dart';
export 'plugins_model.dart';

class PluginsWidget extends StatefulWidget {
  const PluginsWidget({Key? key}) : super(key: key);

  @override
  _PluginsWidgetState createState() => _PluginsWidgetState();
}

class _PluginsWidgetState extends State<PluginsWidget> {
  late PluginsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PluginsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Plugins'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Title(
        title: 'Plugins',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 0.0,
                      borderWidth: 0.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.karrowLeft2,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent('PLUGINS_PAGE_arrowLeft2_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.safePop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'kynfmobu' /* Plugins */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    actions: [],
                    centerTitle: false,
                    elevation: 0.0,
                  )
                : null,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.dWSidebarModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: DWSidebarWidget(
                      selectedSidebarNav: 'Plugins',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              if ((valueOrDefault(
                                          currentUserDocument?.userRole, '') ==
                                      'Owner') ||
                                  (valueOrDefault(
                                          currentUserDocument?.userRole, '') ==
                                      'Admin')) {
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      wrapWithModel(
                                        model: _model.dWHeaderModel,
                                        updateCallback: () => setState(() {}),
                                        child: DWHeaderWidget(
                                          pageTitle: 'Plugins',
                                        ),
                                      ),
                                      Container(
                                        width: 500.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 15.0, 15.0, 15.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'xft6fp5m' /* Plugins / Apps */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: 300.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .searchTextFieldModel,
                                                          updateCallback: () =>
                                                              setState(() {}),
                                                          child:
                                                              SearchTextFieldWidget(
                                                            hintPara:
                                                                'Search by name',
                                                            readOnlyStatusPara:
                                                                false,
                                                            actionPara:
                                                                () async {},
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .primaryButtonModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          PrimaryButtonWidget(
                                                        buttonText: 'Add new',
                                                        disableStatusPara:
                                                            false,
                                                        buttonAction: () async {
                                                          logFirebaseEvent(
                                                              'PLUGINS_PAGE_Container_95eeo93t_CALLBACK');
                                                          logFirebaseEvent(
                                                              'PrimaryButton_bottom_sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            barrierColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .overlay,
                                                            useSafeArea: true,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      CreatePluginWidget(),
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                              FutureBuilder<int>(
                                                future:
                                                    queryDwPluginsRecordCount(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return ShimmerCountWidget();
                                                  }
                                                  int textCount =
                                                      snapshot.data!;
                                                  return Text(
                                                    '${textCount.toString()} Plugins',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  );
                                                },
                                              ),
                                              Builder(
                                                builder: (context) =>
                                                    PagedListView<
                                                        DocumentSnapshot<
                                                            Object?>?,
                                                        DwPluginsRecord>.separated(
                                                  pagingController: _model
                                                      .setListViewController(
                                                    DwPluginsRecord.collection
                                                        .where(
                                                          'plugin_name',
                                                          isEqualTo: _model
                                                                      .searchTextFieldModel
                                                                      .searchTextFieldController
                                                                      .text !=
                                                                  ''
                                                              ? _model
                                                                  .searchTextFieldModel
                                                                  .searchTextFieldController
                                                                  .text
                                                              : null,
                                                        )
                                                        .orderBy('created_at'),
                                                  ),
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  reverse: false,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 30.0),
                                                  builderDelegate:
                                                      PagedChildBuilderDelegate<
                                                          DwPluginsRecord>(
                                                    // Customize what your widget looks like when it's loading the first page.
                                                    firstPageProgressIndicatorBuilder:
                                                        (_) =>
                                                            ShimmerListOfListsWidget(),
                                                    // Customize what your widget looks like when it's loading another page.
                                                    newPageProgressIndicatorBuilder:
                                                        (_) =>
                                                            ShimmerListOfListsWidget(),
                                                    noItemsFoundIndicatorBuilder:
                                                        (_) => EmptyTableWidget(
                                                      titlePara:
                                                          'No Plugins yet',
                                                      descPara:
                                                          'The plugins are currently empty; to begin, click the button below. ',
                                                      buttonTextPara: 'Add New',
                                                      buttonActionPara:
                                                          () async {
                                                        logFirebaseEvent(
                                                            'PLUGINS_PAGE_ListView_l0b6j1ko_CALLBACK');
                                                        logFirebaseEvent(
                                                            'ListView_alert_dialog');
                                                        await showAlignedDialog(
                                                          barrierColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .overlay,
                                                          barrierDismissible:
                                                              false,
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
                                                          builder:
                                                              (dialogContext) {
                                                            return Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  WebViewAware(
                                                                      child:
                                                                          GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child:
                                                                    CreatePluginWidget(),
                                                              )),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                                    ),
                                                    itemBuilder: (context, _,
                                                        listViewIndex) {
                                                      final listViewDwPluginsRecord =
                                                          _model.listViewPagingController!
                                                                  .itemList![
                                                              listViewIndex];
                                                      return Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    listViewDwPluginsRecord
                                                                        .pluginName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    listViewDwPluginsRecord
                                                                        .pluginDesc,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall,
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        5.0)),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (listViewDwPluginsRecord
                                                                        .pluginStatus ==
                                                                    true)
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            PrimaryRoundedButtonWidget(
                                                                      key: Key(
                                                                          'Keyyqp_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                                                      buttonText:
                                                                          'Installed',
                                                                      buttonWidth:
                                                                          80,
                                                                      buttonHeight:
                                                                          35,
                                                                      disableStatusPara:
                                                                          false,
                                                                      buttonAction:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'PLUGINS_PAGE_Container_yqpkzx5x_CALLBACK');
                                                                        logFirebaseEvent(
                                                                            'PrimaryRoundedButton_alert_dialog');
                                                                        await showAlignedDialog(
                                                                          context:
                                                                              context,
                                                                          isGlobal:
                                                                              true,
                                                                          avoidOverflow:
                                                                              false,
                                                                          targetAnchor:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          followerAnchor:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Material(
                                                                              color: Colors.transparent,
                                                                              child: WebViewAware(
                                                                                  child: GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: ModalConfirm2Widget(
                                                                                  modalTitlePara: 'Uninstall ${listViewDwPluginsRecord.pluginName}',
                                                                                  modalDescPara: 'By deactivating ${listViewDwPluginsRecord.pluginName}, the menu and settings will be remove under the admin section.',
                                                                                  cancelBtnTextPara: 'No, Cancel',
                                                                                  confirmBtnTextPara: 'Yes, Uninstall',
                                                                                  confirmActionPara: () async {
                                                                                    logFirebaseEvent('_backend_call');

                                                                                    await listViewDwPluginsRecord.reference.update(createDwPluginsRecordData(
                                                                                      pluginStatus: false,
                                                                                    ));
                                                                                    logFirebaseEvent('_close_dialog,_drawer,_etc');
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                ),
                                                                              )),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                    ),
                                                                  ),
                                                                if (listViewDwPluginsRecord
                                                                        .pluginStatus ==
                                                                    false)
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            PrimaryRoundedButtonWidget(
                                                                      key: Key(
                                                                          'Key9ls_${listViewIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                                                                      buttonText:
                                                                          'Install',
                                                                      buttonBgColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .lineColor,
                                                                      buttonTextColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      buttonWidth:
                                                                          80,
                                                                      buttonHeight:
                                                                          35,
                                                                      disableStatusPara:
                                                                          false,
                                                                      buttonAction:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'PLUGINS_PAGE_Container_9lsdomq8_CALLBACK');
                                                                        logFirebaseEvent(
                                                                            'PrimaryRoundedButton_alert_dialog');
                                                                        await showAlignedDialog(
                                                                          context:
                                                                              context,
                                                                          isGlobal:
                                                                              true,
                                                                          avoidOverflow:
                                                                              false,
                                                                          targetAnchor:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          followerAnchor:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Material(
                                                                              color: Colors.transparent,
                                                                              child: WebViewAware(
                                                                                  child: GestureDetector(
                                                                                onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                child: ModalConfirm2Widget(
                                                                                  modalTitlePara: 'Install ${listViewDwPluginsRecord.pluginName}',
                                                                                  modalDescPara: 'By activating ${listViewDwPluginsRecord.pluginName}, the menu and settings will appear under the admin section.',
                                                                                  cancelBtnTextPara: 'No, Cancel',
                                                                                  confirmBtnTextPara: 'Yes, Install',
                                                                                  confirmActionPara: () async {
                                                                                    logFirebaseEvent('_backend_call');

                                                                                    await listViewDwPluginsRecord.reference.update(createDwPluginsRecordData(
                                                                                      pluginStatus: true,
                                                                                    ));
                                                                                    logFirebaseEvent('_close_dialog,_drawer,_etc');
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                ),
                                                                              )),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 15.0)),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 20.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: wrapWithModel(
                                        model: _model.noAccessErrorModel,
                                        updateCallback: () => setState(() {}),
                                        child: NoAccessErrorWidget(),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
