import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'image_text_side_by_side_with_button_model.dart';
export 'image_text_side_by_side_with_button_model.dart';

class ImageTextSideBySideWithButtonWidget extends StatefulWidget {
  const ImageTextSideBySideWithButtonWidget({
    Key? key,
    String? title,
    String? desc,
    String? btnText,
    this.btnIcon,
    this.photo,
    this.btnAction,
    this.bgColor,
  })  : this.title = title ?? 'Here you can put in your section title',
        this.desc = desc ?? 'Here you can put in your section descriptions',
        this.btnText = btnText ?? 'Click here',
        super(key: key);

  final String title;
  final String desc;
  final String btnText;
  final Widget? btnIcon;
  final String? photo;
  final Future<dynamic> Function()? btnAction;
  final Color? bgColor;

  @override
  _ImageTextSideBySideWithButtonWidgetState createState() =>
      _ImageTextSideBySideWithButtonWidgetState();
}

class _ImageTextSideBySideWithButtonWidgetState
    extends State<ImageTextSideBySideWithButtonWidget> {
  late ImageTextSideBySideWithButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageTextSideBySideWithButtonModel());

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

    return Material(
      color: Colors.transparent,
      elevation: 0.0,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget.bgColor,
            FlutterFlowTheme.of(context).primaryBackground,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: valueOrDefault<double>(
                  FFAppState().appDefaultWebWidth.toDouble(),
                  1280.0,
                ),
                decoration: BoxDecoration(),
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 30.0,
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.center,
                  verticalDirection: VerticalDirection.up,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: valueOrDefault<double>(
                        () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 475.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 800.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 600.0;
                          } else {
                            return 600.0;
                          }
                        }(),
                        600.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.title,
                              'Trade and get paid instantly',
                            ),
                            style: FlutterFlowTheme.of(context).displayLarge,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Text(
                              widget.desc,
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyLargeFamily,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyLargeFamily),
                                    lineHeight: 1.6,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'IMAGE_TEXT_SIDE_BY_SIDE_WITH_BUTTON_Butt');
                                logFirebaseEvent(
                                    'Button-GetStarted_execute_callback');
                                await widget.btnAction?.call();
                              },
                              text: valueOrDefault<String>(
                                widget.btnText,
                                'Get started - it\'s free',
                              ),
                              icon: widget.btnIcon,
                              options: FFButtonOptions(
                                width: 180.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily),
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: valueOrDefault<double>(
                        () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 475.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 800.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 600.0;
                          } else {
                            return 600.0;
                          }
                        }(),
                        600.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            getCORSProxyUrl(
                              valueOrDefault<String>(
                                widget.photo,
                                'https://dummyimage.com/640x5:3/',
                              ),
                            ),
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
