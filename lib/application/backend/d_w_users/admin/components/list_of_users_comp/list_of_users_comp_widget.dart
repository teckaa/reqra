import '/application/backend/d_w_users/admin/components/pop_over_edit_user/pop_over_edit_user_widget.dart';
import '/application/backend/d_w_users/admin/components/read_user/read_user_widget.dart';
import '/application/components/layouts/photo_grid/photo_grid_widget.dart';
import '/application/components/shimmers/shimmer_list_of_tables/shimmer_list_of_tables_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'list_of_users_comp_model.dart';
export 'list_of_users_comp_model.dart';

class ListOfUsersCompWidget extends StatefulWidget {
  const ListOfUsersCompWidget({
    Key? key,
    this.userStatus,
  }) : super(key: key);

  final String? userStatus;

  @override
  _ListOfUsersCompWidgetState createState() => _ListOfUsersCompWidgetState();
}

class _ListOfUsersCompWidgetState extends State<ListOfUsersCompWidget> {
  late ListOfUsersCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfUsersCompModel());

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
          child: StreamBuilder<List<UsersRecord>>(
            stream: queryUsersRecord(
              queryBuilder: (usersRecord) => usersRecord.where(
                'user_status',
                isEqualTo: widget.userStatus != '' ? widget.userStatus : null,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return ShimmerListOfTablesWidget();
              }
              List<UsersRecord> dataTableUsersRecordList = snapshot.data!;
              return DataTable2(
                columns: [
                  DataColumn2(
                    label: DefaultTextStyle.merge(
                      softWrap: true,
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'kesvt1jy' /* Fullname */,
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
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
                            'y3zij53m' /* Phone Number */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelSmallFamily,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelSmallFamily),
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
                            'ywbuvc3l' /* Created Date */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelSmallFamily,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelSmallFamily),
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
                          '66w94mfd' /* Status */,
                        ),
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                      ),
                    ),
                    fixedWidth: 150.0,
                  ),
                ],
                rows: dataTableUsersRecordList
                    .mapIndexed((dataTableIndex, dataTableUsersRecord) => [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'LIST_OF_USERS_Row_7d9am319_ON_TAP');
                              logFirebaseEvent('Row_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor:
                                    FlutterFlowTheme.of(context).overlay,
                                isDismissible: false,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                      child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ReadUserWidget(
                                      userRef: dataTableUsersRecord.reference,
                                    ),
                                  ));
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 1.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100.0),
                                    ),
                                    child: PhotoGridWidget(
                                      key: Key(
                                          'Keyiq2_${dataTableIndex}_of_${dataTableUsersRecordList.length}'),
                                      photoWidth: 35,
                                      photoHeight: 35,
                                      photoPath: dataTableUsersRecord.photoUrl,
                                      photoName: valueOrDefault<String>(
                                        '${valueOrDefault<String>(
                                          functions.getFirstLetterOfString(
                                              dataTableUsersRecord.firstName),
                                          'A',
                                        )}',
                                        'AB',
                                      ),
                                      photoNameFontSize: 15,
                                      bgColor: Colors.black,
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          '${functions.allFirstLetterUpperCase(dataTableUsersRecord.firstName)} ${functions.allFirstLetterUpperCase(dataTableUsersRecord.lastName)}',
                                          'AB',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmallFamily),
                                            ),
                                      ),
                                      Text(
                                        dataTableUsersRecord.email,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                            ),
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
                                    '${dataTableUsersRecord.dialCode}${dataTableUsersRecord.phoneNumber}',
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
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
                                dataTableUsersRecord.createdTime,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )},${dateTimeFormat(
                                'jms',
                                dataTableUsersRecord.createdTime,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              )}',
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    shape: const CircleBorder(),
                                    child: Container(
                                      width: 10.0,
                                      height: 10.0,
                                      decoration: BoxDecoration(
                                        color: () {
                                          if (dataTableUsersRecord.userStatus ==
                                              'Active') {
                                            return FlutterFlowTheme.of(context)
                                                .secondary;
                                          } else if (dataTableUsersRecord
                                                  .userStatus ==
                                              'Suspended') {
                                            return FlutterFlowTheme.of(context)
                                                .error;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .primaryText;
                                          }
                                        }(),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    dataTableUsersRecord.userStatus,
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ].divide(SizedBox(width: 5.0)),
                              ),
                              Transform.rotate(
                                angle: 1.5708,
                                child: Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'LIST_OF_USERS_Icon_i7pwhev1_ON_TAP');
                                      logFirebaseEvent('Icon_alert_dialog');
                                      await showAlignedDialog(
                                        barrierColor: Colors.transparent,
                                        context: context,
                                        isGlobal: false,
                                        avoidOverflow: false,
                                        targetAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            AlignmentDirectional(1.0, -1.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: WebViewAware(
                                                child: Container(
                                              width: 200.0,
                                              child: PopOverEditUserWidget(
                                                userRef: dataTableUsersRecord
                                                    .reference,
                                              ),
                                            )),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Icon(
                                      FFIcons.kmore,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 20.0,
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
