import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/shimmers/shimmer_card/shimmer_card_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_settings_model.dart';
export 'post_settings_model.dart';

class PostSettingsWidget extends StatefulWidget {
  const PostSettingsWidget({Key? key}) : super(key: key);

  @override
  _PostSettingsWidgetState createState() => _PostSettingsWidgetState();
}

class _PostSettingsWidgetState extends State<PostSettingsWidget> {
  late PostSettingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostSettingsModel());

    _model.textFieldPageTitleFocusNode ??= FocusNode();

    _model.textFieldBlogDescFocusNode ??= FocusNode();

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
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: StreamBuilder<List<DwPostsSettingsRecord>>(
              stream: queryDwPostsSettingsRecord(
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Container(
                    width: 1100.0,
                    height: double.infinity,
                    child: ShimmerCardWidget(
                      heightPara: 800,
                    ),
                  );
                }
                List<DwPostsSettingsRecord> containerDwPostsSettingsRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final containerDwPostsSettingsRecord =
                    containerDwPostsSettingsRecordList.isNotEmpty
                        ? containerDwPostsSettingsRecordList.first
                        : null;
                return Container(
                  width: 800.0,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'zwzp34r3' /* Blog Settings */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).titleLarge,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.primaryRoundedButtonModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: PrimaryRoundedButtonWidget(
                                    buttonText: 'Close',
                                    buttonBgColor:
                                        FlutterFlowTheme.of(context).accent3,
                                    buttonTextColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    buttonWidth: 80,
                                    buttonHeight: 35,
                                    disableStatusPara: false,
                                    buttonAction: () async {
                                      logFirebaseEvent(
                                          'POST_SETTINGS_Container_9ls534n0_CALLBAC');
                                      logFirebaseEvent(
                                          'PrimaryRoundedButton_bottom_sheet');
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                wrapWithModel(
                                  model:
                                      _model.primaryRoundedButtonLoadingModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: PrimaryRoundedButtonLoadingWidget(
                                    buttonText: 'Save',
                                    buttonBgColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    buttonTextColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    buttonWidth: 100,
                                    buttonHeight: 35,
                                    disableStatusPara: (_model
                                                    .textFieldPageTitleController
                                                    .text ==
                                                null ||
                                            _model.textFieldPageTitleController
                                                    .text ==
                                                '') ||
                                        (_model.textFieldBlogDescController
                                                    .text ==
                                                null ||
                                            _model.textFieldBlogDescController
                                                    .text ==
                                                ''),
                                    disableColorPara:
                                        FlutterFlowTheme.of(context)
                                            .disableColor,
                                    buttonAction: () async {
                                      logFirebaseEvent(
                                          'POST_SETTINGS_Container_ecqsx30f_CALLBAC');
                                      logFirebaseEvent(
                                          'PrimaryRoundedButtonLoading_backend_call');

                                      await containerDwPostsSettingsRecord!
                                          .reference
                                          .update(
                                              createDwPostsSettingsRecordData(
                                        blogTitle: _model
                                            .textFieldPageTitleController.text,
                                        blogName: _model
                                            .textFieldBlogDescController.text,
                                        blogDesc: _model
                                            .textFieldBlogDescController.text,
                                      ));
                                      logFirebaseEvent(
                                          'PrimaryRoundedButtonLoading_action_block');
                                      await action_blocks.alertSuccess(
                                        context,
                                        descPara: 'Saved',
                                      );
                                      logFirebaseEvent(
                                          'PrimaryRoundedButtonLoading_bottom_sheet');
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 196.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: FlutterFlowChoiceChips(
                                        options: [
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'z0hdsxwl' /* Desktop */,
                                              ),
                                              FFIcons.kmonitor),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'qfhb8xh3' /* Mobile */,
                                              ),
                                              FFIcons.kmobile)
                                        ],
                                        onChanged: (val) => setState(() =>
                                            _model.choiceChipsValue =
                                                val?.first),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                fontSize: 11.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          iconSize: 14.0,
                                          elevation: 4.0,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineColor,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                fontSize: 11.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          iconSize: 14.0,
                                          elevation: 0.0,
                                        ),
                                        chipSpacing: 5.0,
                                        rowSpacing: 5.0,
                                        multiselect: false,
                                        initialized:
                                            _model.choiceChipsValue != null,
                                        alignment: WrapAlignment.start,
                                        controller: _model
                                                .choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                          [
                                            FFLocalizations.of(context).getText(
                                              'udv8zgho' /* Desktop */,
                                            )
                                          ],
                                        ),
                                        wrapped: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 20.0)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: valueOrDefault<double>(
                            _model.choiceChipsValue == 'Desktop'
                                ? 1200.0
                                : 400.0,
                            1200.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'md4seb6m' /* Your blog page information her... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall,
                                      ),
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '5p3tqka8' /* Please provide a name for the ... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      TextFormField(
                                        controller: _model
                                                .textFieldPageTitleController ??=
                                            TextEditingController(
                                          text: containerDwPostsSettingsRecord
                                              ?.blogTitle,
                                        ),
                                        focusNode:
                                            _model.textFieldPageTitleFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textFieldPageTitleController',
                                          Duration(milliseconds: 0),
                                          () => setState(() {}),
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'm9430mwy' /* Page Name/Title */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .displaySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmallFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textfieldHint,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  _model.choiceChipsValue ==
                                                          'Desktop'
                                                      ? 34.0
                                                      : 26.0,
                                                  34.0,
                                                ),
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displaySmallFamily),
                                              ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          filled: true,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmallFamily,
                                              fontSize: valueOrDefault<double>(
                                                _model.choiceChipsValue ==
                                                        'Desktop'
                                                    ? 34.0
                                                    : 26.0,
                                                34.0,
                                              ),
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmallFamily),
                                            ),
                                        maxLines: 4,
                                        minLines: 1,
                                        validator: _model
                                            .textFieldPageTitleControllerValidator
                                            .asValidator(context),
                                      ),
                                      TextFormField(
                                        controller: _model
                                                .textFieldBlogDescController ??=
                                            TextEditingController(
                                          text: containerDwPostsSettingsRecord
                                              ?.blogDesc,
                                        ),
                                        focusNode:
                                            _model.textFieldBlogDescFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textFieldBlogDescController',
                                          Duration(milliseconds: 0),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'zjwuwdf9' /* Blog description */,
                                          ),
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textfieldHint,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily),
                                              ),
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          filled: true,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  14.0, 14.0, 14.0, 14.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLargeFamily,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLargeFamily),
                                            ),
                                        maxLines: 8,
                                        validator: _model
                                            .textFieldBlogDescControllerValidator
                                            .asValidator(context),
                                      ),
                                    ].divide(SizedBox(height: 15.0)),
                                  ),
                                ].divide(SizedBox(height: 20.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
