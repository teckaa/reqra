import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_footer_row_model.dart';
export 'modal_footer_row_model.dart';

class ModalFooterRowWidget extends StatefulWidget {
  const ModalFooterRowWidget({
    Key? key,
    this.cancelTextPara,
    this.proceedTextPara,
    this.proceedActionPara,
    bool? disableProceedBtnPara,
    this.disableProceedBtnColorPara,
  })  : this.disableProceedBtnPara = disableProceedBtnPara ?? false,
        super(key: key);

  final String? cancelTextPara;
  final String? proceedTextPara;
  final Future<dynamic> Function()? proceedActionPara;
  final bool disableProceedBtnPara;
  final Color? disableProceedBtnColorPara;

  @override
  _ModalFooterRowWidgetState createState() => _ModalFooterRowWidgetState();
}

class _ModalFooterRowWidgetState extends State<ModalFooterRowWidget> {
  late ModalFooterRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalFooterRowModel());

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
        children: [
          Divider(
            height: 10.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).lineColor,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                wrapWithModel(
                  model: _model.primaryButtonModel,
                  updateCallback: () => setState(() {}),
                  child: PrimaryButtonWidget(
                    buttonText: valueOrDefault<String>(
                      widget.cancelTextPara,
                      'Cancel',
                    ),
                    buttonBgColor: FlutterFlowTheme.of(context).accent4,
                    buttonTextColor: FlutterFlowTheme.of(context).primaryText,
                    buttonWidth: 120,
                    disableStatusPara: false,
                    buttonHoverBGColor: FlutterFlowTheme.of(context).accent3,
                    buttonAction: () async {
                      logFirebaseEvent(
                          'MODAL_FOOTER_ROW_Container_n5qwj2am_CALL');
                      logFirebaseEvent('PrimaryButton_bottom_sheet');
                      Navigator.pop(context);
                    },
                  ),
                ),
                wrapWithModel(
                  model: _model.primaryButtonLoadingModel,
                  updateCallback: () => setState(() {}),
                  child: PrimaryButtonLoadingWidget(
                    buttonText: valueOrDefault<String>(
                      widget.proceedTextPara,
                      'Proceed',
                    ),
                    buttonWidth: 120,
                    disableStatusPara: widget.disableProceedBtnPara,
                    disableColorPara: widget.disableProceedBtnColorPara,
                    buttonAction: () async {
                      logFirebaseEvent(
                          'MODAL_FOOTER_ROW_Container_qyaczz65_CALL');
                      logFirebaseEvent('PrimaryButtonLoading_execute_callback');
                      await widget.proceedActionPara?.call();
                    },
                  ),
                ),
              ].divide(SizedBox(width: 15.0)),
            ),
          ),
        ],
      ),
    );
  }
}
