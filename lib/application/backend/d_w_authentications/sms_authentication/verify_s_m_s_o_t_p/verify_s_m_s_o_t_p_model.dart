import '/application/backend/d_w_authentications/components/auth_header/auth_header_widget.dart';
import '/application/components/buttons/primary_button_loading/primary_button_loading_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'verify_s_m_s_o_t_p_widget.dart' show VerifySMSOTPWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerifySMSOTPModel extends FlutterFlowModel<VerifySMSOTPWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for AuthHeader component.
  late AuthHeaderModel authHeaderModel;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // State field(s) for Timer widget.
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for PrimaryButtonLoading-Verify.
  late PrimaryButtonLoadingModel primaryButtonLoadingVerifyModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    authHeaderModel = createModel(context, () => AuthHeaderModel());
    pinCodeController = TextEditingController();
    primaryButtonLoadingVerifyModel =
        createModel(context, () => PrimaryButtonLoadingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    authHeaderModel.dispose();
    pinCodeController?.dispose();
    timerController.dispose();
    primaryButtonLoadingVerifyModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
