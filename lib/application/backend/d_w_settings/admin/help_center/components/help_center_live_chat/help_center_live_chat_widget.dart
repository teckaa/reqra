import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'help_center_live_chat_model.dart';
export 'help_center_live_chat_model.dart';

class HelpCenterLiveChatWidget extends StatefulWidget {
  const HelpCenterLiveChatWidget({
    Key? key,
    this.liveChatUrl,
  }) : super(key: key);

  final String? liveChatUrl;

  @override
  _HelpCenterLiveChatWidgetState createState() =>
      _HelpCenterLiveChatWidgetState();
}

class _HelpCenterLiveChatWidgetState extends State<HelpCenterLiveChatWidget> {
  late HelpCenterLiveChatModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelpCenterLiveChatModel());

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
      alignment: AlignmentDirectional(1.00, 1.00),
      child: Container(
        width: 400.0,
        height: 500.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: FlutterFlowWebView(
          content: 'https://tawk.to/chat/6383e7b3daff0e1306d9b64d/1gitk26kl',
          bypass: false,
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 500.0,
          verticalScroll: true,
          horizontalScroll: true,
        ),
      ),
    );
  }
}
