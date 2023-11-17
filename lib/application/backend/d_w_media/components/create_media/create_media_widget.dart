import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/forms/search_text_field/search_text_field_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/application/components/shimmers/shimmer_lists_of_cards/shimmer_lists_of_cards_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'create_media_model.dart';
export 'create_media_model.dart';

class CreateMediaWidget extends StatefulWidget {
  const CreateMediaWidget({Key? key}) : super(key: key);

  @override
  _CreateMediaWidgetState createState() => _CreateMediaWidgetState();
}

class _CreateMediaWidgetState extends State<CreateMediaWidget>
    with TickerProviderStateMixin {
  late CreateMediaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateMediaModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
        width: 900.0,
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
          border: Border.all(
            color: FlutterFlowTheme.of(context).accent4,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'v0zb0w58' /* Upload Image */,
                      ),
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                  ),
                  wrapWithModel(
                    model: _model.primaryRoundedButtonModel,
                    updateCallback: () => setState(() {}),
                    updateOnChange: true,
                    child: PrimaryRoundedButtonWidget(
                      buttonText: 'Cancel',
                      buttonBgColor: FlutterFlowTheme.of(context).lineColor,
                      buttonTextColor: FlutterFlowTheme.of(context).primaryText,
                      buttonWidth: 70,
                      buttonHeight: 35,
                      disableStatusPara: false,
                      buttonAction: () async {
                        logFirebaseEvent(
                            'CREATE_MEDIA_Container_erxa2pe3_CALLBACK');
                        logFirebaseEvent('PrimaryRoundedButton_bottom_sheet');
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ].divide(SizedBox(width: 15.0)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(-1.0, 0),
                        child: FlutterFlowButtonTabBar(
                          useToggleButtonStyle: true,
                          labelStyle: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelSmallFamily,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelSmallFamily),
                              ),
                          unselectedLabelStyle: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelSmallFamily,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelSmallFamily),
                              ),
                          labelColor: FlutterFlowTheme.of(context).white,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).primaryText,
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                          unselectedBackgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          borderWidth: 0.0,
                          borderRadius: 0.0,
                          elevation: 0.0,
                          buttonMargin: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          tabs: [
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'swvm7tiu' /* Self */,
                              ),
                            ),
                            Tab(
                              text: FFLocalizations.of(context).getText(
                                'gi1oqv79' /* Pexels */,
                              ),
                            ),
                          ],
                          controller: _model.tabBarController,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 500.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFCCCCCC),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 20.0),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.isDataUploading) {
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                20.0,
                                                                20.0,
                                                                20.0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .shimmerCardModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child: ShimmerCardWidget(
                                                        heightPara: 200,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else if (_model.uploadedFileUrl !=
                                                  null &&
                                              _model.uploadedFileUrl != '') {
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
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
                                                            'CREATE_MEDIA_COMP_Text_jjovjgvv_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Text_clear_uploaded_data');
                                                        setState(() {
                                                          _model.isDataUploading =
                                                              false;
                                                          _model.uploadedLocalFile =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
                                                          _model.uploadedFileUrl =
                                                              '';
                                                        });
                                                      },
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'l5aigs05' /* Back to Upload photos */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .primaryRoundedButtonLoadingModel1,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          PrimaryRoundedButtonLoadingWidget(
                                                        buttonText:
                                                            'Upload & Save',
                                                        buttonBgColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        buttonTextColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        buttonWidth: 150,
                                                        buttonHeight: 40,
                                                        disableStatusPara:
                                                            false,
                                                        buttonAction: () async {
                                                          logFirebaseEvent(
                                                              'CREATE_MEDIA_Container_3cksc0xt_CALLBACK');
                                                          logFirebaseEvent(
                                                              'PrimaryRoundedButtonLoading_update_compo');
                                                          _model.photoListIndex =
                                                              0;
                                                          logFirebaseEvent(
                                                              'PrimaryRoundedButtonLoading_backend_call');

                                                          await DwMediaRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  createDwMediaRecordData(
                                                                createdTime:
                                                                    getCurrentTimestamp,
                                                                userRef:
                                                                    currentUserReference,
                                                                photoPath: _model
                                                                    .uploadedFileUrl,
                                                              ));
                                                          logFirebaseEvent(
                                                              'PrimaryRoundedButtonLoading_bottom_sheet');
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.network(
                                                    getCORSProxyUrl(
                                                      _model.uploadedFileUrl,
                                                    ),
                                                    width: double.infinity,
                                                    height: 350.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 20.0)),
                                            );
                                          } else {
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'CREATE_MEDIA_Container-SetAction_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container-SetAction_upload_media_to_fire');
                                                final selectedMedia =
                                                    await selectMedia(
                                                  maxWidth: 1200.00,
                                                  imageQuality: 91,
                                                  mediaSource:
                                                      MediaSource.photoGallery,
                                                  multiImage: false,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() => _model
                                                      .isDataUploading = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    showUploadMessage(
                                                      context,
                                                      'Uploading file...',
                                                      showLoading: true,
                                                    );
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    _model.isDataUploading =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl =
                                                          downloadUrls.first;
                                                    });
                                                    showUploadMessage(
                                                        context, 'Success!');
                                                  } else {
                                                    setState(() {});
                                                    showUploadMessage(context,
                                                        'Failed to upload data');
                                                    return;
                                                  }
                                                }
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 400.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      FFIcons.kgalleryAdd,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ylpxvhvx' /* Start uploading */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 13.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ud0u7y48' /* You can upload your image with... */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ].divide(SizedBox(height: 20.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: StreamBuilder<List<AppPhotosApiRecord>>(
                                stream: queryAppPhotosApiRecord(
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return ShimmerCardWidget(
                                      heightPara: 400,
                                    );
                                  }
                                  List<AppPhotosApiRecord>
                                      columnUploadFromPexelsAppPhotosApiRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final columnUploadFromPexelsAppPhotosApiRecord =
                                      columnUploadFromPexelsAppPhotosApiRecordList
                                              .isNotEmpty
                                          ? columnUploadFromPexelsAppPhotosApiRecordList
                                              .first
                                          : null;
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            if (_model.previewStockPhoto ==
                                                true) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
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
                                                              'CREATE_MEDIA_COMP_Text_smrv0fkd_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Text_update_component_state');
                                                          setState(() {
                                                            _model.previewStockPhoto =
                                                                false;
                                                          });
                                                        },
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '2r2ygdd8' /* Back to Pexels photos */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .primaryRoundedButtonLoadingModel2,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        updateOnChange: true,
                                                        child:
                                                            PrimaryRoundedButtonLoadingWidget(
                                                          buttonText:
                                                              'Upload & Save',
                                                          buttonBgColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          buttonTextColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                          buttonWidth: 150,
                                                          buttonHeight: 40,
                                                          disableStatusPara:
                                                              false,
                                                          buttonAction:
                                                              () async {
                                                            logFirebaseEvent(
                                                                'CREATE_MEDIA_Container_fp7w0wxh_CALLBACK');
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_backend_call');

                                                            await DwMediaRecord
                                                                .collection
                                                                .doc()
                                                                .set(
                                                                    createDwMediaRecordData(
                                                                  createdTime:
                                                                      getCurrentTimestamp,
                                                                  userRef:
                                                                      currentUserReference,
                                                                  photoPath: _model
                                                                      .photoPhotoUrl,
                                                                  photoSource:
                                                                      _model
                                                                          .photoSource,
                                                                  photoCredit:
                                                                      _model
                                                                          .photoCredit,
                                                                ));
                                                            logFirebaseEvent(
                                                                'PrimaryRoundedButtonLoading_bottom_sheet');
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 500.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    colorFromCssString(
                                                                  _model
                                                                      .photoColor!,
                                                                  defaultColor:
                                                                      Colors
                                                                          .black,
                                                                ),
                                                              ),
                                                            ),
                                                            CachedNetworkImage(
                                                              fadeInDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              fadeOutDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              imageUrl:
                                                                  getCORSProxyUrl(
                                                                _model
                                                                    .photoPhotoUrl!,
                                                              ),
                                                              width: double
                                                                  .infinity,
                                                              height: 500.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 20.0)),
                                              );
                                            } else {
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      RichText(
                                                        textScaleFactor:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaleFactor,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'cnejcvcd' /* Search photos via  */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall,
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'ldto6mtt' /* Pexels */,
                                                              ),
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                              mouseCursor:
                                                                  SystemMouseCursors
                                                                      .click,
                                                              recognizer:
                                                                  TapGestureRecognizer()
                                                                    ..onTap =
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'CREATE_MEDIA_RichTextSpan_cy2d788k_ON_TA');
                                                                      logFirebaseEvent(
                                                                          'RichTextSpan_launch_u_r_l');
                                                                      await launchURL(
                                                                          'https://pexels.com');
                                                                    },
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall,
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'p6oyjv7y' /* Browse stock images, tap to se... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      ),
                                                      wrapWithModel(
                                                        model: _model
                                                            .searchTextFieldPexelsModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        updateOnChange: true,
                                                        child:
                                                            SearchTextFieldWidget(
                                                          readOnlyStatusPara:
                                                              false,
                                                          actionPara: () async {
                                                            logFirebaseEvent(
                                                                'CREATE_MEDIA_SearchTextField-Pexels_CALL');
                                                            logFirebaseEvent(
                                                                'SearchTextField-Pexels_backend_call');
                                                            _model.apiResultmzr =
                                                                await PexelsAPICall
                                                                    .call(
                                                              query: _model
                                                                  .searchTextFieldPexelsModel
                                                                  .searchTextFieldController
                                                                  .text,
                                                            );

                                                            setState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 500.0,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FutureBuilder<
                                                          ApiCallResponse>(
                                                        future:
                                                            PexelsAPICall.call(
                                                          query: valueOrDefault<
                                                              String>(
                                                            _model
                                                                .searchTextFieldPexelsModel
                                                                .searchTextFieldController
                                                                .text,
                                                            'tech',
                                                          ),
                                                          pexelsApiKeys:
                                                              '563492ad6f917000010000012c1d0e6cd1054b4d838e2b6a906cc1e3',
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return ShimmerListsOfCardsWidget(
                                                              itemNo: 2,
                                                              itemSpacing: 20,
                                                              itemHeight: 240,
                                                              itemWidth: 0,
                                                            );
                                                          }
                                                          final gridViewPexelsAPIResponse =
                                                              snapshot.data!;
                                                          return Builder(
                                                            builder: (context) {
                                                              final listOfPexelsApi =
                                                                  getJsonField(
                                                                gridViewPexelsAPIResponse
                                                                    .jsonBody,
                                                                r'''$.photos''',
                                                              ).toList();
                                                              return GridView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                gridDelegate:
                                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      2,
                                                                  crossAxisSpacing:
                                                                      15.0,
                                                                  mainAxisSpacing:
                                                                      10.0,
                                                                  childAspectRatio:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    () {
                                                                      if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointSmall) {
                                                                        return 1.0;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointMedium) {
                                                                        return 1.2;
                                                                      } else if (MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          kBreakpointLarge) {
                                                                        return 1.2;
                                                                      } else {
                                                                        return 1.2;
                                                                      }
                                                                    }(),
                                                                    1.2,
                                                                  ),
                                                                ),
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listOfPexelsApi
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listOfPexelsApiIndex) {
                                                                  final listOfPexelsApiItem =
                                                                      listOfPexelsApi[
                                                                          listOfPexelsApiIndex];
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
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
                                                                          logFirebaseEvent(
                                                                              'CREATE_MEDIA_COMP_Stack_88c0er23_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Stack_update_component_state');
                                                                          setState(
                                                                              () {
                                                                            _model.previewStockPhoto =
                                                                                true;
                                                                            _model.photoPhotoUrl =
                                                                                getJsonField(
                                                                              listOfPexelsApiItem,
                                                                              r'''$.src.landscape''',
                                                                            );
                                                                            _model.photoSource =
                                                                                'Pexels';
                                                                            _model.photoCredit =
                                                                                getJsonField(
                                                                              listOfPexelsApiItem,
                                                                              r'''$.src.photographer_url''',
                                                                            ).toString();
                                                                            _model.photoColor =
                                                                                '';
                                                                          });
                                                                        },
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Container(
                                                                              width: double.infinity,
                                                                              height: 300.0,
                                                                              decoration: BoxDecoration(
                                                                                color: colorFromCssString(
                                                                                  getJsonField(
                                                                                    listOfPexelsApiItem,
                                                                                    r'''$.avg_color''',
                                                                                  ).toString(),
                                                                                  defaultColor: Colors.black,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            CachedNetworkImage(
                                                                              fadeInDuration: Duration(milliseconds: 500),
                                                                              fadeOutDuration: Duration(milliseconds: 500),
                                                                              imageUrl: getCORSProxyUrl(
                                                                                getJsonField(
                                                                                  listOfPexelsApiItem,
                                                                                  r'''$.src.landscape''',
                                                                                ),
                                                                              ),
                                                                              width: double.infinity,
                                                                              height: 300.0,
                                                                              fit: BoxFit.cover,
                                                                              errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                'assets/images/error_image.png',
                                                                                width: double.infinity,
                                                                                height: 300.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.00,
                                                                            1.00),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('CREATE_MEDIA_RichText_gr182m8s_ON_TAP');
                                                                                logFirebaseEvent('RichText_launch_u_r_l');
                                                                                await launchURL(getJsonField(
                                                                                  listOfPexelsApiItem,
                                                                                  r'''$.photographer_url''',
                                                                                ).toString());
                                                                              },
                                                                              child: RichText(
                                                                                textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'qpipyb1f' /* By -  */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                            fontSize: 12.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: getJsonField(
                                                                                        listOfPexelsApiItem,
                                                                                        r'''$.photographer''',
                                                                                      ).toString(),
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 12.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                      ),
                                                                                ),
                                                                                maxLines: 15,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              '(${getJsonField(
                                                                                listOfPexelsApiItem,
                                                                                r'''$.width''',
                                                                              ).toString()} x ${getJsonField(
                                                                                listOfPexelsApiItem,
                                                                                r'''$.height''',
                                                                              ).toString()})',
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                    fontSize: 12.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            5.0)),
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
                                              );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  );
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
            ),
          ].divide(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
