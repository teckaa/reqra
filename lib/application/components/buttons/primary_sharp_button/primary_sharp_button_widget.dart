import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'primary_sharp_button_model.dart';
export 'primary_sharp_button_model.dart';

class PrimarySharpButtonWidget extends StatefulWidget {
  const PrimarySharpButtonWidget({
    Key? key,
    String? buttonText,
    Color? buttonBgColor,
    Color? buttonTextColor,
    Color? buttonBorderColor,
    int? buttonWidth,
    int? buttonHeight,
    this.buttonAction,
    bool? disableStatusPara,
    this.disableColorPara,
    int? buttonTextSize,
    Color? buttonHoverBGColor,
    Color? buttonHoverColor,
    Color? buttonHoverBorderColor,
  })  : this.buttonText = buttonText ?? 'Proceed',
        this.buttonBgColor = buttonBgColor ?? Colors.black,
        this.buttonTextColor = buttonTextColor ?? Colors.white,
        this.buttonBorderColor = buttonBorderColor ?? Colors.transparent,
        this.buttonWidth = buttonWidth ?? 100,
        this.buttonHeight = buttonHeight ?? 40,
        this.disableStatusPara = disableStatusPara ?? false,
        this.buttonTextSize = buttonTextSize ?? 14,
        this.buttonHoverBGColor = buttonHoverBGColor ?? Colors.black,
        this.buttonHoverColor = buttonHoverColor ?? Colors.white,
        this.buttonHoverBorderColor =
            buttonHoverBorderColor ?? Colors.transparent,
        super(key: key);

  final String buttonText;
  final Color buttonBgColor;
  final Color buttonTextColor;
  final Color buttonBorderColor;
  final int buttonWidth;
  final int buttonHeight;
  final Future<dynamic> Function()? buttonAction;
  final bool disableStatusPara;
  final Color? disableColorPara;
  final int buttonTextSize;
  final Color buttonHoverBGColor;
  final Color buttonHoverColor;
  final Color buttonHoverBorderColor;

  @override
  _PrimarySharpButtonWidgetState createState() =>
      _PrimarySharpButtonWidgetState();
}

class _PrimarySharpButtonWidgetState extends State<PrimarySharpButtonWidget> {
  late PrimarySharpButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimarySharpButtonModel());

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

    return FFButtonWidget(
      onPressed: widget.disableStatusPara
          ? null
          : () async {
              logFirebaseEvent('PRIMARY_SHARP_BUTTON_BUTTON_BTN_ON_TAP');
              logFirebaseEvent('Button_execute_callback');
              await widget.buttonAction?.call();
            },
      text: widget.buttonText,
      options: FFButtonOptions(
        width: widget.buttonWidth.toDouble(),
        height: widget.buttonHeight.toDouble(),
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: widget.buttonBgColor,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
              color: widget.buttonTextColor,
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: widget.buttonBorderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(0.0),
        disabledColor: widget.disableColorPara,
        disabledTextColor: FlutterFlowTheme.of(context).primaryText,
        hoverColor: widget.buttonHoverBGColor,
        hoverBorderSide: BorderSide(
          color: widget.buttonHoverBorderColor,
          width: 1.0,
        ),
        hoverTextColor: widget.buttonHoverColor,
      ),
      showLoadingIndicator: false,
    );
  }
}
