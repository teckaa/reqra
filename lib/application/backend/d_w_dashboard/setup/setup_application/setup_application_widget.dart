import '/application/backend/d_w_dashboard/setup/set_up_application_comp/set_up_application_comp_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'setup_application_model.dart';
export 'setup_application_model.dart';

class SetupApplicationWidget extends StatefulWidget {
  const SetupApplicationWidget({Key? key}) : super(key: key);

  @override
  _SetupApplicationWidgetState createState() => _SetupApplicationWidgetState();
}

class _SetupApplicationWidgetState extends State<SetupApplicationWidget> {
  late SetupApplicationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetupApplicationModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SetupApplication'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Title(
        title: 'Set Up your Application',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: wrapWithModel(
              model: _model.setUpApplicationCompModel,
              updateCallback: () => setState(() {}),
              child: SetUpApplicationCompWidget(
                parameter1: _model.setupStep,
              ),
            ),
          ),
        ));
  }
}
