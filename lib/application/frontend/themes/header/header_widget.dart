import '/application/frontend/themes/abuja/components/header_abuja/header_abuja_widget.dart';
import '/application/frontend/themes/enugu/components/header_enugu/header_enugu_widget.dart';
import '/application/frontend/themes/lagos/components/header_lagos/header_lagos_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_model.dart';
export 'header_model.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    Key? key,
    this.home,
    this.about,
    this.blog,
    this.faqs,
    this.contact,
    this.products,
    bool? viewMode,
  })  : this.viewMode = viewMode ?? false,
        super(key: key);

  final Color? home;
  final Color? about;
  final Color? blog;
  final Color? faqs;
  final Color? contact;
  final Color? products;
  final bool viewMode;

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late HeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HEADER_COMP_Header_ON_INIT_STATE');
      logFirebaseEvent('Header_action_block');
      await action_blocks.redirectBacktoRegister(context);
      setState(() {});
    });

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
                  model: _model.headerLagosModel,
                  updateCallback: () => setState(() {}),
                  child: HeaderLagosWidget(
                    viewMode: false,
                  ),
                );
              } else if (containerDwAppRecord?.appTheme == 'Abuja') {
                return wrapWithModel(
                  model: _model.headerAbujaModel,
                  updateCallback: () => setState(() {}),
                  child: HeaderAbujaWidget(),
                );
              } else if (containerDwAppRecord?.appTheme == 'Enugu') {
                return wrapWithModel(
                  model: _model.headerEnuguModel,
                  updateCallback: () => setState(() {}),
                  child: HeaderEnuguWidget(),
                );
              } else {
                return Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Visibility(
                    visible: responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '2su788ub' /* Header */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
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
