import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'account_balance_model.dart';
export 'account_balance_model.dart';

class AccountBalanceWidget extends StatefulWidget {
  const AccountBalanceWidget({Key? key}) : super(key: key);

  @override
  _AccountBalanceWidgetState createState() => _AccountBalanceWidgetState();
}

class _AccountBalanceWidgetState extends State<AccountBalanceWidget> {
  late AccountBalanceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccountBalanceModel());

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'ur39ol7o' /* Total Balance */,
              ),
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).labelMediumFamily),
                  ),
            ),
            ToggleIcon(
              onPressed: () async {
                setState(() =>
                    FFAppState().toggleBalance = !FFAppState().toggleBalance);
                logFirebaseEvent('ACCOUNT_BALANCE_ToggleIcon_o9koh50g_ON_T');
                if (FFAppState().toggleBalance == false) {
                  logFirebaseEvent('ToggleIcon_update_app_state');
                  setState(() {
                    FFAppState().toggleBalance = false;
                  });
                } else {
                  logFirebaseEvent('ToggleIcon_update_app_state');
                  setState(() {
                    FFAppState().toggleBalance = true;
                  });
                }
              },
              value: FFAppState().toggleBalance,
              onIcon: Icon(
                FFIcons.keyeSlash,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 14.0,
              ),
              offIcon: Icon(
                FFIcons.keye,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 14.0,
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Builder(
              builder: (context) {
                if (FFAppState().toggleBalance == true) {
                  return Text(
                    FFLocalizations.of(context).getText(
                      'y2o6rs5v' /* ****** */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 30.0,
                          letterSpacing: 3.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  );
                } else {
                  return AuthUserStreamWidget(
                    builder: (context) => Text(
                      '${valueOrDefault(currentUserDocument?.currency, '')} ${formatNumber(
                        valueOrDefault(
                            currentUserDocument?.accountBalance, 0.0),
                        formatType: FormatType.decimal,
                        decimalType: DecimalType.periodDecimal,
                      )}',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
