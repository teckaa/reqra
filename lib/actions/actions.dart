import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Future getStartedAction(BuildContext context) async {
  logFirebaseEvent('GetStartedAction_navigate_to');

  context.pushNamed('Register');
}

Future contactUsAction(BuildContext context) async {
  logFirebaseEvent('ContactUsAction_navigate_to');

  context.pushNamed('Contact');
}

Future backToHomeAction(BuildContext context) async {
  logFirebaseEvent('BackToHomeAction_navigate_to');

  context.pushNamed('Home');
}

Future loginAction(BuildContext context) async {
  logFirebaseEvent('LoginAction_navigate_to');

  context.pushNamed('Login');
}

Future dashboard(BuildContext context) async {
  logFirebaseEvent('Dashboard_navigate_to');

  context.pushNamed('Dashboard');
}

Future copiedAction(
  BuildContext context, {
  String? message,
}) async {
  logFirebaseEvent('CopiedAction_copy_to_clipboard');
  await Clipboard.setData(ClipboardData(
      text: valueOrDefault<String>(
    message,
    'Copied',
  )));
  logFirebaseEvent('CopiedAction_show_snack_bar');
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Copied',
        style: FlutterFlowTheme.of(context).bodyMedium,
      ),
      duration: Duration(milliseconds: 4000),
      backgroundColor: FlutterFlowTheme.of(context).successSoft,
    ),
  );
}

Future alertSuccess(
  BuildContext context, {
  String? descPara,
}) async {
  logFirebaseEvent('AlertSuccess_show_snack_bar');
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        descPara!,
        style: FlutterFlowTheme.of(context).bodySmall,
      ),
      duration: Duration(milliseconds: 4000),
      backgroundColor: FlutterFlowTheme.of(context).successSoft,
    ),
  );
}

Future alertError(
  BuildContext context, {
  String? descPara,
}) async {
  logFirebaseEvent('AlertError_show_snack_bar');
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        descPara!,
        style: FlutterFlowTheme.of(context).bodySmall,
      ),
      duration: Duration(milliseconds: 4000),
      backgroundColor: FlutterFlowTheme.of(context).errorSoft,
    ),
  );
}

Future generalEmailNotification(
  BuildContext context, {
  String? customTemplateName,
}) async {
  DwAppRecord? getAppInfo;
  DwEmailTemplatesRecord? getEmailOptionInfo;
  DwEmailCustomTemplatesRecord? getCustomEmailTemplateInfo;

  // Action 3 - Get app info
  logFirebaseEvent('GeneralEmailNotification_Action3-Getappi');
  getAppInfo = await queryDwAppRecordOnce(
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  // Action 4 - Get email option info
  logFirebaseEvent('GeneralEmailNotification_Action4-Getemai');
  getEmailOptionInfo = await queryDwEmailTemplatesRecordOnce(
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  // Action 5 - Get custom email template info
  logFirebaseEvent('GeneralEmailNotification_Action5-Getcust');
  getCustomEmailTemplateInfo = await queryDwEmailCustomTemplatesRecordOnce(
    queryBuilder: (dwEmailCustomTemplatesRecord) =>
        dwEmailCustomTemplatesRecord.where(
      'name',
      isEqualTo: customTemplateName,
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  logFirebaseEvent('GeneralEmailNotification_backend_call');
  await BrevoApiGroup.emailNotificationCall.call(
    appName: valueOrDefault<String>(
      getEmailOptionInfo?.brandName != null &&
              getEmailOptionInfo?.brandName != ''
          ? getEmailOptionInfo?.brandName
          : getAppInfo?.appName,
      'Teckaa',
    ),
    appEmail: valueOrDefault<String>(
      getEmailOptionInfo?.fromEmail != null &&
              getEmailOptionInfo?.fromEmail != ''
          ? getEmailOptionInfo?.fromEmail
          : getAppInfo?.appGeneralEmail,
      'entrepriseproduct@teckaa.com',
    ),
    customerName: currentUserDisplayName,
    customerEmail: currentUserEmail,
    previewText: getCustomEmailTemplateInfo?.heading,
    subject: getCustomEmailTemplateInfo?.subject,
    content: getCustomEmailTemplateInfo?.content,
    footerText: valueOrDefault<String>(
      getEmailOptionInfo?.footerText != null &&
              getEmailOptionInfo?.footerText != ''
          ? getEmailOptionInfo?.footerText
          : getAppInfo?.appName,
      'Teckaa',
    ),
    additionalText: getEmailOptionInfo?.additionalText,
    brandLogo: getEmailOptionInfo?.brandLogo,
    brandColor: valueOrDefault<String>(
      getEmailOptionInfo?.brandColor != null &&
              getEmailOptionInfo?.brandColor != ''
          ? getEmailOptionInfo?.brandColor
          : '#000000',
      'Teckaa',
    ),
    backgroundColor: valueOrDefault<String>(
      getEmailOptionInfo?.backgroundColor != null &&
              getEmailOptionInfo?.backgroundColor != ''
          ? getEmailOptionInfo?.backgroundColor
          : '#F1F4F8',
      'Teckaa',
    ),
    contentBackgroundColor: valueOrDefault<String>(
      getEmailOptionInfo?.contentBackgroundColor != null &&
              getEmailOptionInfo?.contentBackgroundColor != ''
          ? getEmailOptionInfo?.contentBackgroundColor
          : '#FFFFFF',
      'Teckaa',
    ),
    contentTextColor: valueOrDefault<String>(
      getEmailOptionInfo?.contentTextColor != null &&
              getEmailOptionInfo?.contentTextColor != ''
          ? getEmailOptionInfo?.contentTextColor
          : '#00000',
      'Teckaa',
    ),
  );
}

Future forceClose(BuildContext context) async {}

Future redirectBacktoRegister(BuildContext context) async {
  int? appInfo;
  int? ownerInfo;

  // Action 1 - Get App Info
  logFirebaseEvent('RedirectBacktoRegister_Action1-GetAppInf');
  unawaited(
    () async {
      appInfo = await queryDwAppRecordCount();
    }(),
  );
  // Action 2 - Get Owner Info
  logFirebaseEvent('RedirectBacktoRegister_Action2-GetOwnerI');
  unawaited(
    () async {
      ownerInfo = await queryUsersRecordCount();
    }(),
  );
  if ((appInfo! < 1) && (ownerInfo! < 1)) {
    logFirebaseEvent('RedirectBacktoRegister_navigate_to');

    context.pushNamed('Register');

    return;
  } else {
    logFirebaseEvent('RedirectBacktoRegister_action_block');
    unawaited(
      () async {
        await action_blocks.loginAction(context);
      }(),
    );
    return;
  }
}

Future createUser(BuildContext context) async {}
