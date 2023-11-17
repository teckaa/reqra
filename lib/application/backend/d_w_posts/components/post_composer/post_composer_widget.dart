import '/application/backend/d_w_media/components/list_of_media_comp/list_of_media_comp_widget.dart';
import '/application/backend/d_w_posts/categories/create_category/create_category_widget.dart';
import '/application/backend/d_w_posts/categories/list_of_categories/list_of_categories_widget.dart';
import '/application/components/buttons/primary_rounded_button/primary_rounded_button_widget.dart';
import '/application/components/buttons/primary_rounded_button_loading/primary_rounded_button_loading_widget.dart';
import '/application/components/forms/input_text_area/input_text_area_widget.dart';
import '/application/components/layouts/photo_grid_with_details/photo_grid_with_details_widget.dart';
import '/application/components/modals/modal_confirm/modal_confirm_widget.dart';
import '/application/components/shimmers/shimmer_circle_button/shimmer_circle_button_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'post_composer_model.dart';
export 'post_composer_model.dart';

class PostComposerWidget extends StatefulWidget {
  const PostComposerWidget({
    Key? key,
    this.componentTitle,
    String? postType,
    this.postTitle,
    this.postDesc,
    this.postCat,
    String? postPhoto,
    this.postStatus,
    this.photoDateTime,
    this.authorFullname,
    this.authorPhoto,
    this.postButton,
  })  : this.postType = postType ?? 'post',
        this.postPhoto =
            postPhoto ?? 'https://dummyimage.com/420X150&text=Image',
        super(key: key);

  final String? componentTitle;
  final String postType;
  final String? postTitle;
  final String? postDesc;
  final List<String>? postCat;
  final String postPhoto;
  final String? postStatus;
  final String? photoDateTime;
  final String? authorFullname;
  final String? authorPhoto;
  final Future<dynamic> Function()? postButton;

  @override
  _PostComposerWidgetState createState() => _PostComposerWidgetState();
}

