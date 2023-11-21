import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'annonucement_composer_model.dart';
export 'annonucement_composer_model.dart';

class AnnonucementComposerWidget extends StatefulWidget {
  const AnnonucementComposerWidget({
    Key? key,
    this.announcementTitle,
    this.announcementMessage,
    this.saveActionPara,
    this.pagePara,
    Color? announcementBgColor,
    bool? announcementStatus,
    this.announcementResponsive,
  })  : this.announcementBgColor =
            announcementBgColor ?? const Color(0xFFFFF7CC),
        this.announcementStatus = announcementStatus ?? true,
        super(key: key);

  final String? announcementTitle;
  final String? announcementMessage;
  final Future<dynamic> Function()? saveActionPara;
  final String? pagePara;
  final Color announcementBgColor;
  final bool announcementStatus;
  final List<String>? announcementResponsive;

  @override
  _AnnonucementComposerWidgetState createState() =>
      _AnnonucementComposerWidgetState();
}

class _AnnonucementComposerWidgetState
    extends State<AnnonucementComposerWidget> {
  late AnnonucementComposerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnnonucementComposerModel());

    _model.textFieldTitleController ??=
        TextEditingController(text: widget.announcementTitle);
    _model.textFieldTitleFocusNode ??= FocusNode();

    _model.textFieldMessageController ??=
        TextEditingController(text: widget.announcementMessage);
    _model.textFieldMessageFocusNode ??= FocusNode();

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '1isga0p6' /* Enable and Disable Announcemen... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
              Switch.adaptive(
                value: _model.switchAnnouncementStatusValue ??=
                    widget.announcementStatus,
                onChanged: (newValue) async {
                  setState(
                      () => _model.switchAnnouncementStatusValue = newValue!);
                },
                activeColor: FlutterFlowTheme.of(context).primary,
                activeTrackColor: FlutterFlowTheme.of(context).accent1,
                inactiveTrackColor: FlutterFlowTheme.of(context).lineColor,
                inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
              ),
            ],
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('ANNONUCEMENT_COMPOSER_Container_js8fpid6');
              logFirebaseEvent('Container_color_picker');
              final _colorPickedColor = await showFFColorPicker(
                context,
                currentColor: _model.colorPicked ??=
                    FlutterFlowTheme.of(context).primary,
                showRecentColors: true,
                allowOpacity: true,
                textColor: FlutterFlowTheme.of(context).primaryText,
                secondaryTextColor: FlutterFlowTheme.of(context).secondaryText,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                primaryButtonBackgroundColor:
                    FlutterFlowTheme.of(context).primary,
                primaryButtonTextColor: Colors.white,
                primaryButtonBorderColor: Colors.transparent,
                displayAsBottomSheet: isMobileWidth(context),
              );

              if (_colorPickedColor != null) {
                safeSetState(() => _model.colorPicked = _colorPickedColor);
              }
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  widget.announcementBgColor,
                  FlutterFlowTheme.of(context).warningSoft,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
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
                        isDense: true,
                        hintText: FFLocalizations.of(context).getText(
                          'fryg1j23' /* Title */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .labelSmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).labelSmallFamily,
                              color: FlutterFlowTheme.of(context).black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .labelSmallFamily),
                            ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).labelSmallFamily,
                            color: FlutterFlowTheme.of(context).black,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).labelSmallFamily),
                          ),
                      validator: _model.textFieldTitleControllerValidator
                          .asValidator(context),
                    ),
                    TextFormField(
                      controller: _model.textFieldMessageController,
                      focusNode: _model.textFieldMessageFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: FFLocalizations.of(context).getText(
                          '4c5ujvx9' /* Message */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodySmall
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodySmallFamily,
                              color: Color(0xFF423E3E),
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodySmallFamily),
                            ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            color: Color(0xFF423E3E),
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodySmallFamily),
                          ),
                      validator: _model.textFieldMessageControllerValidator
                          .asValidator(context),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '03scp9dp' /* Responsive */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'v3a14poo' /* Tap on the Mobile, Desktop, or... */,
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
              ),
              FlutterFlowChoiceChips(
                options: [
                  ChipData(
                      FFLocalizations.of(context).getText(
                        'vserxkxc' /* Mobile */,
                      ),
                      FFIcons.kmobile),
                  ChipData(
                      FFLocalizations.of(context).getText(
                        'mcsxxiej' /* Desktop */,
                      ),
                      FFIcons.kmonitor),
                  ChipData(
                      FFLocalizations.of(context).getText(
                        'izq2kbg7' /* Web */,
                      ),
                      FFIcons.kglobal)
                ],
                onChanged: (val) =>
                    setState(() => _model.choiceChipsResponsiveValues = val),
                selectedChipStyle: ChipStyle(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodySmallFamily,
                        color: FlutterFlowTheme.of(context).white,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodySmallFamily),
                      ),
                  iconColor: FlutterFlowTheme.of(context).white,
                  iconSize: 18.0,
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                unselectedChipStyle: ChipStyle(
                  backgroundColor: FlutterFlowTheme.of(context).lineColor,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).black,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                  iconColor: FlutterFlowTheme.of(context).black,
                  iconSize: 18.0,
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                chipSpacing: 12.0,
                rowSpacing: 12.0,
                multiselect: true,
                initialized: _model.choiceChipsResponsiveValues != null,
                alignment: WrapAlignment.start,
                controller: _model.choiceChipsResponsiveValueController ??=
                    FormFieldController<List<String>>(
                  widget.announcementResponsive,
                ),
                wrapped: true,
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ].divide(SizedBox(height: 20.0)),
      ),
    );
  }
}
