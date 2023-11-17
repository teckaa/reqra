import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'primary_button_model.dart';
export 'primary_button_model.dart';

class PrimaryButtonWidget extends StatefulWidget {
  const PrimaryButtonWidget({
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
  _PrimaryButtonWidgetState createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  late PrimaryButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrimaryButtonModel());

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
              logFirebaseEvent('PRIMARY_BUTTON_COMP_BUTTON_BTN_ON_TAP');
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
        textStyle: FlutterFlowTheme.of(context).labelSmall.override(
              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
              color: widget.buttonTextColor,
              fontWeight: FontWeight.w500,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: widget.buttonBorderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
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
