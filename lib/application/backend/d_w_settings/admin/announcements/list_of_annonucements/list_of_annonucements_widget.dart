import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/backend/d_w_settings/admin/announcements/components/create_announcement/create_announcement_widget.dart';
import '/application/backend/d_w_settings/admin/announcements/components/update_announcement/update_announcement_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/layouts/title_with_back_button/title_with_back_button_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/shimmers/shimmer_count/shimmer_count_widget.dart';
import '/application/components/shimmers/shimmer_list_of_tables/shimmer_list_of_tables_widget.dart';
import '/application/components/shimmers/shimmer_one_detail/shimmer_one_detail_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'list_of_annonucements_model.dart';
export 'list_of_annonucements_model.dart';

class ListOfAnnonucementsWidget extends StatefulWidget {
  const ListOfAnnonucementsWidget({Key? key}) : super(key: key);

  @override
  _ListOfAnnonucementsWidgetState createState() =>
      _ListOfAnnonucementsWidgetState();
}

class _ListOfAnnonucementsWidgetState extends State<ListOfAnnonucementsWidget> {
  late ListOfAnnonucementsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfAnnonucementsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ListOfAnnonucements'});
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
        title: 'Annonucements',
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
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.karrowLeft2,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'LIST_OF_ANNONUCEMENTS_arrowLeft2_ICN_ON_');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.pop();
                      },
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'foef0h91' /* Annonucements */,
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
                      selectedSidebarNav: 'Annonucements',
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          child: Builder(
                            builder: (context) {
                              if (valueOrDefault(
                                      currentUserDocument?.userRole, '') ==
                                  'User') {
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    wrapWithModel(
                                      model: _model.noAccessErrorModel,
                                      updateCallback: () => setState(() {}),
                                      child: NoAccessErrorWidget(),
                                    ),
                                  ],
                                );
                              } else {
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      wrapWithModel(
                                        model: _model.dWHeaderModel,
                                        updateCallback: () => setState(() {}),
                                        child: DWHeaderWidget(
                                          pageTitle: 'Annonucements',
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 20.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 800.0,
                                            constraints: BoxConstraints(
                                              maxWidth: double.infinity,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    wrapWithModel(
                                                      model: _model
                                                          .titleWithBackButtonModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          TitleWithBackButtonWidget(
                                                        titleName:
                                                            'Annonucements',
                                                        actionPara: () async {
                                                          logFirebaseEvent(
                                                              'LIST_OF_ANNONUCEMENTS_Container_unqmgcei');
                                                          logFirebaseEvent(
                                                              'TitleWithBackButton_bottom_sheet');
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 400.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: StreamBuilder<
                                                          List<DwAppRecord>>(
                                                        stream:
                                                            queryDwAppRecord(
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return ShimmerOneDetailWidget();
                                                          }
                                                          List<DwAppRecord>
                                                              switchListTileDwAppRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final switchListTileDwAppRecord =
                                                              switchListTileDwAppRecordList
                                                                      .isNotEmpty
                                                                  ? switchListTileDwAppRecordList
                                                                      .first
                                                                  : null;
                                                          return SwitchListTile
                                                              .adaptive(
                                                            value: _model
                                                                    .switchListTileValue ??=
                                                                switchListTileDwAppRecord!
                                                                    .announcementStatus,
                                                            onChanged:
                                                                (newValue) async {
                                                              setState(() =>
                                                                  _model.switchListTileValue =
                                                                      newValue!);
                                                              if (newValue!) {
                                                                logFirebaseEvent(
                                                                    'LIST_OF_ANNONUCEMENTS_SwitchListTile_lkl');
                                                                logFirebaseEvent(
                                                                    'SwitchListTile_backend_call');

                                                                await switchListTileDwAppRecord!
                                                                    .reference
                                                                    .update(
                                                                        createDwAppRecordData(
                                                                  announcementStatus:
                                                                      true,
                                                                ));
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'LIST_OF_ANNONUCEMENTS_SwitchListTile_lkl');
                                                                logFirebaseEvent(
                                                                    'SwitchListTile_backend_call');

                                                                await switchListTileDwAppRecord!
                                                                    .reference
                                                                    .update(
                                                                        createDwAppRecordData(
                                                                  announcementStatus:
                                                                      false,
                                                                ));
                                                              }
                                                            },
                                                            title: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '6madjbfr' /* Enable */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelMediumFamily),
                                                                  ),
                                                            ),
                                                            subtitle: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '5x4ci6ks' /* If you have recent or signific... */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                            tileColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            activeTrackColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                            dense: true,
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .trailing,
                                                            contentPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 400.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Flexible(
                                                            child: Container(
                                                              width: 300.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .searchTextFieldModel,
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    SearchTextFieldWidget(
                                                                  hintPara:
                                                                      'Search',
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
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            updateOnChange:
                                                                true,
                                                            child:
                                                                PrimaryButtonWidget(
                                                              buttonText:
                                                                  'Add new',
                                                              disableStatusPara:
                                                                  false,
                                                              buttonAction:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'LIST_OF_ANNONUCEMENTS_Container_qc46pxt6');
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
                                                                  useSafeArea:
                                                                      true,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return WebViewAware(
                                                                        child:
                                                                            GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            CreateAnnouncementWidget(),
                                                                      ),
                                                                    ));
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                    FutureBuilder<int>(
                                                      future:
                                                          queryDwAnnouncementsRecordCount(),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return ShimmerCountWidget();
                                                        }
                                                        int textCount =
                                                            snapshot.data!;
                                                        return Text(
                                                          '${textCount.toString()} Announcement',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 12.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 20.0)),
                                                ),
                                                if (_model
                                                        .switchListTileValue ==
                                                    true)
                                                  Expanded(
                                                    child: StreamBuilder<
                                                        List<
                                                            DwAnnouncementsRecord>>(
                                                      stream:
                                                          queryDwAnnouncementsRecord(
                                                        queryBuilder: (dwAnnouncementsRecord) =>
                                                            dwAnnouncementsRecord
                                                                .where(
                                                                  'post_title',
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
                                                                .orderBy(
                                                                    'created_at',
                                                                    descending:
                                                                        true),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                ShimmerListOfTablesWidget(),
                                                          );
                                                        }
                                                        List<DwAnnouncementsRecord>
                                                            dataTableDwAnnouncementsRecordList =
                                                            snapshot.data!;
                                                        if (dataTableDwAnnouncementsRecordList
                                                            .isEmpty) {
                                                          return EmptyTableWidget(
                                                            buttonActionPara:
                                                                () async {},
                                                          );
                                                        }
                                                        return DataTable2(
                                                          columns: [
                                                            DataColumn2(
                                                              label:
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'hptv1phs' /* Title */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        fontSize:
                                                                            13.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            DataColumn2(
                                                              label:
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child:
                                                                    Visibility(
                                                                  visible:
                                                                      responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                    tabletLandscape:
                                                                        false,
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.00,
                                                                            0.00),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'pery7sit' /* Created At */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                13.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            DataColumn2(
                                                              label:
                                                                  DefaultTextStyle
                                                                      .merge(
                                                                softWrap: true,
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.00,
                                                                          0.00),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'szgdj3o1' /* Action */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelLargeFamily,
                                                                          fontSize:
                                                                              13.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                          rows:
                                                              dataTableDwAnnouncementsRecordList
                                                                  .mapIndexed((dataTableIndex,
                                                                          dataTableDwAnnouncementsRecord) =>
                                                                      [
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('LIST_OF_ANNONUCEMENTS_Row_jsnh4qkr_ON_TA');
                                                                            logFirebaseEvent('Row_bottom_sheet');
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              barrierColor: FlutterFlowTheme.of(context).overlay,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return WebViewAware(
                                                                                    child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: UpdateAnnouncementWidget(
                                                                                      recordRef: dataTableDwAnnouncementsRecord.reference,
                                                                                    ),
                                                                                  ),
                                                                                ));
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      dataTableDwAnnouncementsRecord.postTitle,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 14.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      desktop: false,
                                                                                    ))
                                                                                      Text(
                                                                                        '${dateTimeFormat(
                                                                                          'yMMMd',
                                                                                          dataTableDwAnnouncementsRecord.createdAt,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        )}, ${dateTimeFormat(
                                                                                          'jm',
                                                                                          dataTableDwAnnouncementsRecord.createdAt,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        )}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 11.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    StreamBuilder<List<UsersRecord>>(
                                                                                      stream: queryUsersRecord(
                                                                                        queryBuilder: (usersRecord) => usersRecord.where(
                                                                                          'uid',
                                                                                          isEqualTo: dataTableDwAnnouncementsRecord.userRef?.id,
                                                                                        ),
                                                                                        singleRecord: true,
                                                                                      ),
                                                                                      builder: (context, snapshot) {
                                                                                        // Customize what your widget looks like when it's loading.
                                                                                        if (!snapshot.hasData) {
                                                                                          return Center(
                                                                                            child: LinearProgressIndicator(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                        List<UsersRecord> richTextUsersRecordList = snapshot.data!;
                                                                                        // Return an empty Container when the item does not exist.
                                                                                        if (snapshot.data!.isEmpty) {
                                                                                          return Container();
                                                                                        }
                                                                                        final richTextUsersRecord = richTextUsersRecordList.isNotEmpty ? richTextUsersRecordList.first : null;
                                                                                        return RichText(
                                                                                          textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                          text: TextSpan(
                                                                                            children: [
                                                                                              TextSpan(
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'pcamwbuy' /* By -  */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 12.0,
                                                                                                      fontWeight: FontWeight.w300,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                              TextSpan(
                                                                                                text: '${richTextUsersRecord?.firstName} ${richTextUsersRecord?.lastName}',
                                                                                                style: TextStyle(
                                                                                                  fontSize: 12.0,
                                                                                                ),
                                                                                              )
                                                                                            ],
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  fontSize: 12.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 3.0)),
                                                                                ),
                                                                              ].divide(SizedBox(width: 8.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Visibility(
                                                                          visible:
                                                                              responsiveVisibility(
                                                                            context:
                                                                                context,
                                                                            phone:
                                                                                false,
                                                                            tablet:
                                                                                false,
                                                                            tabletLandscape:
                                                                                false,
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.00, 0.00),
                                                                                child: Text(
                                                                                  '${dateTimeFormat(
                                                                                    'yMMMd',
                                                                                    dataTableDwAnnouncementsRecord.createdAt,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  )}, ${dateTimeFormat(
                                                                                    'jm',
                                                                                    dataTableDwAnnouncementsRecord.createdAt,
                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                  )}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 12.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'w086ak5p' /* Read */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    fontSize: 12.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            Builder(
                                                                              builder: (context) => InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('LIST_OF_ANNONUCEMENTS_Text_pgqwmx9b_ON_T');
                                                                                  logFirebaseEvent('Text_alert_dialog');
                                                                                  await showAlignedDialog(
                                                                                    context: context,
                                                                                    isGlobal: true,
                                                                                    avoidOverflow: false,
                                                                                    targetAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                    followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                    builder: (dialogContext) {
                                                                                      return Material(
                                                                                        color: Colors.transparent,
                                                                                        child: WebViewAware(
                                                                                            child: GestureDetector(
                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                          child: ModalConfirmWidget(
                                                                                            modalTitle: 'Delete record',
                                                                                            modalDesc: ' Are you sure you want to delete this record?',
                                                                                            modalAction: () async {
                                                                                              logFirebaseEvent('_backend_call');
                                                                                              await dataTableDwAnnouncementsRecord.reference.delete();
                                                                                            },
                                                                                          ),
                                                                                        )),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                },
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'fl1xa9jl' /* Delete */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 12.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 15.0)),
                                                                        ),
                                                                      ]
                                                                          .map((c) => DataCell(
                                                                              c))
                                                                          .toList())
                                                                  .map((e) =>
                                                                      DataRow(
                                                                          cells:
                                                                              e))
                                                                  .toList(),
                                                          headingRowColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                          ),
                                                          headingRowHeight:
                                                              56.0,
                                                          dataRowColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                          ),
                                                          dataRowHeight: 56.0,
                                                          border: TableBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                          ),
                                                          dividerThickness: 1.0,
                                                          showBottomBorder:
                                                              false,
                                                          minWidth: 49.0,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                              ].divide(SizedBox(height: 15.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ].divide(SizedBox(height: 30.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
