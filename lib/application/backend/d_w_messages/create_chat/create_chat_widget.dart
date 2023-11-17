import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/layouts/photo_grid_cover/photo_grid_cover_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_chat_model.dart';
export 'create_chat_model.dart';

class CreateChatWidget extends StatefulWidget {
  const CreateChatWidget({
    Key? key,
    this.chat,
  }) : super(key: key);

  final ChatsRecord? chat;

  @override
  _CreateChatWidgetState createState() => _CreateChatWidgetState();
}

class _CreateChatWidgetState extends State<CreateChatWidget> {
  late CreateChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateChatModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'CreateChat'});
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
        title: 'Add Friend to Chat',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
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
                    borderRadius: 30.0,
                    buttonSize: 46.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Color(0xFF95A1AC),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'CREATE_CHAT_arrow_back_rounded_ICN_ON_TA');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                    },
                  ),
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'y5pn506n' /* Add Users to Chat */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleMediumFamily),
                                ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'm7g1dm3n' /* Select the users to add to cha... */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 0.0,
                )
              : null,
          body: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.dWSidebarModel,
                updateCallback: () => setState(() {}),
                child: DWSidebarWidget(),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          if ((valueOrDefault(
                                      currentUserDocument?.userRole, '') ==
                                  'Owner') ||
                              (valueOrDefault(
                                      currentUserDocument?.userRole, '') ==
                                  'Admin') ||
                              (valueOrDefault(
                                      currentUserDocument?.userRole, '') ==
                                  'Customer Support') ||
                              (valueOrDefault(
                                      currentUserDocument?.userRole, '') ==
                                  'IT Support') ||
                              (valueOrDefault(
                                      currentUserDocument?.userRole, '') ==
                                  'Content Author')) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                wrapWithModel(
                                  model: _model.dWHeaderModel,
                                  updateCallback: () => setState(() {}),
                                  child: DWHeaderWidget(
                                    pageTitle: 'Add Friends to Chat',
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: double.infinity,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 400.0,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 20.0, 20.0, 20.0),
                                            child: wrapWithModel(
                                              model:
                                                  _model.searchTextFieldModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: SearchTextFieldWidget(
                                                readOnlyStatusPara: false,
                                                actionPara: () async {},
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child:
                                              StreamBuilder<List<UsersRecord>>(
                                            stream: queryUsersRecord(
                                              limit: 50,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child:
                                                      LinearProgressIndicator(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                );
                                              }
                                              List<UsersRecord>
                                                  listViewUsersRecordList =
                                                  snapshot.data!;
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewUsersRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewUsersRecord =
                                                      listViewUsersRecordList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'CREATE_CHAT_PAGE_Container_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Container_navigate_to');

                                                        context.pushNamed(
                                                          'ChatPage',
                                                          queryParameters: {
                                                            'chatUser':
                                                                serializeParam(
                                                              listViewUsersRecord,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                            'chatRef':
                                                                serializeParam(
                                                              widget.chat
                                                                  ?.reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'chatUser':
                                                                listViewUsersRecord,
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 70.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              elevation: 0.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            100.0),
                                                              ),
                                                              child:
                                                                  PhotoGridCoverWidget(
                                                                key: Key(
                                                                    'Keykbq_${listViewIndex}_of_${listViewUsersRecordList.length}'),
                                                                photoWidth: 50,
                                                                photoHeight: 50,
                                                                photoPath:
                                                                    listViewUsersRecord
                                                                        .photoUrl,
                                                                photoName:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  functions.getFirstLetterOfString(
                                                                      valueOrDefault<
                                                                          String>(
                                                                    listViewUsersRecord
                                                                        .displayName,
                                                                    'A',
                                                                  )),
                                                                  'A',
                                                                ),
                                                                bgColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    CheckboxListTile(
                                                                  value: _model
                                                                          .checkboxListTileValueMap[
                                                                      listViewUsersRecord] ??= false,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    setState(() =>
                                                                        _model.checkboxListTileValueMap[listViewUsersRecord] =
                                                                            newValue!);
                                                                  },
                                                                  title: Text(
                                                                    listViewUsersRecord
                                                                        .displayName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleMediumFamily,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                        ),
                                                                  ),
                                                                  subtitle:
                                                                      Text(
                                                                    listViewUsersRecord
                                                                        .email
                                                                        .maybeHandleOverflow(
                                                                            maxChars:
                                                                                30),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall,
                                                                  ),
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  dense: true,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .trailing,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
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
                                Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x3314181B),
                                        offset: Offset(0.0, -2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                  ),
                                  child: wrapWithModel(
                                    model: _model.primaryButtonModel,
                                    updateCallback: () => setState(() {}),
                                    child: PrimaryButtonWidget(
                                      buttonText: 'Send Message',
                                      disableStatusPara: false,
                                      buttonAction: () async {
                                        logFirebaseEvent(
                                            'CREATE_CHAT_Container_wogm6mvh_CALLBACK');
                                        logFirebaseEvent(
                                            'PrimaryButton_group_chat_action');
                                        _model.groupChat = await FFChatManager
                                            .instance
                                            .addGroupMembers(
                                          widget.chat!,
                                          _model.checkboxListTileCheckedItems
                                              .map((e) => e.reference)
                                              .toList(),
                                        );
                                        logFirebaseEvent(
                                            'PrimaryButton_navigate_to');

                                        context.pushNamed(
                                          'ChatPage',
                                          queryParameters: {
                                            'chatUser': serializeParam(
                                              _model
                                                  .checkboxListTileCheckedItems
                                                  .first,
                                              ParamType.Document,
                                            ),
                                            'chatRef': serializeParam(
                                              _model.groupChat?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'chatUser': _model
                                                .checkboxListTileCheckedItems
                                                .first,
                                          },
                                        );

                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ],
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
                  ].divide(SizedBox(height: 30.0)),
                ),
              ),
            ],
          ),
        ));
  }
}
