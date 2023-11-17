import '/application/components/buttons/primary_button/primary_button_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_footer_column_model.dart';
export 'modal_footer_column_model.dart';

class ModalFooterColumnWidget extends StatefulWidget {
  const ModalFooterColumnWidget({
    Key? key,
    this.cancelTextPara,
    this.proceedTextPara,
    this.proceedTextAction,
    bool? disableProceedBtnPara,
    this.disableProceedBtnColorPara,
  })  : this.disableProceedBtnPara = disableProceedBtnPara ?? false,
        super(key: key);

  final String? cancelTextPara;
  final String? proceedTextPara;
  final Future<dynamic> Function()? proceedTextAction;
  final bool disableProceedBtnPara;
  final Color? disableProceedBtnColorPara;

  @override
  _ModalFooterColumnWidgetState createState() =>
      _ModalFooterColumnWidgetState();
}

class _ModalFooterColumnWidgetState extends State<ModalFooterColumnWidget> {
  late ModalFooterColumnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalFooterColumnModel());

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.primaryButtonLoadingModel,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: PrimaryButtonLoadingWidget(
                    buttonText: widget.proceedTextPara,
                    buttonWidth: 400,
                    buttonHeight: 45,
                    disableStatusPara: widget.disableProceedBtnPara,
                    disableColorPara: widget.disableProceedBtnColorPara,
                    buttonAction: () async {
                      logFirebaseEvent(
                          'MODAL_FOOTER_COLUMN_Container_os4qxe2h_C');
                      logFirebaseEvent('PrimaryButtonLoading_execute_callback');
                      await widget.proceedTextAction?.call();
                    },
                  ),
                ),
                wrapWithModel(
                  model: _model.primaryButtonModel,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: PrimaryButtonWidget(
                    buttonText: widget.cancelTextPara,
                    buttonBgColor: FlutterFlowTheme.of(context).accent4,
                    buttonTextColor: FlutterFlowTheme.of(context).primaryText,
                    buttonWidth: 400,
                    buttonHeight: 45,
                    disableStatusPara: false,
                    buttonHoverBGColor: FlutterFlowTheme.of(context).accent3,
                    buttonAction: () async {
                      logFirebaseEvent(
                          'MODAL_FOOTER_COLUMN_Container_1ghqbc0l_C');
                      logFirebaseEvent('PrimaryButton_bottom_sheet');
                      Navigator.pop(context);
                    },
                  ),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ],
      ),
    );
  }
}
