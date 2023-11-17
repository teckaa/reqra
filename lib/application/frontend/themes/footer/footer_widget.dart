import '/application/frontend/themes/abuja/components/footer_abuja/footer_abuja_widget.dart';
import '/application/frontend/themes/enugu/components/footer_enugu/footer_enugu_widget.dart';
import '/application/frontend/themes/lagos/components/footer_lagos/footer_lagos_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'footer_model.dart';
export 'footer_model.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  _FooterWidgetState createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  late FooterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FooterModel());

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

    return StreamBuilder<List<DwAppRecord>>(
      stream: queryDwAppRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: LinearProgressIndicator(
              color: FlutterFlowTheme.of(context).primary,
            ),
          );
        }
        List<DwAppRecord> containerDwAppRecordList = snapshot.data!;
        final containerDwAppRecord = containerDwAppRecordList.isNotEmpty
            ? containerDwAppRecordList.first
            : null;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(),
          child: Builder(
            builder: (context) {
              if (containerDwAppRecord?.appTheme == 'Lagos') {
                return wrapWithModel(
                  model: _model.footerLagosModel,
                  updateCallback: () => setState(() {}),
                  child: FooterLagosWidget(),
                );
              } else if (containerDwAppRecord?.appTheme == 'Abuja') {
                return wrapWithModel(
                  model: _model.footerAbujaModel,
                  updateCallback: () => setState(() {}),
                  child: FooterAbujaWidget(),
                );
              } else if (containerDwAppRecord?.appTheme == 'Enugu') {
                return wrapWithModel(
                  model: _model.footerEnuguModel,
                  updateCallback: () => setState(() {}),
                  child: FooterEnuguWidget(),
                );
              } else {
                return Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'fm1qdjws' /* Footer */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
