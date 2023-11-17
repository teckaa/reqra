import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DwAppRecord extends FirestoreRecord {
  DwAppRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "app_name" field.
  String? _appName;
  String get appName => _appName ?? '';
  bool hasAppName() => _appName != null;

  // "app_color" field.
  Color? _appColor;
  Color? get appColor => _appColor;
  bool hasAppColor() => _appColor != null;

  // "app_theme" field.
  String? _appTheme;
  String get appTheme => _appTheme ?? '';
  bool hasAppTheme() => _appTheme != null;

  // "app_language" field.
  String? _appLanguage;
  String get appLanguage => _appLanguage ?? '';
  bool hasAppLanguage() => _appLanguage != null;

  // "app_currency" field.
  String? _appCurrency;
  String get appCurrency => _appCurrency ?? '';
  bool hasAppCurrency() => _appCurrency != null;

  // "app_country" field.
  String? _appCountry;
  String get appCountry => _appCountry ?? '';
  bool hasAppCountry() => _appCountry != null;

  // "app_dafault_web_width" field.
  int? _appDafaultWebWidth;
  int get appDafaultWebWidth => _appDafaultWebWidth ?? 0;
  bool hasAppDafaultWebWidth() => _appDafaultWebWidth != null;

  // "app_general_email" field.
  String? _appGeneralEmail;
  String get appGeneralEmail => _appGeneralEmail ?? '';
  bool hasAppGeneralEmail() => _appGeneralEmail != null;

  // "app_alert_email" field.
  String? _appAlertEmail;
  String get appAlertEmail => _appAlertEmail ?? '';
  bool hasAppAlertEmail() => _appAlertEmail != null;

  // "app_support_email" field.
  String? _appSupportEmail;
  String get appSupportEmail => _appSupportEmail ?? '';
  bool hasAppSupportEmail() => _appSupportEmail != null;

  // "announcement_status" field.
  bool? _announcementStatus;
  bool get announcementStatus => _announcementStatus ?? false;
  bool hasAnnouncementStatus() => _announcementStatus != null;

  // "app_web_favicon" field.
  String? _appWebFavicon;
  String get appWebFavicon => _appWebFavicon ?? '';
  bool hasAppWebFavicon() => _appWebFavicon != null;

  // "app_dark_rectangle_logo" field.
  String? _appDarkRectangleLogo;
  String get appDarkRectangleLogo => _appDarkRectangleLogo ?? '';
  bool hasAppDarkRectangleLogo() => _appDarkRectangleLogo != null;

  // "app_light_rectangle_logo" field.
  String? _appLightRectangleLogo;
  String get appLightRectangleLogo => _appLightRectangleLogo ?? '';
  bool hasAppLightRectangleLogo() => _appLightRectangleLogo != null;

  // "app_dark_square_logo" field.
  String? _appDarkSquareLogo;
  String get appDarkSquareLogo => _appDarkSquareLogo ?? '';
  bool hasAppDarkSquareLogo() => _appDarkSquareLogo != null;

  // "app_light_square_logo" field.
  String? _appLightSquareLogo;
  String get appLightSquareLogo => _appLightSquareLogo ?? '';
  bool hasAppLightSquareLogo() => _appLightSquareLogo != null;

  // "app_phone_number" field.
  String? _appPhoneNumber;
  String get appPhoneNumber => _appPhoneNumber ?? '';
  bool hasAppPhoneNumber() => _appPhoneNumber != null;

  void _initializeFields() {
    _appName = snapshotData['app_name'] as String?;
    _appColor = getSchemaColor(snapshotData['app_color']);
    _appTheme = snapshotData['app_theme'] as String?;
    _appLanguage = snapshotData['app_language'] as String?;
    _appCurrency = snapshotData['app_currency'] as String?;
    _appCountry = snapshotData['app_country'] as String?;
    _appDafaultWebWidth =
        castToType<int>(snapshotData['app_dafault_web_width']);
    _appGeneralEmail = snapshotData['app_general_email'] as String?;
    _appAlertEmail = snapshotData['app_alert_email'] as String?;
    _appSupportEmail = snapshotData['app_support_email'] as String?;
    _announcementStatus = snapshotData['announcement_status'] as bool?;
    _appWebFavicon = snapshotData['app_web_favicon'] as String?;
    _appDarkRectangleLogo = snapshotData['app_dark_rectangle_logo'] as String?;
    _appLightRectangleLogo =
        snapshotData['app_light_rectangle_logo'] as String?;
    _appDarkSquareLogo = snapshotData['app_dark_square_logo'] as String?;
    _appLightSquareLogo = snapshotData['app_light_square_logo'] as String?;
    _appPhoneNumber = snapshotData['app_phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dw_app');

  static Stream<DwAppRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DwAppRecord.fromSnapshot(s));

  static Future<DwAppRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DwAppRecord.fromSnapshot(s));

  static DwAppRecord fromSnapshot(DocumentSnapshot snapshot) => DwAppRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DwAppRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DwAppRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DwAppRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DwAppRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDwAppRecordData({
  String? appName,
  Color? appColor,
  String? appTheme,
  String? appLanguage,
  String? appCurrency,
  String? appCountry,
  int? appDafaultWebWidth,
  String? appGeneralEmail,
  String? appAlertEmail,
  String? appSupportEmail,
  bool? announcementStatus,
  String? appWebFavicon,
  String? appDarkRectangleLogo,
  String? appLightRectangleLogo,
  String? appDarkSquareLogo,
  String? appLightSquareLogo,
  String? appPhoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'app_name': appName,
      'app_color': appColor,
      'app_theme': appTheme,
      'app_language': appLanguage,
      'app_currency': appCurrency,
      'app_country': appCountry,
      'app_dafault_web_width': appDafaultWebWidth,
      'app_general_email': appGeneralEmail,
      'app_alert_email': appAlertEmail,
      'app_support_email': appSupportEmail,
      'announcement_status': announcementStatus,
      'app_web_favicon': appWebFavicon,
      'app_dark_rectangle_logo': appDarkRectangleLogo,
      'app_light_rectangle_logo': appLightRectangleLogo,
      'app_dark_square_logo': appDarkSquareLogo,
      'app_light_square_logo': appLightSquareLogo,
      'app_phone_number': appPhoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class DwAppRecordDocumentEquality implements Equality<DwAppRecord> {
  const DwAppRecordDocumentEquality();

  @override
  bool equals(DwAppRecord? e1, DwAppRecord? e2) {
    return e1?.appName == e2?.appName &&
        e1?.appColor == e2?.appColor &&
        e1?.appTheme == e2?.appTheme &&
        e1?.appLanguage == e2?.appLanguage &&
        e1?.appCurrency == e2?.appCurrency &&
        e1?.appCountry == e2?.appCountry &&
        e1?.appDafaultWebWidth == e2?.appDafaultWebWidth &&
        e1?.appGeneralEmail == e2?.appGeneralEmail &&
        e1?.appAlertEmail == e2?.appAlertEmail &&
        e1?.appSupportEmail == e2?.appSupportEmail &&
        e1?.announcementStatus == e2?.announcementStatus &&
        e1?.appWebFavicon == e2?.appWebFavicon &&
        e1?.appDarkRectangleLogo == e2?.appDarkRectangleLogo &&
        e1?.appLightRectangleLogo == e2?.appLightRectangleLogo &&
        e1?.appDarkSquareLogo == e2?.appDarkSquareLogo &&
        e1?.appLightSquareLogo == e2?.appLightSquareLogo &&
        e1?.appPhoneNumber == e2?.appPhoneNumber;
  }

  @override
  int hash(DwAppRecord? e) => const ListEquality().hash([
        e?.appName,
        e?.appColor,
        e?.appTheme,
        e?.appLanguage,
        e?.appCurrency,
        e?.appCountry,
        e?.appDafaultWebWidth,
        e?.appGeneralEmail,
        e?.appAlertEmail,
        e?.appSupportEmail,
        e?.announcementStatus,
        e?.appWebFavicon,
        e?.appDarkRectangleLogo,
        e?.appLightRectangleLogo,
        e?.appDarkSquareLogo,
        e?.appLightSquareLogo,
        e?.appPhoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is DwAppRecord;
}
