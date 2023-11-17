import '/application/backend/d_w_dashboard/global/d_w_header/d_w_header_widget.dart';
import '/application/backend/d_w_dashboard/global/d_w_sidebar/d_w_sidebar_widget.dart';
import '/application/components/empty/empty_table/empty_table_widget.dart';
import '/application/components/empty/no_access_error/no_access_error_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_of_chats_model.dart';
export 'list_of_chats_model.dart';

class ListOfChatsWidget extends StatefulWidget {
  const ListOfChatsWidget({Key? key}) : super(key: key);

  @override
  _ListOfChatsWidgetState createState() => _ListOfChatsWidgetState();
}

class _ListOfChatsWidgetState extends State<ListOfChatsWidget> {
  late ListOfChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfChatsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ListOfChats'});
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
        title: 'Chats',
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
                          'LIST_OF_CHATS_PAGE_arrowLeft2_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_navigate_back');
                      context.pop();
                    },
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'r04lksoj' /* All Chats */,
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
                                      pageTitle: 'All Chats',
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 20.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        constraints: BoxConstraints(
                                          maxWidth: double.infinity,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: StreamBuilder<List<ChatsRecord>>(
                                          stream: queryChatsRecord(
                                            queryBuilder: (chatsRecord) =>
                                                chatsRecord
                                                    .where(
                                                      'users',
                                                      arrayContains:
                                                          currentUserReference,
                                                    )
                                                    .orderBy(
                                                        'last_message_time',
                                                        descending: true),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: LinearProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              );
                                            }
                                            List<ChatsRecord>
                                                listViewChatsRecordList =
                                                snapshot.data!;
                                            if (listViewChatsRecordList
                                                .isEmpty) {
                                              return EmptyTableWidget(
                                                titlePara: 'No Messages',
                                                descPara:
                                                    'New Message will appear here.',
                                                buttonTextPara:
                                                    'Start chatting now',
                                                buttonActionPara: () async {
                                                  logFirebaseEvent(
                                                      'LIST_OF_CHATS_ListView_lhjxscee_CALLBACK');
                                                  logFirebaseEvent(
                                                      'ListView_navigate_to');

                                                  context
                                                      .pushNamed('CreateChat');
                                                },
                                              );
                                            }
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: listViewChatsRecordList
                                                  .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewChatsRecord =
                                                    listViewChatsRecordList[
                                                        listViewIndex];
                                                return StreamBuilder<
                                                    FFChatInfo>(
                                                  stream: FFChatManager.instance
                                                      .getChatInfo(
                                                          chatRecord:
                                                              listViewChatsRecord),
                                                  builder: (context, snapshot) {
                                                    final chatInfo = snapshot
                                                            .data ??
                                                        FFChatInfo(
                                                            listViewChatsRecord);
                                                    return FFChatPreview(
                                                      onTap: () =>
                                                          context.pushNamed(
                                                        'ChatPage',
                                                        queryParameters: {
                                                          'chatUser':
                                                              serializeParam(
                                                            chatInfo.otherUsers
                                                                        .length ==
                                                                    1
                                                                ? chatInfo
                                                                    .otherUsersList
                                                                    .first
                                                                : null,
                                                            ParamType.Document,
                                                          ),
                                                          'chatRef':
                                                              serializeParam(
                                                            chatInfo.chatRecord
                                                                .reference,
                                                            ParamType
                                                                .DocumentReference,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'chatUser': chatInfo
                                                                      .otherUsers
                                                                      .length ==
                                                                  1
                                                              ? chatInfo
                                                                  .otherUsersList
                                                                  .first
                                                              : null,
                                                        },
                                                      ),
                                                      lastChatText: chatInfo
                                                          .chatPreviewMessage(),
                                                      lastChatTime:
                                                          listViewChatsRecord
                                                              .lastMessageTime,
                                                      seen: listViewChatsRecord
                                                          .lastMessageSeenBy!
                                                          .contains(
                                                              currentUserReference),
                                                      title: chatInfo
                                                          .chatPreviewTitle(),
                                                      userProfilePic: chatInfo
                                                          .chatPreviewPic(),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      unreadColor: Colors.blue,
                                                      titleTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                      dateTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall,
                                                      previewTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  5.0,
                                                                  5.0,
                                                                  5.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
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
          ),
        ));
  }
}