class _PostComposerWidgetState extends State<PostComposerWidget>
    with TickerProviderStateMixin {
  late PostComposerModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 120.ms,
          begin: Offset(48.0, 0.0),
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
    _model = createModel(context, () => PostComposerModel());

    _model.textFieldTitleController ??=
        TextEditingController(text: widget.postTitle);
    _model.textFieldTitleFocusNode ??= FocusNode();

    _model.textFieldPostDescController ??=
        TextEditingController(text: widget.postDesc);
    _model.textFieldPostDescFocusNode ??= FocusNode();

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
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
        child: Container(
          width: 1100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 100.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 2.0),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            widget.componentTitle!,
                            style: FlutterFlowTheme.of(context).titleLarge,
                          ),
                        ),
                        wrapWithModel(
                          model: _model.primaryRoundedButtonModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: PrimaryRoundedButtonWidget(
                            buttonText: 'Close',
                            buttonBgColor: FlutterFlowTheme.of(context).accent3,
                            buttonTextColor:
                                FlutterFlowTheme.of(context).primaryText,
                            buttonWidth: 80,
                            buttonHeight: 35,
                            disableStatusPara: false,
                            buttonAction: () async {
                              logFirebaseEvent(
                                  'POST_COMPOSER_Container_hrr47qit_CALLBAC');
                              logFirebaseEvent(
                                  'PrimaryRoundedButton_bottom_sheet');
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
                                    child: ModalConfirmWidget(
                                      modalTitle: 'Warning:',
                                      modalDesc:
                                          'Any unsaved changes will be lost if you close this modal box without saving. Are you sure you want to proceed?',
                                      modalAction: () async {
                                        logFirebaseEvent('_bottom_sheet');
                                        Navigator.pop(context);
                                        logFirebaseEvent(
                                            '_close_dialog,_drawer,_etc');
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ));
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                          ),
                        ),
                        wrapWithModel(
                          model: _model.primaryRoundedButtonLoadingModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: PrimaryRoundedButtonLoadingWidget(
                            buttonText: 'Publish',
                            buttonBgColor:
                                FlutterFlowTheme.of(context).primaryText,
                            buttonTextColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            buttonWidth: 100,
                            buttonHeight: 35,
                            disableStatusPara:
                                (_model.textFieldTitleController.text == null ||
                                        _model.textFieldTitleController.text ==
                                            '') ||
                                    (_model.textFieldPostDescController.text ==
                                            null ||
                                        _model.textFieldPostDescController
                                                .text ==
                                            ''),
                            disableColorPara:
                                FlutterFlowTheme.of(context).disableColor,
                            buttonAction: () async {
                              logFirebaseEvent(
                                  'POST_COMPOSER_Container_87icw7yd_CALLBAC');
                              logFirebaseEvent(
                                  'PrimaryRoundedButtonLoading_execute_call');
                              await widget.postButton?.call();
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
                            color: FlutterFlowTheme.of(context).lineColor,
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
                                      FFLocalizations.of(context).getText(
                                        'py99xmcl' /* Desktop */,
                                      ),
                                      FFIcons.kmonitor),
                                  ChipData(
                                      FFLocalizations.of(context).getText(
                                        '5ljkaopz' /* Mobile */,
                                      ),
                                      FFIcons.kmobile)
                                ],
                                onChanged: (val) => setState(
                                    () => _model.choiceChipsValue = val?.first),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        fontSize: 11.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  iconColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  iconSize: 14.0,
                                  elevation: 4.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).lineColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        fontSize: 11.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  iconSize: 14.0,
                                  elevation: 0.0,
                                ),
                                chipSpacing: 5.0,
                                rowSpacing: 5.0,
                                multiselect: false,
                                initialized: _model.choiceChipsValue != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  [
                                    FFLocalizations.of(context).getText(
                                      'imjkj6sn' /* Desktop */,
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
                    _model.choiceChipsValue == 'Desktop' ? 1200.0 : 400.0,
                    1200.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 700.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: _model.textFieldTitleController,
                                  focusNode: _model.textFieldTitleFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'cq5xzg9p' /* Write your content here */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .displaySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .textfieldHint,
                                          fontSize: valueOrDefault<double>(
                                            _model.choiceChipsValue == 'Desktop'
                                                ? 34.0
                                                : 26.0,
                                            34.0,
                                          ),
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .displaySmallFamily),
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displaySmallFamily,
                                        fontSize: valueOrDefault<double>(
                                          _model.choiceChipsValue == 'Desktop'
                                              ? 34.0
                                              : 26.0,
                                          34.0,
                                        ),
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .displaySmallFamily),
                                      ),
                                  maxLines: 4,
                                  minLines: 1,
                                  validator: _model
                                      .textFieldTitleControllerValidator
                                      .asValidator(context),
                                ),
                                wrapWithModel(
                                  model: _model.photoGridWithDetailsModel,
                                  updateCallback: () => setState(() {}),
                                  updateOnChange: true,
                                  child: PhotoGridWithDetailsWidget(
                                    photoPathPara: widget.authorPhoto,
                                    titlePara: widget.authorFullname,
                                    descPara: widget.photoDateTime,
                                    widthPara: 50,
                                    heightPara: 50,
                                    titleSizePara: 15,
                                    descSizePara: 13,
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '0vqw9f75' /* Categories */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmallFamily,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'POST_COMPOSER_COMP_Icon-ListCat_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon-ListCat_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                    child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      ListOfCategoriesWidget(),
                                                ));
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Icon(
                                            FFIcons.kdocumentText,
                                            color: Colors.black,
                                            size: 20.0,
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'POST_COMPOSER_COMP_Icon-CreateCat_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon-CreateCat_bottom_sheet');
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return WebViewAware(
                                                    child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: CreateCategoryWidget(),
                                                ));
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Icon(
                                            FFIcons.kaddSquare,
                                            color: Colors.black,
                                            size: 20.0,
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 10.0)),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: StreamBuilder<
                                              List<DwPostsCategoriesRecord>>(
                                            stream:
                                                queryDwPostsCategoriesRecord(
                                              queryBuilder:
                                                  (dwPostsCategoriesRecord) =>
                                                      dwPostsCategoriesRecord
                                                          .orderBy('created_at',
                                                              descending: true),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return ShimmerCircleButtonWidget(
                                                  buttonHeight: 30,
                                                );
                                              }
                                              List<DwPostsCategoriesRecord>
                                                  choiceChipsCategoriesDwPostsCategoriesRecordList =
                                                  snapshot.data!;
                                              return FlutterFlowChoiceChips(
                                                options:
                                                    choiceChipsCategoriesDwPostsCategoriesRecordList
                                                        .map((e) => e.catName)
                                                        .toList()
                                                        .map((label) =>
                                                            ChipData(label))
                                                        .toList(),
                                                onChanged: (val) => setState(() =>
                                                    _model.choiceChipsCategoriesValues =
                                                        val),
                                                selectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .white,
                                                  iconSize: 18.0,
                                                  elevation: 1.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                unselectedChipStyle: ChipStyle(
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .lineColor,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall,
                                                  iconColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  iconSize: 18.0,
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                chipSpacing: 12.0,
                                                rowSpacing: 12.0,
                                                multiselect: true,
                                                initialized: _model
                                                        .choiceChipsCategoriesValues !=
                                                    null,
                                                alignment: WrapAlignment.start,
                                                controller: _model
                                                        .choiceChipsCategoriesValueController ??=
                                                    FormFieldController<
                                                        List<String>>(
                                                  widget.postCat,
                                                ),
                                                wrapped: true,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              ].divide(SizedBox(height: 20.0)),
                            ),
                          ),
                          Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'POST_COMPOSER_COMP_Stack_3ratai7o_ON_TAP');
                                logFirebaseEvent('Stack_alert_dialog');
                                await showAlignedDialog(
                                  barrierColor:
                                      FlutterFlowTheme.of(context).overlay,
                                  barrierDismissible: false,
                                  context: context,
                                  isGlobal: true,
                                  avoidOverflow: false,
                                  targetAnchor: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  followerAnchor: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  builder: (dialogContext) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: WebViewAware(
                                          child: Container(
                                        height: 800.0,
                                        width: 800.0,
                                        child: ListOfMediaCompWidget(),
                                      )),
                                    );
                                  },
                                ).then((value) => safeSetState(
                                    () => _model.getPostImagePath = value));

                                logFirebaseEvent(
                                    'Stack_update_component_state');
                                setState(() {
                                  _model.getImagePathFromState =
                                      _model.getPostImagePath;
                                });

                                setState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: valueOrDefault<double>(
                                  _model.choiceChipsValue == 'Desktop'
                                      ? valueOrDefault<double>(
                                          () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 350.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 450.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 500.0;
                                            } else {
                                              return 500.0;
                                            }
                                          }(),
                                          500.0,
                                        )
                                      : 350.0,
                                  500.0,
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            FlutterFlowTheme.of(context)
                                                .lineColor
                                          ],
                                          stops: [0.0, 1.0],
                                          begin:
                                              AlignmentDirectional(0.0, -1.0),
                                          end: AlignmentDirectional(0, 1.0),
                                        ),
                                      ),
                                    ),
                                    CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl: getCORSProxyUrl(
                                        _model.getImagePathFromState != null &&
                                                _model.getImagePathFromState !=
                                                    ''
                                            ? _model.getImagePathFromState!
                                            : widget.postPhoto,
                                      ),
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      errorWidget:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 700.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 700.0,
                                      child: TextFormField(
                                        controller:
                                            _model.textFieldPostDescController,
                                        focusNode:
                                            _model.textFieldPostDescFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'tibno1tz' /* Post content */,
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
                                            .textFieldPostDescControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '9xmd6g0a' /* Advance Settings */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily),
                                          ),
                                    ),
                                    ToggleIcon(
                                      onPressed: () async {
                                        setState(() => _model.toggleAdvance =
                                            !_model.toggleAdvance);
                                      },
                                      value: _model.toggleAdvance,
                                      onIcon: Icon(
                                        FFIcons.karrowUp2,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 16.0,
                                      ),
                                      offIcon: Icon(
                                        FFIcons.karrowDown1,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                                if (_model.toggleAdvance == true)
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                          ),
                                          wrapWithModel(
                                            model: _model
                                                .inputTextAreaExcerptModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            updateOnChange: true,
                                            child: InputTextAreaWidget(
                                              labelPara: 'Excerpt',
                                              readOnlyStatusPara: false,
                                              actionPara: () async {},
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation']!),
                              ],
                            ),
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
